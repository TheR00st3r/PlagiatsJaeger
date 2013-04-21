package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.SearchResult;

import java.util.HashMap;


/**
 * Schnittstelle zum Vergleichen von Texten
 * 
 * @author Andreas
 * 
 */
public interface IComparer
{

	/**
	 * Vergleicht zwei eingegebene Texte und schreibt die {@link SearchResult SearchResults} in eine {@link HashMap}.
	 * 
	 * @param originalText
	 * @param textToCheck
	 */
	public void compareText(String originalText, String textToCheck, String link);

	/**
	 * Vergleicht zwei eingegebene Texte und schreibt die {@link SearchResult SearchResults} in eine {@link HashMap}.
	 * 
	 * @param originalText
	 * @param textToCheck
	 */
	public void compareText(String originalText, String textToCheck, int docId);
	
	/**
	 * Liefert die gefundenen Suchergebnisse zur�ck.
	 * @return
	 */
	public HashMap<Integer, SearchResult> getSearchResults();
}