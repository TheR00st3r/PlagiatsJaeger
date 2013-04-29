package info.plagiatsjaeger.types;

/**
 * Datentyp fuer Vergleichsergebnisse
 * 
 * @author Andreas
 */
public class CompareResult
{
	private int		_rID;
	private String	_sourceText;
	private int		_checkStart;
	private int		_checkEnd;

	private int		_sourceStart;
	private int		_sourceEnd;

	private double	_similarity;

	/**
	 * Legt ein neues CompareResult an
	 * 
	 * @param rID
	 * @param sourceText
	 * @param checkStart
	 * @param checkEnd
	 * @param similarity
	 */
	public CompareResult(int rID, String sourceText, int checkStart, int checkEnd, double similarity)
	{
		_rID = rID;
		_sourceText = sourceText.trim();
		_checkStart = checkStart;
		_checkEnd = checkEnd;
		_similarity = similarity;
	}

	/**
	 * Legt ein neues CompareResult an
	 * 
	 * @param rId
	 * @param checkStart
	 * @param checkEnd
	 * @param sourceStart
	 * @param sourceEnd
	 * @param similarity
	 */
	public CompareResult(int rId, int checkStart, int checkEnd, int sourceStart, int sourceEnd, double similarity)
	{
		this(rId, "", checkStart, checkEnd, similarity);
		_sourceStart = sourceStart;
		_sourceEnd = sourceEnd;
	}

	/**
	 * Gibt die ReportID zurueck.
	 * 
	 * @return
	 */
	public int getReportID()
	{
		return _rID;
	}

	/**
	 * Gibt den SourceText zurueck
	 * 
	 * @return
	 */
	public String getSourceText()
	{
		return _sourceText;
	}

	/**
	 * Setzt den SourceText
	 * 
	 * @param sourceText
	 */
	public void setSourceText(String sourceText)
	{
		_sourceText = sourceText.trim();
	}

	/**
	 * Gibt den CheckStart Wert zurueck
	 * 
	 * @return
	 */
	public int getCheckStart()
	{
		return _checkStart;
	}

	/**
	 * Setzt den CheckStart Wert
	 * 
	 * @param checkStart
	 */
	public void setCheckStart(int checkStart)
	{
		_checkStart = checkStart;
	}

	/**
	 * Gibt den CheckEnd Wert zurueck
	 * 
	 * @return
	 */
	public int getCheckEnd()
	{
		return _checkEnd;
	}

	/**
	 * Setzt den CheckEnd Wert
	 * 
	 * @param checkEnd
	 */
	public void setCheckEnd(int checkEnd)
	{
		_checkEnd = checkEnd;
	}

	/**
	 * Gibt den SourceStart Wert zurueck
	 * 
	 * @return
	 */
	public int getSourceStart()
	{
		return _sourceStart;
	}

	/**
	 * Gibt den SourceEnd Wert zurueck
	 * 
	 * @return
	 */
	public int getSourceEnd()
	{
		return _sourceEnd;
	}

	/**
	 * Setzt den SourceEnd Wert.
	 * 
	 * @param sourceEnd
	 */
	public void setSourceEnd(int sourceEnd)
	{
		_sourceEnd = sourceEnd;
	}

	/**
	 * Liefert die Aehnlichkeit zurueck
	 * 
	 * @return
	 */
	public double getSimilarity()
	{
		return _similarity;
	}

	/**
	 * Setzt die Aehnlichkeit fuer das Vergleichsergebnis
	 * 
	 * @param similarity
	 */
	public void setSimilarity(double similarity)
	{
		_similarity = similarity;
	}
}