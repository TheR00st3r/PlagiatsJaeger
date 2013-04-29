package info.plagiatsjaeger.interfaces;

import info.plagiatsjaeger.types.CompareResult;

import java.util.HashMap;


/**
 * Schnittstelle zum Vergleichen von Texten
 * 
 * @author Andreas
 */
public interface IComparer
{

	/**
	 * Vergleicht zwei eingegebene Texte und schreibt die {@link CompareResult
	 * CompareResults} in eine {@link HashMap}.
	 * 
	 * @param checkText
	 * @param sourceText
	 */
	public void compareText(String checkText, String sourceText, String link);

	/**
	 * Vergleicht zwei eingegebene Texte und schreibt die {@link CompareResult
	 * CompareResults} in eine {@link HashMap}.
	 * 
	 * @param checkText
	 * @param sourceText
	 */
	public void compareText(String checkText, String sourceText, int docId);

	/**
	 * Registriert einen {@link OnCompareFinishedListener} um auf gefundene
	 * Suchergebnisse zu reagieren.
	 * 
	 * @param listener
	 */
	public void setOnCompareFinishedListener(OnCompareFinishedListener listener);
}