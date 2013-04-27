package info.plagiatsjaeger.test;

import java.io.File;

import info.plagiatsjaeger.MyComparer;
import info.plagiatsjaeger.SourceLoader;


public class TestComparer
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		MyComparer myComparer = new MyComparer(0);

		
//		WordProcessing wordProcessing = new WordProcessing();
		String path1 = System.getProperty("user.home") + File.separator + "orgText.txt";
		String path2 = System.getProperty("user.home") + File.separator + "plagText.txt";
		myComparer.compareText(SourceLoader.loadFile(path1),SourceLoader.loadFile(path2), "");
		
		//System.out.println(myComparer.compareStrings(text1, text2));
		
//		String[] words1 = wordProcessing.splitToWords(text1);
//		String[] words2 = wordProcessing.splitToWords(text2);
//
//		int numWords = 8;
//		for (int i = 0; i < words1.length;i++)
//		{
//			String searchString1 = "";
//			for (int j = 0; (j < numWords) && ((i + j) < words1.length); j++)
//			{
//				searchString1 += " " + words1[i+j];		
//				//i++;
//			}
//			
//			for (int i2 = 0; i2 < words1.length; i2++)
//			{
//				String searchString2 = "";
//				for (int j = 0; (j < numWords) && ((i2 + j) < words2.length); j++)
//				{
//					searchString2 += " " + words2[i2+j];					
//				}
//				
//				double aehnlichkeit = myComparer.compareStrings(searchString1, searchString2);
//				if(aehnlichkeit > 0.6)
//				{
//					System.out.println("Text1: " + searchString1);
//					System.out.println("Text2: " + searchString2);
//
//					System.out.println("Aehnlichket: " + aehnlichkeit);
//					i+= numWords;
//				}
//			}
//			
//		}

		

		
	}

}
