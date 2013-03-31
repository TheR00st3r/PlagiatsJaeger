package plagiatssoftware;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;


@WebServlet("/MYSQLDataBaseHelper")
public class MYSQLDataBaseHelper
{
	private Connection	_connection	= null;
	private Statement	_statement	= null;

	/**
	 * Stellt Verbindung zum MySQL Server und der Datenbank her.
	 * 
	 * @throws Exception
	 *             Falls SQL Connect fehlschl�gt {@link SQLException} {@link ClassNotFoundException}
	 *             {@link FileNotFoundException}
	 */
	public void connect() throws Exception
	{
		_connection = null;
		_statement = null;
		// L�dt den MySQL Treiber
		Class.forName("com.mysql.jdbc.Driver");
		// Verbindung mit DB herstellen
		String strPassword = this.readPassword();
		_connection = DriverManager.getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?" + "user=root&password=" + strPassword);
		// Statements erlauben SQL Abfragen
		_statement = _connection.createStatement();
	}

	/**
	 * Schliesst Verbindung und Statement.
	 * 
	 * @throws Exception
	 */
	public void disconnect() throws Exception
	{
		_statement.close();
		_connection.close();
	}

	/**
	 * Liest Passwort aus Textdatei im user.home Verzeichnis
	 * 
	 * @return
	 * @throws IOException
	 *             Falls Datei nicht vorhanden
	 */
	public String readPassword() throws IOException
	{
		// Open the file that is the first
		// command line parameter
		String strFilepath = System.getProperty("user.home") + File.separator + "password.txt";
		FileInputStream fstream = new FileInputStream(strFilepath);
		// Get the object of DataInputStream
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String strPassword = br.readLine();
		// Close the input stream
		in.close();
		return strPassword;

	}

	/**
	 * Schreibt ein oder mehrere SearchResults in die Tabelle der Datenbank
	 * 
	 * @param alArrayList
	 *            Zu schreibende SearchResultObjekte
	 * @throws Exception
	 *             Falls SQL Befehl fehlschl�gt {@link SQLException}
	 */
	public void insertSearchResultIntoTable(ArrayList<SearchResult> alArrayList) throws Exception
	{
		this.connect();
		String strStatement = "";
		for (SearchResult result : alArrayList)
		{
			strStatement = "INSERT INTO result VALUES(DEFAULT, '" + result.getreihenfolge() + "','" + result.getorginalText() + "' , '" + result.getlink() + "' , '" + result.getplagiatsText() + "' , '" + result.getsearchID() + "' )";
			_statement.executeUpdate(strStatement);
		}
		this.disconnect();
	}

	/**
	 * Liefert die DokumentId zu einem Report.
	 * 
	 * @param rID
	 *            ReportId
	 * @return DokumentId
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Fuehrt einen SQL Abfrage aus
	 * 
	 * @param strStatement
	 *            SQL Befehl
	 * @return Gibt ein ResultSet zurueck
	 * @throws Exception
	 *             Falls SQL Befehl fehlschlaegt {@link SQLException}
	 */
	public ResultSet startQuery(String strStatement) throws Exception
	{
		this.connect();
		ResultSet rstResultSet = _statement.executeQuery(strStatement);
		this.disconnect();
		return rstResultSet;
	}

}
