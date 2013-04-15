package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.SearchResult;

import java.util.HashSet;


/**
 * Description of the interface IComparer.
 */
public interface IComparer
{

	/**
	 * Description of the method compareText.
	 * 
	 * @param originalText
	 * @param textToCheck
	 * @return result
	 */
	public HashSet<SearchResult> compareText(String originalText, String textToCheck);

	/**
	 * Description of the method compareFiles.
	 * 
	 * @param filePathSource
	 * @param filePathToCheck
	 * @return result
	 */
	public HashSet<SearchResult> compareFiles(String filePathSource, String filePathToCheck);

}