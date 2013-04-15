package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.util.ArrayList;


/**
 * Description of the class BlekkoSearch.
 */
public class BlekkoSearch implements IOnlineSearch
{

	private static String	URL				= "http://blekko.com/ws/?";
	private static String	URL_ARG_JSON	= "+%2Fjson";
	private static String	URL_ARG_SEARCH	= "q=";
	private static int		MAX_URLS		= 5;
	static String			CHARSET			= "UTF-8";

	/**
	 * Description of the method search.
	 * 
	 * @param searchString
	 * @return result
	 */
	public ArrayList<SearchResult> search(String searchString)
	{
		ArrayList<SearchResult> result = null;
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
		ArrayList<String> result = null;

		return result;
	}

	/**
	 * Description of the method cleanUrl.
	 * 
	 * @param dirtyUrl
	 * @return result
	 */
	private String cleanUrl(String dirtyUrl)
	{
		String result = null;

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