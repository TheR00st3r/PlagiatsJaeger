package info.plagiatsjaeger;

import info.plagiatsjaeger.SearchResult.Fund;
import info.plagiatsjaeger.interfaces.IComparer;

import java.util.ArrayList;
import java.util.HashMap;


public class MyComparer implements IComparer
{

	private static final int	       NUM_WORDS_TO_COMPARE	= 10;
	private static final double	       SCHWELLENWERT	    = 0.93;

	private static SyncedSearchResults	_searchResults	    = new SyncedSearchResults();

	private String[]	               _words1;
	private String[]	               _words2;
	private StringBuilder	           _sb1;
	private StringBuilder	           _sb2;

	private String	                   _currentLink;
	private int	                       _currentDocId;

	@Override
	public void compareText(String originalText, String textToCheck, String link)
	{
		_currentLink = link;
		compareText(originalText, textToCheck);
	}

	@Override
	public void compareText(String originalText, String textToCheck, int docId)
	{
		_currentDocId = docId;
		compareText(originalText, textToCheck);
	}

	private void compareText(String originalText, String textToCheck)
	{
		WordProcessing wordProcessing = new WordProcessing();

		_words1 = wordProcessing.splitToWords(originalText);
		_words2 = wordProcessing.splitToWords(textToCheck);

		_sb1 = new StringBuilder();
		_sb2 = new StringBuilder();

		int resultStart1 = -1;
		int resultEnd1 = -1;
		int resultStart2 = -1;
		int resultEnd2 = -1;

		for (int i1 = 0; i1 < _words1.length; i1++)
		{
			_sb1 = new StringBuilder();
			int j1 = 0;
			for (; (j1 < NUM_WORDS_TO_COMPARE) && ((i1 + j1) < _words1.length); j1++)
			{
				_sb1.append(_words1[i1 + j1]).append(" ");
			}

			double aehnlichkeit = 0.0;
			boolean aehnlichkeitFound = false;
			for (int i2 = 0; i2 < _words2.length; i2++)
			{
				_sb2 = new StringBuilder();
				int j2 = 0;
				for (; (j2 < NUM_WORDS_TO_COMPARE) && ((i2 + j2) < _words2.length); j2++)
				{
					_sb2.append(_words2[i2 + j2]).append(" ");
				}

				boolean resultFound = false;
				double sumAehnlichkeit = 0.0;
				int countAehnlichkeit = 0;
				while ((aehnlichkeit = compareStrings(_sb1.toString(), _sb2.toString())) >= SCHWELLENWERT)
				{
					resultFound = true;
					if (resultStart1 < 0)
					{
						resultStart1 = i1;
					}
					if (resultStart2 < 0)
					{
						resultStart2 = i2;
					}
					resultEnd1 = i1 + j1 + 1;
					resultEnd2 = i2 + j2 + 1;
					sumAehnlichkeit += aehnlichkeit;
					countAehnlichkeit++;

					_sb1.delete(0, _words1[i1].length() + 1);
					_sb2.delete(0, _words2[i2].length() + 1);
					i1++;
					i2++;
					if (_words1.length > (i1 + NUM_WORDS_TO_COMPARE) && _words2.length > (i2 + NUM_WORDS_TO_COMPARE))
					{
						_sb1.append(_words1[i1 + NUM_WORDS_TO_COMPARE]).append(" ");
						_sb2.append(_words2[i2 + NUM_WORDS_TO_COMPARE]).append(" ");
					}
					else
					{
						break;
					}
				}
				if (resultFound)
				{
					StringBuilder sbOrgText = new StringBuilder();
					StringBuilder sbPlagText = new StringBuilder();
					for (int c = resultStart1; (c < resultEnd1) && (c < _words1.length - 1); c++)
					{
						sbOrgText.append(_words1[c]).append(" ");
					}
					for (int c = resultStart2; c < resultEnd2; c++)
					{
						sbPlagText.append(_words2[c]).append(" ");
					}
					
					SearchResult searchResult = _searchResults.get(resultStart1);
					if (searchResult == null)
					{
						searchResult = new SearchResult(0, _sb1.toString(), resultStart1);
						searchResult.setStartEnd(resultStart1, resultEnd1);
						_searchResults.put(resultStart1, searchResult);
					}
					if (_currentLink != "")
					{
						searchResult.addFund(new Fund("", sbPlagText.toString(), sumAehnlichkeit / countAehnlichkeit, _currentLink));
					}
					else
					{
						searchResult.addFund(new Fund("", sbPlagText.toString(), sumAehnlichkeit / countAehnlichkeit, _currentDocId));
					}
					System.out.println("Text: " + sbOrgText.toString());
					System.out.println("Text: " + sbPlagText.toString());
					System.out.println("Source: " + _currentLink);
					System.out.println("Aehnlichket: " + sumAehnlichkeit / countAehnlichkeit);

					
					resultStart1 = -1;
					resultStart2 = -1;
					resultEnd1 = -1;
					resultEnd2 = -1;
					aehnlichkeitFound = true;

					i2 += NUM_WORDS_TO_COMPARE - 1;
				}

			}
			if (!aehnlichkeitFound)
			{
				 System.out.println("NoFund: " + _sb1.toString() + " Link :" + _currentLink );
				SearchResult searchResult = _searchResults.get(resultStart1);
				if (searchResult == null)
				{
					searchResult = new SearchResult(0, _sb1.toString(), resultStart1);
					searchResult.setStartEnd(resultStart1, resultEnd1);
					_searchResults.put(resultStart1, searchResult);
				}

				i1 += NUM_WORDS_TO_COMPARE - 1;
			}
			else
			{
				i1 += NUM_WORDS_TO_COMPARE - 1;
				aehnlichkeitFound = false;
			}

		}
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

	@Override
	public HashMap<Integer, SearchResult> getSearchResults()
	{
		// TODO: Doppelte Einträge/Ueberschneidungen zusammenfassen
		return _searchResults.getAll();
	}

}
