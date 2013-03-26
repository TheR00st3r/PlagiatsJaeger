package tests;

import java.util.ArrayList;

import plagiatssoftware.MYSQLDataBaseHelper;
import plagiatssoftware.SearchResult;

public class TestMichi
{
	/**
	 * @param args
	 */
	public static void main(String[] args)throws Exception {
	    //Gibt Name von Benutzer 1 aus
		MYSQLDataBaseHelper testHelper = new MYSQLDataBaseHelper();
	    SearchResult testResult = new SearchResult(1, "bla", "blub", "bla", 1);
	    ArrayList<SearchResult> testArray = new ArrayList<SearchResult>();
	    testArray.add(testResult);
	    testArray.add(testResult);
	    testArray.add(testResult);
	    testHelper.insertSearchResultIntoTable(testArray);
	  }
	

}
