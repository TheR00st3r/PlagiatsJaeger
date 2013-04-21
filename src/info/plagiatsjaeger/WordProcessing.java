package info.plagiatsjaeger;

import java.util.ArrayList;
import java.util.HashSet;


/**
 * Stellt Funktionen zum bearbeiten/aufbereiten von Texten zur Verfügung.
 * 
 * @author Andreas
 * 
 */
public class WordProcessing
{

	/**
	 * Teilt den gegebenen Text in einzelne Woerter auf.
	 * 
	 * @param text
	 *            Text der aufgeteilt werden soll.
	 * @return Array mit Allen Woertern.
	 */
	public String[] splitToWords(String text)
	{
		String[] result = null;
		text = text.replaceAll("\n", "\n ");
		result = text.split("[ \t\f\r]");
		return result;
	}

	public ArrayList<String> getVerbsAndNouns(String text)
	{
		ArrayList<String> result = null;

		return result;
	}

	private ArrayList<String> getVerbsAndNouns(HashSet<String> taggedWords)
	{
		ArrayList<String> result = null;

		return result;
	}

	private String tagText(String textToTag)
	{
		String result = null;

		return result;
	}

}