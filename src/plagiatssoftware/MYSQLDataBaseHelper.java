package plagiatssoftware;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MYSQLDataBaseHelper
{
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	public void connect() throws Exception
	{
		// This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://192.168.4.28/plagiatsjaeger?"
	              + "user=root&password=inf2011#projektAVH");
	   // Statements allow to issue SQL queries to the database
	      statement = connect.createStatement();
	      // Result set get the result of the SQL query
	      resultSet = statement
	          .executeQuery("select * from plagiatsjaeger.user");
	      while (resultSet.next()) {
	    	  String user = resultSet.getString(2);
	    	  System.out.println("Name: " + user);
	      }
	      statement.close();
	}
	
}
