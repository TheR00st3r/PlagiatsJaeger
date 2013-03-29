package plagiatssoftware;

public class SearchResult
{

	private int		_searchID;
	private String	_orginalText;
	private String	_plagiatsText;
	private String	_link;
	private int		_reihenfolge;

	public SearchResult(int searchID, String orginalText, String plagiatsText, String link, int reihenfolge)
	{
		_searchID = searchID;
		_orginalText = orginalText.trim();
		_plagiatsText = plagiatsText.trim();
		_link = link;
		_reihenfolge = reihenfolge;

	}

	public int getsearchID()
	{
		return _searchID;
	}

	public void setsearchID(int _searchID)
	{
		this._searchID = _searchID;
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
