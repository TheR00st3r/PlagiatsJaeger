package info.plagiatsjaeger;

import java.util.ArrayList;


public class SearchResult
{
	private int	   _rID;
	private String	_plagiatsText;
	private int	   _start;
	private int	   _end;
	private double	_aehnlichkeit;

	public SearchResult(int rID, String plagiatsText, int start, int end, double aehnlichkeit)
	{
		_rID = rID;
		_plagiatsText = plagiatsText.trim();
		_start = start;
		_end = end;
		_aehnlichkeit = aehnlichkeit;
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
	
	public double getAehnlichkeit()
	{
		return _aehnlichkeit;
	}
	
	public void setAehnlichkeit(double aehnlichkeit)
	{
		_aehnlichkeit = aehnlichkeit;
	}
}