package info.plagiatsjaeger.onlinesearch;

import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.apache.log4j.Logger;


/**
 * Stellt Methoden zur Kommunikation mit der Blekko Suchmaschine zur verfuegung.
 * Dabei werden auf die Methoden der Oberklasse OnlineSearch zugegriffen.
 * 
 * @author Andreas
 */
public class BlekkoSearch extends OnlineSearch implements IOnlineSearch
{
	private static final String	APIKEY_CHRISTOPH	= "4e04dc3e";
	private static final String	URL					= "http://blekko.com/ws/?";
	private static final String	URL_ARG_JSON		= "+%2Fjson";
	private static final String	URL_ARG_AUTH		= "auth=";
	private static final String	URL_ARG_SEARCH		= "q=";

	private static final Logger	_logger				= Logger.getLogger(BlekkoSearch.class.getName());

	public BlekkoSearch()
	{
		super();
	}

	@Override
	public URL buildSearchString(String searchString)
	{
		URL result = null;
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", "+");
		}
		catch (UnsupportedEncodingException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}

		
		try
		{
			result = new URL(URL + URL_ARG_SEARCH + searchString + URL_ARG_JSON);
		}
		catch (MalformedURLException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
}