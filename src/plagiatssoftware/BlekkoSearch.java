package plagiatssoftware;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;


/**
 * Enthält Funktionen zum Suchen in der Suchmaschine <a
 * href="http://blekko.com">Blekko</a>
 * 
 * @author Andreas
 */
public class BlekkoSearch
{
	private static final String	URL				= "http://blekko.com/ws/?";
	private static final String	URL_ARG_JSON	= "+/json";
	private static final String	URL_ARG_SEARCH	= "q=";

	private static final String	CHARSET			= "UTF-8";

	public BlekkoSearch()
	{
	}

	/**
	 * Sucht auf der Suchmaschine Blekko nach Treffern für den gegebenen Text
	 * 
	 * @param textToSearch
	 * @return ArrayList mit den Ergebnis-Links
	 */
	public ArrayList<String> search(String textToSearch)
	{
		ArrayList<String> result = new ArrayList<String>();

		textToSearch = textToSearch.replaceAll("[ \t\n\f\r]", "+");

		URL url;
		try
		{
			url = new URL(URL + URL_ARG_JSON + URL_ARG_SEARCH + URLEncoder.encode(textToSearch, CHARSET));
			InputStreamReader reader = new InputStreamReader(url.openStream(), CHARSET);

			BufferedReader bufferedReader = new BufferedReader(reader);

			StringBuilder stringBuilder = new StringBuilder();
			String line = bufferedReader.readLine();
			while (line != null)
			{
				stringBuilder.append(line);
				line = bufferedReader.readLine();
			}
			//TODO: JSON String Parsen
			System.out.println(stringBuilder.toString());

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

}
