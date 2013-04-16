package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;

import java.util.ArrayList;


public class MyComparer implements IComparer
{

	private static final int	NUM_WORDS_TO_COMPARE	= 10;
	private static final double	SCHWELLENWERT			= 0.9;

	@Override
	public ArrayList<SearchResult> compareText(String originalText, String textToCheck)
	{
		WordProcessing wordProcessing = new WordProcessing();

		
		String[] words1 = wordProcessing.splitToWords(originalText);
		String[] words2 = wordProcessing.splitToWords(textToCheck);

		for (int i = 0; i < words1.length;i++)
		{
			String searchString1 = "";
			for (int j = 0; (j < NUM_WORDS_TO_COMPARE) && ((i + j) < words1.length); j++)
			{
				searchString1 += " " + words1[i+j];		
			}
			
			for (int i2 = 0; i2 < words1.length; i2++)
			{
				String searchString2 = "";
				for (int j = 0; (j < NUM_WORDS_TO_COMPARE) && ((i2 + j) < words2.length); j++)
				{
					searchString2 += " " + words2[i2+j];					
				}
				
				double aehnlichkeit = compareStrings(searchString1, searchString2);
				if(aehnlichkeit >= SCHWELLENWERT)
				{
					System.out.println("Text1: " + searchString1);
					System.out.println("Text2: " + searchString2);

					System.out.println("Aehnlichket: " + aehnlichkeit);
					
					i+= NUM_WORDS_TO_COMPARE;
					break;
				}
			}
		}		
		return null;
	}

	@Override
	public ArrayList<SearchResult> compareFiles(String filePathSource, String filePathToCheck)
	{
		// TODO Auto-generated method stub
		return null;
	}

	/** @return lexical similarity value in the range [0,1] */
	public double compareStrings(String str1, String str2)
	{
		ArrayList<String> pairs1 = wordLetterPairs(str1.toUpperCase());
		ArrayList<String> pairs2 = wordLetterPairs(str2.toUpperCase());
		int intersection = 0;
		int union = pairs1.size() + pairs2.size();
		for (int i = 0; i < pairs1.size(); i++)
		{
			Object pair1 = pairs1.get(i);
			for (int j = 0; j < pairs2.size(); j++)
			{
				Object pair2 = pairs2.get(j);
				if (pair1.equals(pair2))
				{
					intersection++;
					pairs2.remove(j);
					break;
				}
			}
		}
		return (2.0 * intersection) / union;
	}

	/** @return an ArrayList of 2-character Strings. */
	private ArrayList<String> wordLetterPairs(String str)
	{
		ArrayList<String> allPairs = new ArrayList<String>();
		// Tokenize the string and put the tokens/words into an array
		String[] words = str.split("\\s");
		// For each word
		for (int w = 0; w < words.length; w++)
		{
			// Find the pairs of characters
			String[] pairsInWord = letterPairs(words[w]);
			for (int p = 0; p < pairsInWord.length; p++)
			{
				allPairs.add(pairsInWord[p]);
			}
		}
		return allPairs;
	}

	/** @return an array of adjacent letter pairs contained in the input string */
	private String[] letterPairs(String str)
	{
		String[] pairs = new String[0];
		int numPairs = str.length() - 1;
		if (numPairs > 0)
		{
			pairs = new String[numPairs];
			for (int i = 0; i < numPairs; i++)
			{
				pairs[i] = str.substring(i, i + 2);
			}
		}
		return pairs;
	}
}
