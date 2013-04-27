package info.plagiatsjaeger;

public class SearchResult
{
	private int		_rID;
	private String	_plagiatsText;
	private int		_start;
	private int		_end;

	private int		_plagStart;
	private int		_plagEnd;

	private double	_aehnlichkeit;

	public SearchResult(int rID, String plagiatsText, int start, int end, double aehnlichkeit)
	{
		_rID = rID;
		_plagiatsText = plagiatsText.trim();
		_start = start;
		_end = end;
		_aehnlichkeit = aehnlichkeit;
	}

	public SearchResult(int rId, int start, int end, int plagStart, int plagEnd, double aehnlichkeit)
	{
		this(rId, "", start, end, aehnlichkeit);
		_plagStart = plagStart;
		_plagEnd = plagEnd;
	}

	public int getReportID()
	{
		return _rID;
	}

	public String getPlagiatsText()
	{
		return _plagiatsText;
	}

	public void setPlagiatsText(String plagiatsText)
	{
		_plagiatsText = plagiatsText.trim();
	}

	public int getStart()
	{
		return _start;
	}

	public void setStart(int start)
	{
		_start = start;
	}

	public int getEnd()
	{
		return _end;
	}

	public void setEnd(int end)
	{
		_end = end;
	}

	public int getPlagStart()
	{
		return _plagStart;
	}

	public int getPlagEnd()
	{
		return _plagEnd;
	}

	public void setPlagEnd(int plagEnd)
	{
		_plagEnd = plagEnd;
	}

	public double getAehnlichkeit()
	{
		return _aehnlichkeit;
	}

	public void setAehnlichkeit(double aehnlichkeit)
	{
		_aehnlichkeit = aehnlichkeit;
	}
}