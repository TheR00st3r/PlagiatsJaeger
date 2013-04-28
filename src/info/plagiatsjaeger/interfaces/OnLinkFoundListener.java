package info.plagiatsjaeger.interfaces;

/**
 * Callbackhandler fuer die Rueckmeldung bei gefundenen Links.
 * 
 * @see IOnlineSearch
 * @author Andreas
 */
public interface OnLinkFoundListener
{

	/**
	 * Wird aufgerufen wenn ein Link gefunden wurde.
	 * 
	 * @param link
	 */
	public void onLinkFound(String link);
}
