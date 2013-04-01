package plagiatssoftware;

import java.io.IOException;
import java.util.ArrayList;

import edu.stanford.nlp.tagger.maxent.MaxentTagger;


/**
 * Enthaelt Funktionen zum Aufbereiten des Textes.
 * 
 * @author Andreas
 * 
 */
public class WordProcessing
{

	public final String	 GERMAN_DEWAC	= "taggers/german-dewac.tagger";
	public final String	 GERMAN_FAST	= "taggers/german-fast.tagger";
	public final String	 GERMAN_HGC	  = "taggers/german-hgc.tagger";

	private MaxentTagger	_maxentTagger;

	/**
	 * Initialisiert den {@link _maxentTagger}
	 */
	private void init()
	{
		if (_maxentTagger == null)
		{
			try
			{
				_maxentTagger = new MaxentTagger(GERMAN_FAST);
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
	}

	/**
	 * Fuegt jedem Wort einen Tag mit Informationen zum Wort hinzu.
	 * 
	 * @param textToTag
	 * @return
	 */
	private String tagText(String textToTag)
	{
		String result = "";
		init();
		if (_maxentTagger != null)
		{
			result = _maxentTagger.tagString(textToTag);
		}
		else
		{
			result = textToTag;
		}
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
	 * Gibt eine Liste mit allen Verben und Nomen des WortArrays zur�ck. Wichtig: Die Woerter muessen getagged (
	 * {@link #tagText(String textToTag)}) sein.
	 * 
	 * @param taggedWords
	 *            Array mit getaggten Woertern.
	 * @return Liste mit allen Verben und Nomen.
	 */
	private ArrayList<String> getVerbsAndNouns(String[] taggedWords)
	{
		ArrayList<String> result = new ArrayList<String>();
		init();
		for (String word : taggedWords)
		{
			if (_maxentTagger != null && (word.contains("_VV") || word.contains("_N")))
			{
				result.add(word.split("_")[0]);
			}
			else if(_maxentTagger == null)
			{
				result.add(word);
			}
		}
		return result;
	}

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

		result = text.split("[ \t\n\f\r]");

		return result;
	}

}
