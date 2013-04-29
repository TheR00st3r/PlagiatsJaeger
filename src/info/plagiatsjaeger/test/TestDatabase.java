package info.plagiatsjaeger.test;


import info.plagiatsjaeger.MyComparer;
import info.plagiatsjaeger.MySqlDatabaseHelper;
import info.plagiatsjaeger.Settings;
import info.plagiatsjaeger.SourceLoader;
import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.types.CompareResult;

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
		String sourceText ="Bei der Pekingente wird besonderer Wert auf die Haut gelegt. Deshalb werden die Tiere nach der Schlachtung einer besonderen Prozedur unterzogen, die sich mit handelsüblichen Enten nicht nachvollziehen lässt.Die Ente wird gerupft, aber nicht ausgenommen, Kopf und Füße werden zunächst nicht entfernt. Durch einen kleinen Schnitt am Hals wird nun die Haut aufgeblasen wie ein Luftballon, damit sie sich vollständig vom Fleisch trennt. Durch einen möglichst kleinen Schnitt unterhalb des Flügels werden anschließend die Innereien entfernt. Die Füße werden abgeschnitten. Nun wird die Ente am Hals aufgehängt, mit kochendem Wasser überbrüht, gewürzt und rundherum mit in heißem Wasser aufgelöstem Honig oder Malzzucker eingestrichen, um dann an einem gut belüfteten Ort für einige Stunden zu trocknen.";		
		String link = "http://de.wikipedia.org/wiki/Pekingente_(Gericht)";
		comparer.compareText(sourceText, SourceLoader.loadURL(link), link);
		
		Settings setting = dbhelper.getSettings(1);
		
		

	}
	
	
	
}
