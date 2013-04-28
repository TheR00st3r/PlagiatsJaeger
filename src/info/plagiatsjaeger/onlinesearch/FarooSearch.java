package info.plagiatsjaeger.onlinesearch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;

import info.plagiatsjaeger.WordProcessing;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;


/**
 * Stellt Methoden zur Kommunikation mit der Faroo Suchmaschine zur verfuegung.
 * Dabei ist die Schnittstelle {@link IOnlineSearch} implementiert.
 * 
 * @author Andreas
 */
public class FarooSearch implements IOnlineSearch
{

	public static final int		NUM_WORDS_FOR_SEARCH_DEFAULT	= 10;

	// http://www.faroo.com/api?q=iphone&start=1&length=10&l=en&src=web&f=json
	private static final String	URL								= "http://www.faroo.com/api?";
	private static final String	URL_ARG_JSON					= "f=json";
	private static final String	URL_ARG_ATTRS					= "start=1&length=10&l=de&src=web";
	private static final String	URL_ARG_SEARCH					= "q=";
	private static int			MAX_URLS						= 5;
	static String				CHARSET							= "UTF-8";
	private ArrayList<String>	_allSearchResults				= new ArrayList<String>();

	private OnLinkFoundListener	_onLinkFoundListener;

	@Override
	public ArrayList<String> search(String searchString)
	{
		ArrayList<String> result = null;
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", " ");

			URL url = new URL(URL + URL_ARG_SEARCH + searchString + "&" + URL_ARG_ATTRS + "&" + URL_ARG_JSON);
			InputStreamReader reader = new InputStreamReader(url.openStream(), CHARSET);

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
			e.printStackTrace();
		}

		return result;
	}

	@Override
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
							searchString += "%20";
						}
						searchString += words[i + j];
					}
					search(searchString);
				}
			}
		}).start();
	}

	/**
	 * Extrahiert die Links aus dem eingegebenen String. Wenn ein
	 * {@link OnLinkFoundListener} registriert ist werden diesem die Links
	 * Uebermittelt.
	 * 
	 * @param searchResult
	 * @return result
	 */
	private ArrayList<String> getUrlsFromJson(String searchResult)
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
					if (_onLinkFoundListener != null) _onLinkFoundListener.onLinkFound(strLink);
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
	private String cleanUrl(String dirtyUrl)
	{
		String result = "";
		dirtyUrl = dirtyUrl.replaceAll("www.", "");
		dirtyUrl = dirtyUrl.replaceAll("http://", "");
		result = "http://" + dirtyUrl;
		return result;
	}

	@Override
	public void setOnLinkFoundListener(OnLinkFoundListener listener)
	{
		_onLinkFoundListener = listener;
	}

}
