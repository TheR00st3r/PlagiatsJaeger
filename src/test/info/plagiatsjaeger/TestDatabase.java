package test.info.plagiatsjaeger;


import info.plagiatsjaeger.MyComparer;
import info.plagiatsjaeger.MySqlDatabaseHelper;
import info.plagiatsjaeger.SourceLoader;
import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.types.CompareResult;
import info.plagiatsjaeger.types.Settings;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Locale;

import org.lorecraft.phparser.SerializedPhpParser;
import org.lorecraft.phparser.SerializedPhpParser.PhpObject;

public class TestDatabase
{
	
	public static void main(String[] args)
	{
		String input = "a:0:{}";
		//String statementFile = "SELECT dID from document WHERE fID IN (";
		SerializedPhpParser serializedPhpParser = new SerializedPhpParser(input);
		LinkedHashMap<Integer,String> test = (LinkedHashMap<Integer,String>) serializedPhpParser.parse();
		
		StringBuilder sb = new StringBuilder();
		for (Integer key : test.keySet())
		 	{
		 	 if(test.get(key).length() == 0)
		 	 {
		 	 //_logger.fatal("There is an Error for " + key) ;
		 	 }
		 	 else
		 	 {
		  if(sb.length()!=0)
		  {
		  sb.append(",");
		  }
		  sb.append(test.get(key));
		 	 }
		 	}
		
		String statementFile = "SELECT dID from document as d WHERE fID IN (" + sb.toString() +")";
		
		System.out.println(statementFile);
		
		//DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.GERMAN);
		//otherSymbols.setDecimalSeparator('.');
		//otherSymbols.setGroupingSeparator('.'); 

		
		//DecimalFormat df = new DecimalFormat("###.##", otherSymbols);
		
		//String test = df.format(0.96677*100);
		
		//System.out.println(test);
		
//		IComparer comparer = new MyComparer(1);
//		final MySqlDatabaseHelper dbhelper = new MySqlDatabaseHelper();
//		comparer.setOnCompareFinishedListener(new OnCompareFinishedListener()
//		{
//			@Override
//			public void onLinkFound(ArrayList<CompareResult> compareResult, int docId)
//			{
//				dbhelper.insertCompareResults(compareResult, docId);
//			}
//
//			@Override
//			public void onLinkFound(ArrayList<CompareResult> compareResult, String link)
//			{
//				dbhelper.insertCompareResults(compareResult, link);
//			}
//		});
//		String sourceText ="Pekingente";		
//		String link = "http://de.wikipedia.org/wiki/Pekingente_(Gericht)";
//		comparer.compareText(sourceText, SourceLoader.loadURL(link), link);
//		
//		Settings setting = dbhelper.getSettings(1);
		
		

	}
	
	
	
}
