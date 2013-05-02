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
import java.util.Locale;

public class TestDatabase
{
	
	public static void main(String[] args)
	{
		
		DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.GERMAN);
		otherSymbols.setDecimalSeparator('.');
		//otherSymbols.setGroupingSeparator('.'); 

		
		DecimalFormat df = new DecimalFormat("###.##", otherSymbols);
		
		String test = df.format(0.96677*100);
		
		System.out.println(test);
		
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
