package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.SearchResult;

import java.util.ArrayList;


/**
 * Callbackhandler für die Rückmeldung bei gefundenen Suchergebnissen.
 * 
 * @see IComparer
 * @author Andreas
 */
public interface OnCompareFinishedListener
{
	/**
	 * Wird aufgerufen wenn der Vergleich mit einer Webseite beendet wurde.
	 * 
	 * @param searchResult
	 * @param link
	 */
	public void onLinkFound(ArrayList<SearchResult> searchResult, String link);

	/**
	 * Wird aufgerufen wenn der Vergleich mit einem anderen Dokument beendet
	 * wurde.
	 * 
	 * @param searchResult
	 * @param link
	 */
	public void onLinkFound(ArrayList<SearchResult> searchResult, int docId);
}
