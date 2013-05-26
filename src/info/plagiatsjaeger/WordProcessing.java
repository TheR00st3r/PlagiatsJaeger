package info.plagiatsjaeger;

/**
 * Stellt Funktionen zum bearbeiten/aufbereiten von Texten zur Verfuegung.
 * 
 * @author Andreas
 */
public class WordProcessing
{

	public WordProcessing()
	{
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
}