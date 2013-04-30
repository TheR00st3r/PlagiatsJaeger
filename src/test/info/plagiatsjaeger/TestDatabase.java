package test.info.plagiatsjaeger;


import info.plagiatsjaeger.MyComparer;
import info.plagiatsjaeger.MySqlDatabaseHelper;
import info.plagiatsjaeger.SourceLoader;
import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.types.CompareResult;
import info.plagiatsjaeger.types.Settings;

import java.util.ArrayList;

public class TestDatabase
{
	
	public static void main(String[] args)
	{
		
		IComparer comparer = new MyComparer(1);
		final MySqlDatabaseHelper dbhelper = new MySqlDatabaseHelper();
		comparer.setOnCompareFinishedListener(new OnCompareFinishedListener()
		{
			@Override
			public void onLinkFound(ArrayList<CompareResult> compareResult, int docId)
			{
				dbhelper.insertCompareResults(compareResult, docId);
			}

			@Override
			public void onLinkFound(ArrayList<CompareResult> compareResult, String link)
			{
				dbhelper.insertCompareResults(compareResult, link);
			}
		});
		String sourceText ="Pekingente";		
		String link = "http://de.wikipedia.org/wiki/Pekingente_(Gericht)";
		comparer.compareText(sourceText, SourceLoader.loadURL(link), link);
		
		Settings setting = dbhelper.getSettings(1);
		
		

	}
	
	
	
}
