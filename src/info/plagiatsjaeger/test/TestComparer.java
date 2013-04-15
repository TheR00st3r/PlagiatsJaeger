package info.plagiatsjaeger.test;

import info.plagiatsjaeger.MyComparer;
import info.plagiatsjaeger.WordProcessing;


public class TestComparer
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		MyComparer myComparer = new MyComparer();

		WordProcessing wordProcessing = new WordProcessing();
		String text1 = "Die prunkvolle mit Figurenschmuck und ornamentalem Dekor üppig ausgestattete Fassade ist eine barock-theatralische Inszenierung zum Lob des Stifters Vincenzo Fini, der mit einer hoch aufgesockelte Büste über dem Hauptportal präsentiert wird.";
		String text2 = "Die prunkvolle Kirche wird zum ersten mal im 8. Jahrhundert(mit Figurenschmuck und ornamentalem Dekor) in venezianischen Quellen erwähnt. Demnach geht sie auf eine Stiftung der Familien der Artigeri und Scopari zurück. Francesco Sansovino datiert ihre Gründung auf das Jahr 947, allerdings ohne eine Quelle anzugeben. Seit dem 13. Jahrhundert ist die Kirche als Pfarrkirche nachgewiesen.";

		String[] words1 = wordProcessing.splitToWords(text1);
		String[] words2 = wordProcessing.splitToWords(text2);

		int numWords = 8;
		for (int i = 0; i < words1.length;i++)
		{
			String searchString1 = "";
			for (int j = 0; (j < numWords) && ((i + j) < words1.length); j++)
			{
				searchString1 += " " + words1[i+j];		
				//i++;
			}
			
			for (int i2 = 0; i2 < words1.length; i2++)
			{
				String searchString2 = "";
				for (int j = 0; (j < numWords) && ((i2 + j) < words2.length); j++)
				{
					searchString2 += " " + words2[i2+j];					
				}
				
				double aehnlichkeit = myComparer.compareStrings(searchString1, searchString2);
				if(aehnlichkeit > 0.6)
				{
					System.out.println("Text1: " + searchString1);
					System.out.println("Text2: " + searchString2);

					System.out.println("Aehnlichket: " + aehnlichkeit);
					i+= numWords;
				}
			}
			
		}

		

		
	}

}
