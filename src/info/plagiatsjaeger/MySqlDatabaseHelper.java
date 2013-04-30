package info.plagiatsjaeger;

import info.plagiatsjaeger.types.CompareResult;
import info.plagiatsjaeger.types.Settings;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;


/**
 * Stellt Methoden zur Kommunikation mit der MySqlDatenbank zur Verfuegung.
 * 
 * @author Michael
 */
public class MySqlDatabaseHelper
{
	private Connection	_connection	= null;
	private Statement	_statement	= null;

	public MySqlDatabaseHelper()
	{
	}

	/**
	 * Stellt eine Verbindung mit der SQL Datenbank her.
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void connect() throws ClassNotFoundException, SQLException
	{
		_connection = null;
		_statement = null;
		// Laedt den MySQL Treiber
		Class.forName("com.mysql.jdbc.Driver");
		// Verbindung mit DB herstellen
		String strPassword = this.readPassword();
		_connection = DriverManager.getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?useUnicode=true&characterEncoding=utf-8", "root", strPassword);
		// Statements erlauben SQL Abfragen
		_statement = _connection.createStatement();
	}

	/**
	 * Trennt eine bestehende Verbindung mit der Datenbank
	 * 
	 * @throws SQLException
	 */
	private void disconnect() throws SQLException
	{
		if (!_statement.isClosed()) _statement.close();
		if (!_connection.isClosed()) _connection.close();
	}

	/**
	 * Ermittelt das Passwort aus dem Passwordfile
	 * 
	 * @return result
	 */
	public String readPassword()
	{
		String result = "";
		// Open the file that is the first
		// command line parameter
		String strFilepath = System.getProperty("user.home") + File.separator + "password.txt";
		result = SourceLoader.loadFile(strFilepath).trim();
		return result;
	}

	/**
	 * Fuegt eine Liste von Suchergebnissen, die in einem lokalen Dokument
	 * gefunden wurden, zu einem Report ein.
	 * 
	 * @param compareResults
	 * @param dID
	 */
	public void insertCompareResults(ArrayList<CompareResult> compareResults, int dID)
	{
		try
		{
			String strStatement = "";
			connect();
			for (CompareResult result : compareResults)
			{
				DecimalFormat df = new DecimalFormat("###.##");
				strStatement = "INSERT INTO result VALUES(DEFAULT, '" + result.getSourceText() + "' , '" + "' , '" + dID + "' , '" + result.getCheckStart() + "' , '" + result.getCheckEnd() + "' , '" + df.format(result.getSimilarity()) + "' , '" + result.getReportID() + "' )";
				_statement.executeUpdate(strStatement);
			}
			disconnect();
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

	}

	/**
	 * Fuegt eine Liste von Suchergebnissen, die auf einer Internetseite
	 * gefunden wurden, zu einem Report ein.
	 * 
	 * @param compareResults
	 * @param sourceLink
	 */
	public void insertCompareResults(ArrayList<CompareResult> compareResults, String sourceLink)
	{
		try
		{
			String strStatement = "";
			connect();
			for (CompareResult result : compareResults)
			{
				DecimalFormat df = new DecimalFormat("###.##");
				strStatement = "INSERT INTO result VALUES(DEFAULT, '" + result.getSourceText() + "','" + sourceLink + "' , " + "null" + " , '" + result.getCheckStart() + "' , '" + result.getCheckEnd() + "','" + df.format(result.getSimilarity()) + "' , '" + result.getReportID() + "' )";
				_statement.executeUpdate(strStatement);
			}
			disconnect();
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * Liest die DocumentId aus einem Report aus.
	 * 
	 * @param rID
	 * @return return
	 */
	public int getDocumentID(int rID)
	{
		int result = 0;

		String strStatement = "SELECT dID FROM report WHERE rID = " + rID;
		ResultSet rstResultSet;
		try
		{
			connect();
			rstResultSet = _statement.executeQuery(strStatement);
			if (rstResultSet.next())
			{
				result = rstResultSet.getInt("dID");
			}
			this.disconnect();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param query
	 * @return return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ResultSet startQuery(String query) throws ClassNotFoundException, SQLException
	{
		connect();
		ResultSet rstResultSet = _statement.executeQuery(query);
		disconnect();
		return rstResultSet;
	}

	/**
	 * Laed die Einstellungen zu einem Report aus der Datenbank.
	 * 
	 * @param rId
	 * @return result
	 */
	public Settings getSettings(int rId)
	{
		Settings result = null;

		String strStatement = "SELECT s.sThreshold, sl.slSearchSentenceLength, sl.slSearchJumpLength, sl.slCompareSentenceLength, sl.slCompareJumpLength, s.sCheckWWW FROM report AS r LEFT JOIN setting AS s ON r.sID = s.sID LEFT JOIN settinglevel AS sl on s.sLevel = slID WHERE r.rID = " + rId;
		ResultSet rstResultSet;
		try
		{
			connect();
			rstResultSet = _statement.executeQuery(strStatement);
			if (rstResultSet.next())
			{
				result = new Settings(rstResultSet.getInt("s.sThreshold"), rstResultSet.getInt("sl.slSearchSentenceLength"), rstResultSet.getInt("sl.slSearchJumpLength"), rstResultSet.getInt("sl.slCompareSentenceLength"), rstResultSet.getInt("sl.slCompareJumpLength"), rstResultSet.getBoolean("s.sCheckWWW"));
			}
			this.disconnect();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * <b>Noch nicht implementiert!</b></br> Setzt ein Document als fertig
	 * geparst.
	 * 
	 * @param docId
	 */
	public void setDocumentAsParsed(int docId)
	{

	}

}