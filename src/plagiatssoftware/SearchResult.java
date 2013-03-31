package plagiatssoftware;

/**
 * Datentyp fuer ein Suchergebnis
 * 
 * @author Andreas
 * 
 */
public class SearchResult
{

	private int	   _reportID;
	private String	_orginalText;
	private String	_plagiatsText;
	private String	_link;
	private int	   _reihenfolge;

	/**
	 * Legt ein neues Suchergebnis an
	 * 
	 * @param reportID
	 * @param orginalText
	 * @param plagiatsText
	 * @param link
	 * @param reihenfolge
	 */
	public SearchResult(int reportID, String orginalText, String plagiatsText, String link, int reihenfolge)
	{
		_reportID = reportID;
		_orginalText = orginalText.trim();
		_plagiatsText = plagiatsText.trim();
		_link = link;
		_reihenfolge = reihenfolge;

	}

	public int getsearchID()
	{
		return _reportID;
	}

	public void setsearchID(int _searchID)
	{
		this._reportID = _searchID;
	}

	public String getorginalText()
	{
		return _orginalText;
	}

	public void setorginalText(String _orginalText)
	{
		this._orginalText = _orginalText.trim();
	}

	public String getplagiatsText()
	{
		return _plagiatsText;
	}

	public void setplagiatsText(String _plagiatsText)
	{
		this._plagiatsText = _plagiatsText.trim();
	}

	public String getlink()
	{
		return _link;
	}

	public void setlink(String _link)
	{
		this._link = _link;
	}

	public int getreihenfolge()
	{
		return _reihenfolge;
	}

	public void setreihenfolge(int _reihenfolge)
	{
		this._reihenfolge = _reihenfolge;
	}

}
