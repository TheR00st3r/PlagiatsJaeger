package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IOnlineSearch;

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


/**
 * Description of the class BlekkoSearch.
 */
public class BlekkoSearch implements IOnlineSearch
{
	private static final String APIKEY_CHRISTOPH = "4e04dc3e";
	
	private static final String		URL					= "http://blekko.com/ws/?";
	private static final String		URL_ARG_JSON		= "+%2Fjson";
	private static final String		URL_ARG_AUTH		= "auth=";
	private static final String		URL_ARG_SEARCH		= "q=";
	private static int			MAX_URLS			= 5;
	static String				CHARSET				= "UTF-8";
	private ArrayList<String>	_allSearchResults	= new ArrayList<String>();

	/**
	 * Description of the method search.
	 * 
	 * @param searchString
	 * @return result
	 */
	public ArrayList<String> search(String searchString)
	{
		ArrayList<String> result = null;
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", "+");

			URL url = new URL(URL + URL_ARG_SEARCH + searchString + URL_ARG_JSON + URL_ARG_AUTH + APIKEY_CHRISTOPH);
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
	 * Description of the method getUrlsFromJson.
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

		// Und schlie�lich in der for schleife//
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
					System.out.println(strLink);
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
					System.out.println(strLink);
				}
			}

		}
		_allSearchResults.addAll(alUrlList);
		return alUrlList;

	}

	/**
	 * Description of the method cleanUrl.
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

	/**
	 * Description of the interface OnLinkFoundListener.
	 */
	public interface OnLinkFoundListener
	{

		/**
		 * Description of the method onLinkFound.
		 * 
		 * @param link
		 */
		public void onLinkFound(String link);

	}

}