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
 * Stellt Methoden zur Kommunikation mit der Faroo Suchmaschine zur verfuegung.
 * Dabei werden auf die Methoden der abstrakten Oberklasse OnlineSearch zugegriffen.
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
	private static final Logger	log								= Logger.getLogger(FarooSearch.class.getName());

	public FarooSearch()
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
			searchString = URLEncoder.encode(searchString, CHARSET).replaceAll("[ \t\n\f\r]", " ");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
			log.log(Level.SEVERE, e.getMessage());
		}

		URL url = null;
		try
		{
			url = new URL(URL + URL_ARG_SEARCH + searchString + "&" + URL_ARG_ATTRS + "&" + URL_ARG_JSON);
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
