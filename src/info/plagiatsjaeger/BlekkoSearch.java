package info.plagiatsjaeger;

import java.util.HashSet;



/**
 * Description of the class BlekkoSearch.
 *
 *
 */
public class BlekkoSearch implements IOnlineSearch{

	private static String URL = "http://blekko.com/ws/?";
	private static String URL_ARG_JSON = "+%2Fjson";
	private static String URL_ARG_SEARCH = "q=";
	private static int MAX_URLS = 5;
	static String CHARSET = "UTF-8";


	/**
	 * Description of the method search.
	 *
	 * @param searchString
	 * @return result
	 */
	public ArrayList search(String searchString) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Description of the method getUrlsFromJson.
	 *
	 * @param searchResult
	 * @return result
	 */
	private ArrayList getUrlsFromJson(String searchResult) {

	}

	/**
	 * Description of the method cleanUrl.
	 *
	 * @param dirtyUrl
	 * @return result
	 */
	private String cleanUrl(String dirtyUrl) {

	}

	
	/**
	 *  Description of the interface OnLinkFoundListener.
	 *
	 *
	 */
	public interface OnLinkFoundListener {


	    /**
	     *  Description of the method onLinkFound.
	     *
	     *
	     * @param link
	     */
	    public void onLinkFound(String link) ;

	}

}