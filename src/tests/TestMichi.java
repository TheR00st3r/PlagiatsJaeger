package tests;

import java.util.ArrayList;

import plagiatssoftware.BlekkoSearch;
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
//	    SearchResult testResult = new SearchResult(1, "bla", "blub", "bla", 1);
//	    ArrayList<SearchResult> testArray = new ArrayList<SearchResult>();
//	    testArray.add(testResult);
//	    testArray.add(testResult);
//	    testArray.add(testResult);
//	    testHelper.insertSearchResultIntoTable(testArray);
		//testHelper.disconnect();
		int result = testHelper.getDocumentID(5);
		
		System.out.println(result);
		
	    //BlekkoSearch testSearch = new BlekkoSearch();
	    //testSearch.search("test");
	    
	    
	    
	  }
	

}
