package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.SearchResult;

import java.util.ArrayList;


/**
 * Schnittstelle zum Vergleichen von Texten
 * 
 * @author Andreas
 * 
 */
public interface IComparer
{

	/**
	 * Vergleicht zwei eingegebene Texte und gibt die Zugehörigen {@link SearchResult SearchResults} zurück.
	 * 
	 * @param originalText
	 * @param textToCheck
	 * @return result
	 */
	public ArrayList<SearchResult> compareText(String originalText, String textToCheck);

	/**
	 * Vergleicht zwei Dateien und gibt die Zugehörigen {@link SearchResult SearchResults} zurück.
	 * 
	 * @param filePathSource
	 * @param filePathToCheck
	 * @return result
	 */
	public ArrayList<SearchResult> compareFiles(String filePathSource, String filePathToCheck);

}