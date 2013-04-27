package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;

import java.util.ArrayList;


public class MyComparer implements IComparer
{

	private static final int			NUM_WORDS_TO_COMPARE	= 10;
	private static final double			SCHWELLENWERT			= 0.9;

	private String[]					_words1;
	private String[]					_words2;

	private String						_currentLink;
	private int							_currentDocId;

	private OnCompareFinishedListener	_onCompareFinishedListener;

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

	private ArrayList<SearchResult> compareText(String originalText, String textToCheck)
	{
		ArrayList<SearchResult> result = new ArrayList<SearchResult>();
		ArrayList<SearchResult> searchResults = new ArrayList<SearchResult>();

		WordProcessing wordProcessing = new WordProcessing();

		_words1 = wordProcessing.splitToWords(originalText);
		_words2 = wordProcessing.splitToWords(textToCheck);

		int resultStart1 = -1;
		int resultEnd1 = -1;
		int resultStart2 = -1;
		int resultEnd2 = -1;

		StringBuilder sb1 = new StringBuilder();
		StringBuilder sb2 = new StringBuilder();

		for (int i1 = 0; i1 < _words1.length; i1++)
		{
			sb1.delete(0, sb1.length());
			int j1 = 0;
			for (; (j1 < NUM_WORDS_TO_COMPARE) && ((i1 + j1) < _words1.length); j1++)
			{
				sb1.append(_words1[i1 + j1]).append(" ");
			}

			double aehnlichkeit = 0.0;
			for (int i2 = 0; i2 < _words2.length; i2++)
			{
				sb2.delete(0, sb2.length());
				int j2 = 0;
				for (; (j2 < NUM_WORDS_TO_COMPARE) && ((i2 + j2) < _words2.length); j2++)
				{
					sb2.append(_words2[i2 + j2]).append(" ");
				}

				boolean resultFound = false;
				double sumAehnlichkeit = 0.0;
				int countAehnlichkeit = 0;
				while ((aehnlichkeit = compareStrings(sb1.toString(), sb2.toString())) >= SCHWELLENWERT)
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

					sb1.delete(0, _words1[i1].length() + 1);
					sb2.delete(0, _words2[i2].length() + 1);
					if (_words1.length > (i1 + NUM_WORDS_TO_COMPARE) && _words2.length > (i2 + NUM_WORDS_TO_COMPARE))
					{
						sb1.append(_words1[i1 + NUM_WORDS_TO_COMPARE]).append(" ");
						sb2.append(_words2[i2 + NUM_WORDS_TO_COMPARE]).append(" ");
					}
					else
					{
						break;
					}
					i1++;
					i2++;
				}
				if (resultFound)
				{
					// TODO: rID eintragen
					SearchResult searchResult = new SearchResult(0, resultStart1, resultEnd1, resultStart2, resultEnd2, sumAehnlichkeit / countAehnlichkeit);
					searchResults.add(searchResult);

					resultStart1 = -1;
					resultStart2 = -1;
					resultEnd1 = -1;
					resultEnd2 = -1;
					break;
					// i2 += NUM_WORDS_TO_COMPARE - 1;
				}
			}
			i1 += NUM_WORDS_TO_COMPARE - 1;
		}

		// Searchresults zusammenfügen und Trefferlinks schreiben.
		for (int i = 0; i < searchResults.size() - 1; i++)
		{
			SearchResult searchResult1 = searchResults.get(i);
			SearchResult searchResult2 = searchResults.get(i + 1);
			// TODO: plagiatsposition ebenfalls merken (zum zusammenfÃ¼hren)

			// Zusammenhängende Text erkennen und start/end aktualisieren
			int missingWords = 4;
			double sumAehnlichkeit = searchResult1.getAehnlichkeit();
			int countAehnlichkeit = 1;
			while ((searchResult1.getEnd() >= (searchResult2.getStart() - missingWords)) && (searchResult1.getPlagEnd() >= (searchResult2.getPlagStart() - missingWords)))
			{
				sumAehnlichkeit += searchResult2.getAehnlichkeit();
				countAehnlichkeit++;
				searchResult1.setEnd(searchResult2.getEnd());
				searchResult1.setPlagEnd(searchResult2.getPlagEnd());
				i++;
				if (i < searchResults.size() - 1)
				{
					searchResult2 = searchResults.get(i + 1);
				}
				else
				{
					break;
				}
			}
			searchResult1.setAehnlichkeit(sumAehnlichkeit / countAehnlichkeit);
			// plagiatsText für plagStart/plagEnd setzen.
			StringBuilder resultText = new StringBuilder();
			for (int j = searchResult1.getPlagStart(); j < searchResult1.getPlagEnd(); j++)
			{
				resultText.append(_words2[j]).append(" ");
			}
			searchResult1.setPlagiatsText(resultText.toString());

			System.out.println("### TREFFER #######################");
			System.out.println("Source:       " + _currentLink);
			System.out.println("Start-Ende:   " + searchResult1.getStart() + "-" + searchResult1.getEnd());
			System.out.println("Text:         " + searchResult1.getPlagiatsText());
			System.out.println("Aehnlichkeit: " + searchResult1.getAehnlichkeit());
			System.out.println("###################################");

			result.add(searchResult1);
		}
		_onCompareFinishedListener.onLinkFound(result, _currentLink);
		_onCompareFinishedListener.onLinkFound(result, _currentDocId);
		return result;
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
	public void setOnCompareFinishedListener(OnCompareFinishedListener listener)
	{
		_onCompareFinishedListener = listener;
	}
}
