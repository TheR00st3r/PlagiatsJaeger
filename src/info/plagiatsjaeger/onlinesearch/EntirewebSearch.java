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


public class EntirewebSearch implements IOnlineSearch
{

	// http://www.entireweb.com/xmlquery?pz=<yourPartnerId>&ip=<clientsIp>&q=<query>[&<param>=<value>...]
	// http://www.entireweb.com/xmlquery?
	// pz=01234567012345670123456701234567&ip=1.2.3.4&n=10&of=0&sc=9&
	// format=json&q=entireweb+search+engine
	private static final String	URL								= "http://www.entireweb.com/xmlquery?";
	private static final String	APIKEY							= "pz=";								// hier
																										// Key
																										// einfügen
	private static final String	IP								= "&ip=";								// IP
																										// des
																										// Clients
																										// (nötig)
	private static final String	RESULTS							= "&n=";								// n=5,
	private static int			MAX_URLS						= 5;
	private static final String	FORMAT							= "&of=0&format=json&q=";				// of=Seite1
	static String				CHARSET							= "UTF-8";
	private ArrayList<String>	_allSearchResults				= new ArrayList<String>();
	private OnLinkFoundListener	_onLinkFoundListener;
	public static final int		NUM_WORDS_FOR_SEARCH_DEFAULT	= 10;

	@Override
	public ArrayList<String> search(String searchString)
	{
		ArrayList<String> result = null;
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", "+");

			URL url = new URL(URL + APIKEY + IP + RESULTS + MAX_URLS + FORMAT + searchString);
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

	/**
	 * Extrahiert die Links aus dem eingegebenen String. Wenn ein
	 * {@link OnLinkFoundListener} registriert ist werden diesem die Links
	 * übermittelt.
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

	private String cleanUrl(String dirtyUrl)
	{
		String result = "";
		dirtyUrl = dirtyUrl.replaceAll("www.", "");
		dirtyUrl = dirtyUrl.replaceAll("http://", "");
		result = "http://" + dirtyUrl;
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

	@Override
	public void setOnLinkFoundListener(OnLinkFoundListener listener)
	{
		_onLinkFoundListener = listener;
	}

}
