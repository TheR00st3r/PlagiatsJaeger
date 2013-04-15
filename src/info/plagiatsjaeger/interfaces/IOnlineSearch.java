package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.SearchResult;

import java.util.ArrayList;


/**
 * Description of the interface IOnlineSearch.
 */
public interface IOnlineSearch
{

	/**
	 * Description of the method search.
	 * 
	 * @param searchString
	 * @return result
	 */
	public ArrayList<SearchResult> search(String searchString);

}