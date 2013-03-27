package plagiatssoftware;

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


/**
 * Enthält Funktionen zum Suchen in der Suchmaschine <a
 * href="http://blekko.com">Blekko</a>
 * 
 * @author Andreas
 */
public class BlekkoSearch
{
	private static final String	URL				= "http://blekko.com/ws/?";
	private static final String	URL_ARG_JSON	= "+%2Fjson";
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
			url = new URL(URL +  URL_ARG_SEARCH + URLEncoder.encode(textToSearch, CHARSET) + URL_ARG_JSON);
			InputStreamReader reader = new InputStreamReader(url.openStream(), CHARSET);
			
			BufferedReader bufferedReader = new BufferedReader(reader);

			StringBuilder stringBuilder = new StringBuilder();
			String line = bufferedReader.readLine();
			while (line != null)
			{
				stringBuilder.append(line);
				line = bufferedReader.readLine();
			}
			this.getUrlFromJson(stringBuilder.toString());
			//System.out.println(stringBuilder.toString());

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
	 * Holt URLs aus json 
	 * 
	 * @param strSearchLink
	 * @return Gibt Liste der URLs zurueck
	 */
	private ArrayList<String> getUrlFromJson(String strSearchLink)
	{	
		ArrayList<String> alUrlList = new ArrayList<String>();
		//Matchpattern
		Pattern patPattern = Pattern.compile("\"url\"\\s*?:\\s*?\"([^\"]+?)\"");
		Matcher matMatcher;
		 
		//Und schließlich in der for schleife//
		matMatcher = patPattern.matcher(strSearchLink);
		
		while(matMatcher.find())
		{
			alUrlList.add(matMatcher.group(1));
		}
		return alUrlList; 
	}

}
