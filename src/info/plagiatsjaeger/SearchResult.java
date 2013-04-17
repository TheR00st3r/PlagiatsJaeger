package info.plagiatsjaeger;

import java.util.ArrayList;


public class SearchResult
{

	private String			_originalText;
	private int				_rID;
	private int				_sequence;
	private int				_start;
	private int				_end;
	private ArrayList<Fund>	_funds	= new ArrayList<Fund>();

	public SearchResult(int rID, String orginalText, int sequence)
	{
		_rID = rID;
		_originalText = orginalText;
		_sequence = sequence;
	}

	public void setStartEnd(int start, int end)
	{
		_start = start;
		_end = end;
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

	public static class Fund
	{
		private String	_snippet;
		private String	_link;
		private int		_docId;
		private String	_title;
		private double	_aehnlichkeit;

		public Fund(String title, String snippet, double aehnlichkeit, String link)
		{
			_title = title;
			_snippet = snippet;
			_link = link;
			_aehnlichkeit = aehnlichkeit;
		}

		public Fund(String title, String snippet, double aehnlichkeit, int docId)
		{
			_title = title;
			_snippet = snippet;
			_docId = docId;
			_aehnlichkeit = aehnlichkeit;
		}
	}
}