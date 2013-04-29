package info.plagiatsjaeger.onlinesearch;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;

import info.plagiatsjaeger.Control;
import info.plagiatsjaeger.interfaces.IOnlineSearch;


/**
 * Stellt Methoden zur Kommunikation mit der Suchmaschine EntireWeb zur
 * verfuegung. Dabei werden auf die Methoden der Oberklasse OnlineSearch zugegriffen.
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

	private static final Logger	log								= Logger.getLogger(EntirewebSearch.class.getName());

	public EntirewebSearch()
	{
		super();
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
			e.printStackTrace();
			log.log(Level.SEVERE, e.getMessage());
		}

		URL url = null;
		try
		{
			url = new URL(URL + APIKEY + IP + RESULTS + MAX_URLS + FORMAT + searchString);
		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
			log.log(Level.SEVERE, e.getMessage());
		}
		result = search(searchString, url);

		return result;
	}

	@Override
	public ArrayList<String> search(String searchString)
	{
		return buildSearchString(searchString);
	}

}
