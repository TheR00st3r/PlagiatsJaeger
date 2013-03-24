package tests;

import java.io.IOException;
import java.util.ArrayList;

import edu.stanford.nlp.tagger.maxent.MaxentTagger;


/**
 * enthält Funktionen zum Aufbereiten des Textes.
 * 
 * @author Andreas
 * 
 */
public class WordProcessing
{

	public final String	 GERMAN_DEWAC	= "taggers/german-dewac.tagger";
	public final String	 GERMAN_FAST	= "taggers/german-fast.tagger";
	public final String	 GERMAN_HGC	  = "taggers/german-hgc.tagger";

	private MaxentTagger	_MaxentTagger;

	public WordProcessing()
	{

	}

	/**
	 * Fügt jedem Wort einen Tag mit Informationen zum Wort hinzu.
	 * 
	 * @param textToTag
	 * @return
	 */
	private String tagText(String textToTag)
	{
		String result = "";
		result = _MaxentTagger.tagString(textToTag);
		return result;
	}

	/**
	 * Erstellt eine Liste mit allen Nomen und Verben des Textes.
	 * 
	 * @param text
	 *            Text aus dem die Verben und Nomen extrahiert werden sollen.
	 * @return Liste mit allen Verben und Nomen.
	 */
	public ArrayList<String> getVerbsAndNouns(String text)
	{
		ArrayList<String> result = null;
		String tagged = tagText(text);
		String[] allWords = splitToWords(tagged);
		result = getVerbsAndNouns(allWords);
		return result;
	}

	/**
	 * Gibt eine Liste mit allen Verben und Nomen des WortArrays zurück. Wichtig: Die Wörter müssen getagged (
	 * {@link #tagText(String textToTag)}) sein.
	 * 
	 * @param taggedWords
	 *            Array mit getaggten Wörtern.
	 * @return Liste mit allen Verben und Nomen.
	 */
	private ArrayList<String> getVerbsAndNouns(String[] taggedWords)
	{
		ArrayList<String> result = new ArrayList<String>();

		if (_MaxentTagger == null)
		{
			try
			{
				_MaxentTagger = new MaxentTagger(GERMAN_FAST);
			}
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}

		for (String word : taggedWords)
		{
			if (word.contains("_VV") || word.contains("_N"))
			{
				result.add(word.split("_")[0]);
			}
		}
		return result;
	}

	/**
	 * Teilt den gegebenen Text in einzelne Wörter auf.
	 * 
	 * @param text
	 *            Text der aufgeteilt werden soll.
	 * @return Array mit Allen Wörtern.
	 */
	public String[] splitToWords(String text)
	{
		String[] result = null;

		result = text.split("[ \t\n\f\r]");

		return result;
	}

}
