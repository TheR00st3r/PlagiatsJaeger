package info.plagiatsjaeger.onlinesearch;

import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.log4j.Logger;


/**
 * Stellt Methoden zur Kommunikation mit der Faroo Suchmaschine zur verfuegung.
 * Dabei werden auf die Methoden der abstrakten Oberklasse OnlineSearch
 * zugegriffen.
 * 
 * @author Andreas
 */
public class FarooSearch extends OnlineSearch implements IOnlineSearch
{

	public static final int		NUM_WORDS_FOR_SEARCH_DEFAULT	= 10;

	// http://www.faroo.com/api?q=iphone&start=1&length=10&l=en&src=web&f=json
	private static final String	URL								= "http://www.faroo.com/api?";
	private static final String	URL_ARG_JSON					= "f=json";
	private static final String	URL_ARG_ATTRS					= "start=1&length=10&l=de&src=web";
	private static final String	URL_ARG_SEARCH					= "q=";

	private static final Logger	_logger							= Logger.getLogger(FarooSearch.class.getName());

	public FarooSearch()
	{
		super();
	}

	@Override
	public URL buildSearchString(String searchString)
	{
		URL result = null;
		try
		{
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", " ");
		}
		catch (UnsupportedEncodingException e)
		{
			_logger.fatal(e.getMessage(), e);
		}
		try
		{
			result = new URL(URL + URL_ARG_SEARCH + searchString + "&" + URL_ARG_ATTRS + "&" + URL_ARG_JSON);
		}
		catch (MalformedURLException e)
		{
			_logger.fatal(e.getMessage(), e);
		}

		return result;
	}
}
