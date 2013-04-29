package info.plagiatsjaeger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Logger;


/**
 * Stellt Funktionen zum bearbeiten/aufbereiten von Texten zur Verfuegung.
 * 
 * @author Andreas
 */
public class WordProcessing
{

	private static final Logger	log				= Logger.getLogger(WordProcessing.class.getName());

	public WordProcessing()
	{
		Handler handler;
		try
		{
			handler = new FileHandler(Control.LOGGING_FOLDER + "log.txt");
			log.addHandler(handler);
		}
		catch (SecurityException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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