package test.info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;
import info.plagiatsjaeger.onlinesearch.BlekkoSearch;
import info.plagiatsjaeger.onlinesearch.FarooSearch;


/**
 * Klasse um die Onlinesuche zu Test
 * 
 * @author Andreas
 */
public class TestSearch
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		String searchString = "Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben!";

		// IOnlineSearch onlineSearch = new BlekkoSearch();
		IOnlineSearch faroo = new FarooSearch();
		faroo.setOnLinkFoundListener(new OnLinkFoundListener()
		{

			@Override
			public void onLinkFound(String link)
			{
				System.out.println("Faroo onLinkFound: " + link);
			}
		});
		// onlineSearch.searchAsync("Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben!",
		// BlekkoSearch.NUM_WORDS_FOR_SEARCH_DEFAULT);
		faroo.searchAsync(searchString);

		IOnlineSearch blekko = new BlekkoSearch();
		blekko.setOnLinkFoundListener(new OnLinkFoundListener()
		{

			@Override
			public void onLinkFound(String link)
			{
				System.out.println("Blekko onLinkFound: " + link);
			}
		});
		// onlineSearch.searchAsync("Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben!",
		// BlekkoSearch.NUM_WORDS_FOR_SEARCH_DEFAULT);
		blekko.searchAsync(searchString);

	}

}
