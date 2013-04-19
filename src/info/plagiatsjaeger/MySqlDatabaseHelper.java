package info.plagiatsjaeger;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


/***
 * Stellt Methoden zur Kommunikation mit der MySqlDatenbank zur Verfügung.
 * 
 * @author Michael
 * 
 */
public class MySqlDatabaseHelper
{
	private Connection	_connection	= null;
	private Statement	_statement	= null;

	/**
	 * Description of the method connect.
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
		// _connection = DriverManager.getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?" + "user=root&password="
		// + strPassword);
		_connection = DriverManager.getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?useUnicode=true&characterEncoding=utf-8", "root", strPassword);
		// Statements erlauben SQL Abfragen
		_statement = _connection.createStatement();
	}

	/**
	 * Description of the method disconnect.
	 * 
	 * @throws SQLException
	 */
	private void disconnect() throws SQLException
	{
		if (!_statement.isClosed()) _statement.close();
		if (!_connection.isClosed()) _connection.close();
	}

	/**
	 * Description of the method readPassword.
	 * 
	 * @return result
	 */
	public String readPassword()
	{
		String result = "";
		// Open the file that is the first
		// command line parameter
		String strFilepath = System.getProperty("user.home") + File.separator + "password.txt";
		result = SourceLoader.loadFile(strFilepath);
		return result;
	}

	/**
	 * Description of the method insertSearchResults.
	 * 
	 * @param searchResults
	 */
	public void insertSearchResults(ArrayList<SearchResult> searchResults)
	{

		try
		{
			String strStatement = "";
			connect();
			for (SearchResult result : searchResults)
			{
				// TODO: statement an neues DB Design anpassen.
				// strStatement = "INSERT INTO result VALUES(DEFAULT, '" + result.getreihenfolge() + "','" +
				// result.getOrginalText() + "' , '" + result.getlink() + "' , '" + result.getplagiatsText() + "' , '" +
				// result.getsearchID() + "' )";
				// _statement.executeUpdate(strStatement);
			}
			disconnect();
		}
		catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Description of the method getDocumentID.
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
	 * Description of the method startQuery.
	 * 
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
	 * Description of the method getSettings.
	 * 
	 * @param rId
	 * @return result
	 */
	public Settings getSettings(int rId)
	{
		Settings result = null;

		return result;
	}

	/**
	 * Description of the method setDocumentAsParsed.
	 * 
	 * @param docId
	 */
	public void setDocumentAsParsed(int docId)
	{

	}

}