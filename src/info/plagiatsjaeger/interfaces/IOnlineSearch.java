package info.plagiatsjaeger.interfaces;

import java.util.ArrayList;


/**
 * Schnittstelle zur Suche von Texten im WWW.
 * 
 * @author Andreas
 */
public interface IOnlineSearch
{

	/**
	 * Sucht im Internet nach dem Eingegebenen searchString. Die Ergebnislinks
	 * werden in einer ArrayListe zurueckgegeben. Alternativ kann auch der
	 * {@link OnLinkFoundListener} genutzt werden. Dieser muss dazu registriert
	 * werden( {@link #setOnLinkFoundListener}).
	 * 
	 * @param searchString
	 * @return
	 */
	public ArrayList<String> search(String searchString);

	/**
	 * Sucht Asynchron im Internet nach dem gegebenen Text. Dieser wird dazu in
	 * Textstuecke der angegebenen Laenge unterteilt. Bei jedem Treffer meldet
	 * sich der Thread über den {@link OnLinkFoundListener} zurueck.
	 * 
	 * @param searchString
	 */
	public void searchAsync(String searchString);

	/**
	 * Registriert einen {@link OnLinkFoundListener} um auf gefundene Links zu
	 * reagieren.
	 * 
	 * @param listener
	 */
	public void setOnLinkFoundListener(OnLinkFoundListener listener);
}