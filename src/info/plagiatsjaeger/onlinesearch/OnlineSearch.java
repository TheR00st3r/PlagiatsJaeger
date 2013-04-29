package info.plagiatsjaeger.onlinesearch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;

import info.plagiatsjaeger.WordProcessing;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;

/**
 * Diese Abstrakte Klasse stellt den Klassen für die einzelnen Suchmaschinen entsprechende 
 * Methoden zur Verfügung
 * @author FischerC
 *
 */
public abstract class OnlineSearch
{

	private ArrayList<String>		_allSearchResults				= new ArrayList<String>();
	protected static final int		NUM_WORDS_FOR_SEARCH_DEFAULT	= 10;
	private OnLinkFoundListener		_onLinkFoundListener;
	private static int				MAX_URLS						= 5;
	protected static final String	CHARSET							= "UTF-8";

	public ArrayList<String> search(String searchString, URL _URL)
	{
		ArrayList<String> result = null;
		try
		{
			InputStreamReader reader = new InputStreamReader(_URL.openStream(), CHARSET);

			BufferedReader bufferedReader = new BufferedReader(reader);

			StringBuilder stringBuilder = new StringBuilder();
			String line = bufferedReader.readLine();
			while (line != null)
			{
				stringBuilder.append(line);
				line = bufferedReader.readLine();
			}
			result = getUrlsFromJson(stringBuilder.toString());
		}

		catch (IOException e)
		{
			e.printStackTrace();
		}

		return result;
	}

	public void searchAsync(final String searchString, final int numWordsToSearchFor)
	{
		new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				WordProcessing wordProcessing = new WordProcessing();
				String[] words = wordProcessing.splitToWords(searchString);
				for (int i = 0; i < words.length - numWordsToSearchFor; i += numWordsToSearchFor)
				{
					String searchString = "";
					for (int j = 0; j < numWordsToSearchFor; j++)
					{
						if (searchString.length() > 0)
						{
							searchString += " ";
						}
						searchString += words[i + j];
					}
					buildSearchString(searchString);
				}
			}
		}).start();

	}

	protected abstract ArrayList<String> buildSearchString(String searchString);

	/**
	 * Extrahiert die Links aus dem eingegebenen String. Wenn ein
	 * {@link OnLinkFoundListener} registriert ist werden diesem die Links
	 * Uebermittelt.
	 * 
	 * @param searchResult
	 * @return result
	 */
	protected ArrayList<String> getUrlsFromJson(String searchResult)
	{
		ArrayList<String> alUrlList = new ArrayList<String>();
		// Matchpattern
		// Altes JSON
		Pattern patPattern = Pattern.compile("\"url\"\\s*?:\\s*?\"([^\"]+?)\"");
		// Neues JSON
		Pattern patPatternNew = Pattern.compile("\"displayUrl\"\\s*?:\\s*?\"([^\"]+?)\"");

		Matcher matMatcher;

		// Und schliesslich in der for schleife//
		matMatcher = patPattern.matcher(searchResult);

		if (matMatcher.find())
		{
			// Falls matcher nicht leer ist
			matMatcher.reset();

			int numURL = 0;
			while (numURL < MAX_URLS && matMatcher.find())
			{
				numURL++;
				String strLink = cleanUrl(Jsoup.parse(matMatcher.group(1)).text());
				// Falls Link bereits in _serchResults vorhanden nicht nochmal
				// schicken
				if (!_allSearchResults.contains(strLink))
				{
					alUrlList.add(strLink);
					// System.out.println(strLink);
					// TODO: eventuell direkt in neuem Thread zurückgeben
					if (_onLinkFoundListener != null) _onLinkFoundListener.onLinkFound(strLink);
				}
			}
		}
		else
		{
			matMatcher = patPatternNew.matcher(searchResult);
			matMatcher.reset();
			int numURL = 0;
			while (numURL < MAX_URLS && matMatcher.find())
			{
				numURL++;
				String strLink = cleanUrl(Jsoup.parse(matMatcher.group(1)).text());
				// Falls Link bereits in _serchResults vorhanden nicht nochmal
				// schicken
				if (!_allSearchResults.contains(strLink))
				{
					alUrlList.add(strLink);
					// System.out.println(strLink);
				}
			}

		}
		_allSearchResults.addAll(alUrlList);
		return alUrlList;
	}

	/**
	 * Bereinigt eine Url, sodass sie immer vollstaendig ist
	 * 
	 * @param dirtyUrl
	 * @return result
	 */
	protected String cleanUrl(String dirtyUrl)
	{
		String result = "";
		dirtyUrl = dirtyUrl.replaceAll("www.", "");
		dirtyUrl = dirtyUrl.replaceAll("http://", "");
		result = "http://" + dirtyUrl;
		return result;
	}

	public void setOnLinkFoundListener(OnLinkFoundListener listener)
	{
		_onLinkFoundListener = listener;
	}

}
