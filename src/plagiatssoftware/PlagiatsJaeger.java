package plagiatssoftware;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.jsoup.Jsoup;

import tests.WordProcessing;


/**
 * Die Klasse managed die komplette Plagiatssuche. Sie bietet eine Funktion zum starten der Suche. Daraufhin werden die
 * benötigten Daten geladen, die Internetrecherche gestartet und die gefundenen Seiten verglichen.
 * 
 * @author Andreas
 */
public class PlagiatsJaeger
{

	private static final int	NUM_WORDS_FOR_BLEKKO	= 10;
	//TODO: Filepath eintragen
	private static final String	ROOT_FILES	         = "\\";

	private RabinKarpComparer	_rabinKarpComparer;
	private WordProcessing	    _wordProcessing;
	private BlekkoSearch	    _blekkoSearch;
	private MYSQLDataBaseHelper	_mySQLDataBaseHelper;

	public PlagiatsJaeger()
	{

	}

	public void start(int rID)
	{
		if (_rabinKarpComparer == null)
		{
			_rabinKarpComparer = new RabinKarpComparer();
		}
		if (_wordProcessing == null)
		{
			_wordProcessing = new WordProcessing();
		}
		if (_blekkoSearch == null)
		{
			_blekkoSearch = new BlekkoSearch();
		}
		if (_mySQLDataBaseHelper == null)
		{
			_mySQLDataBaseHelper = new MYSQLDataBaseHelper();
		}

		System.out.println("Klassen initialisiert");

		String textToCheck = loadFileToString(ROOT_FILES + rID + ".txt");

		System.out.println("Datei geladen");

		ArrayList<String> alVerbsAndNouns = _wordProcessing.getVerbsAndNouns(textToCheck);

		System.out.println("Verben und Nomen geladen");

		ArrayList<String> alURLs = new ArrayList<String>();
		for (int i = 0; i < alVerbsAndNouns.size() - NUM_WORDS_FOR_BLEKKO; i += NUM_WORDS_FOR_BLEKKO)
		{
			String strSearch = "";
			for (int j = 0; j < NUM_WORDS_FOR_BLEKKO; j++)
			{
				if (strSearch.length() > 0)
				{
					strSearch += " ";
				}
				strSearch += alVerbsAndNouns.get(i + j);
			}

			System.out.println("Aktueller SearchString: " + strSearch);

			alURLs.addAll(_blekkoSearch.search(strSearch));
		}

		ArrayList<SearchResult> searchResults = checkAllSites(textToCheck, alURLs);

		for (SearchResult searchResult : searchResults)
		{
			System.out.println(searchResult.getreihenfolge() + " " + searchResult.getorginalText() + "    " + searchResult.getplagiatsText() + "    " + searchResult.getlink());
		}
		try
		{
			_mySQLDataBaseHelper.insertSearchResultIntoTable(searchResults);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("FERTIG!");
	}

	/**
	 * Die Funktion baut die Suchergebnisse über alle URLs zusammen.
	 * 
	 * @param urls
	 * @param wordsToCheck
	 * @return
	 */
	private ArrayList<SearchResult> checkAllSites(String textToCheck, ArrayList<String> urls)
	{
		return checkAllSites(textToCheck, urls, 0);
	}

	/**
	 * Die Funktion baut die Suchergebnisse über alle URLs zusammen.
	 * 
	 * @param urls
	 * @param wordsToCheck
	 * @return
	 */
	private ArrayList<SearchResult> checkAllSites(String textToCheck, ArrayList<String> urls, int startReihenfolge)
	{
		ArrayList<SearchResult> result = new ArrayList<SearchResult>();
		if (urls != null && urls.size() > 0)
		{
			if (_rabinKarpComparer == null)
			{
				_rabinKarpComparer = new RabinKarpComparer();
			}
			if (_wordProcessing == null)
			{
				_wordProcessing = new WordProcessing();
			}
			String[] wordsToCheck = _wordProcessing.splitToWords(Jsoup.parse(textToCheck).text());
			result = _rabinKarpComparer.search(wordsToCheck, new StringBuilder(Jsoup.parse(loadURL(urls.get(0))).text()), urls.get(0), startReihenfolge);
			// Solange noch URLs in der Liste stehen wird die Funktion rekursiv
			// aufgerufen
			if (urls.size() > 1)
			{

				System.out.println("URL: " + urls.get(0));

				urls.remove(0);
				ArrayList<SearchResult> resultTmp = new ArrayList<SearchResult>();
				for (int i = 0; i < result.size(); i++)
				{
					if (result.get(i).getplagiatsText().length() <= 0)
					{
						resultTmp.addAll(checkAllSites(result.get(i).getorginalText(), urls, result.get(i).getreihenfolge()));
						result.remove(i);
					}
				}
				result.addAll(resultTmp);
			}
		}
		else
		{
			System.out.println("Keine URLS zum durchsuchen");
		}
		return result;
	}

	/**
	 * Läd eine Datei in einen String
	 * 
	 * @param fileName
	 *            Datei die geladen werden soll
	 * @return Inhalt der Datei als String
	 * @throws IOException
	 */
	private String loadFileToString(String fileName)
	{
		String result = "";
		File file = new File(fileName);
		StringBuffer stringBuffer = new StringBuffer();
		BufferedReader bufferedReader = null;

		try
		{
			bufferedReader = new BufferedReader(new FileReader(file));
			String strLine = null;

			while ((strLine = bufferedReader.readLine()) != null)
			{
				stringBuffer.append(strLine).append(System.getProperty("line.separator"));
			}
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (bufferedReader != null)
				{
					bufferedReader.close();
				}
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
			result = stringBuffer.toString();
		}
		return result;
	}

	private String loadURL(String strURL)
	{
		StringBuilder result = new StringBuilder();

		try
		{
			URL url = new URL(strURL);
			InputStreamReader reader = new InputStreamReader(url.openStream(), "UTF-8");

			BufferedReader bufferedReader = new BufferedReader(reader);

			String line = bufferedReader.readLine();
			while (line != null)
			{
				result.append(line);
				line = bufferedReader.readLine();
			}

		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}

}
