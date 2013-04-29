package info.plagiatsjaeger.onlinesearch;

import info.plagiatsjaeger.Control;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Logger;


/**
 * Stellt Methoden zur Kommunikation mit der Blekko Suchmaschine zur verfuegung.
 * Dabei werden auf die Methoden der Oberklasse OnlineSearch zugegriffen.
 * 
 * @author Andreas
 */
public class BlekkoSearch extends OnlineSearch
{
	private static final String	APIKEY_CHRISTOPH	= "4e04dc3e";
	private static final String	URL					= "http://blekko.com/ws/?";
	private static final String	URL_ARG_JSON		= "+%2Fjson";
	private static final String	URL_ARG_AUTH		= "auth=";
	private static final String	URL_ARG_SEARCH		= "q=";
	private static final Logger	log					= Logger.getLogger(BlekkoSearch.class.getName());

	public BlekkoSearch()
	{
		Handler handler;
		try
		{
			handler = new FileHandler(Control.LOGGING_FOLDER + "log.txt");
			log.addHandler(handler);
		}
		catch (SecurityException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<String> buildSearchString(String searchString)
	{
		ArrayList<String> result = new ArrayList<String>();
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", "+");
		}
		catch (UnsupportedEncodingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		URL url = null;
		try
		{
			url = new URL(URL + URL_ARG_SEARCH + searchString + URL_ARG_JSON);
		}
		catch (MalformedURLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result = search(searchString, url);

		return result;
	}
}