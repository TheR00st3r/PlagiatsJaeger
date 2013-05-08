package info.plagiatsjaeger.onlinesearch;

import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.apache.log4j.Logger;


/**
 * Stellt Methoden zur Kommunikation mit der Suchmaschine EntireWeb zur
 * verfuegung. Dabei werden auf die Methoden der Oberklasse OnlineSearch
 * zugegriffen.
 * 
 * @author Christian
 */
public class EntirewebSearch extends OnlineSearch implements IOnlineSearch
{

	// http://www.entireweb.com/xmlquery?pz=<yourPartnerId>&ip=<clientsIp>&q=<query>[&<param>=<value>...]
	// http://www.entireweb.com/xmlquery?
	// pz=01234567012345670123456701234567&ip=1.2.3.4&n=10&of=0&sc=9&
	// format=json&q=entireweb+search+engine
	private static final String	URL								= "http://www.entireweb.com/xmlquery?";
	// hier Key einfügen
	private static final String	APIKEY							= "pz=";
	// IP des Clients (nötig)
	private static final String	IP								= "&ip=";
	private static final String	RESULTS							= "&n=";												// n=5,
	private static int			MAX_URLS						= 5;
	private static final String	FORMAT							= "&of=0&format=json&q=";								// of=Seite1
	public static final int		NUM_WORDS_FOR_SEARCH_DEFAULT	= 10;

	private static final Logger	_logger							= Logger.getLogger(EntirewebSearch.class.getName());

	public EntirewebSearch()
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
			result = new URL(URL + APIKEY + IP + RESULTS + MAX_URLS + FORMAT + searchString);
		}
		catch (MalformedURLException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
}
