package info.plagiatsjaeger;

public class SearchResult
{

	private String	_originalText;
	private String	_plagiatsText;
	private String	_link;
	private int	   _rID;
	private int	   _sequence;

	public SearchResult(int rID, String orginalText, String plagiatsText, String link, int sequence)
	{

	}

	public int getsearchID()
	{
		return _rID;
	}

	public void setsearchID(int _searchID)
	{
		this._rID = _searchID;
	}

	public String getorginalText()
	{
		return _originalText;
	}

	public void setorginalText(String _orginalText)
	{
		this._originalText = _orginalText.trim();
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
		return _sequence;
	}

	public void setreihenfolge(int _reihenfolge)
	{
		this._sequence = _reihenfolge;
	}

}