package info.plagiatsjaeger;

import java.util.ArrayList;


public class SearchResult
{

	private String	        _originalText;
	private int	            _rID;
	private int	            _sequence;
	private ArrayList<Fund>	_funds	= new ArrayList<Fund>();

	public SearchResult(int rID, String orginalText, int sequence)
	{
		_rID = rID;
		_originalText = orginalText;
		_sequence = sequence;
	}

	public int getReportID()
	{
		return _rID;
	}

	public String getOrginalText()
	{
		return _originalText;
	}

	public void setOrginalText(String orginalText)
	{
		_originalText = orginalText.trim();
	}

	public int getreihenfolge()
	{
		return _sequence;
	}

	public void setreihenfolge(int reihenfolge)
	{
		_sequence = reihenfolge;
	}

	public void addFund(Fund fund)
	{
		_funds.add(fund);
	}

	public ArrayList<Fund> getFunds()
	{
		return _funds;
	}

	public class Fund
	{
		private String	_snippet;
		private String	_link;
		private int		_docId;
		private String	_title;

		public Fund(String title, String snippet, String link)
		{
			_title = title;
			_snippet = snippet;
			_link = link;
		}

		public Fund(String title, String snippet, int docId)
		{
			_title = title;
			_snippet = snippet;
			_docId = docId;
		}
	}
}