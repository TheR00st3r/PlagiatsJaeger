package plagiatssoftware;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;

@WebServlet("/MYSQLDataBaseHelper")
public class MYSQLDataBaseHelper
{
	private Connection _connection = null;
	private Statement _statement = null;
	private PreparedStatement _preparedStatement = null;
	private ResultSet _resultSet = null;
	/**
	 * Stellt Verbindung zum MySQL Server und der Datenbank her, 
	 * im Moment wird eine Abfrage der User Vornamen ausgeführt und ausgegeben
	 * 
	 * @throws Exception Falls SQL Connect fehlschlägt
	 */
	public void connect() throws Exception
	{
		//Lädt den MySQL Treiber
	      Class.forName("com.mysql.jdbc.Driver");
	      //Verbindung mit DB herstellen
	      _connection = DriverManager
	          .getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?"
	              + "user=root&password=inf2011#projektAVH");
	   //Statements erlauben SQL Abfragen
	      _statement = _connection.createStatement();
	      //Abfragenergebnis in ResultSet speichern
	      _resultSet = _statement
	          .executeQuery("select * from plagiatsjaeger.user");
	      //Für jeden User auf Konsole ausgeben
	      while (_resultSet.next()) {
	    	  String strUser = _resultSet.getString(2);
	    	  System.out.println("Name: " + strUser);
	      } 
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
	
	
	
}
