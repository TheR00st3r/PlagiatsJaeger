package info.plagiatsjaeger.test;

import info.plagiatsjaeger.BlekkoSearch;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;

/**
 * Klasse um die Onlinesuche zu Test
 * @author Andreas
 *
 */
public class TestSearch
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		IOnlineSearch onlineSearch = new BlekkoSearch();
		onlineSearch.setOnLinkFoundListener(new OnLinkFoundListener()
		{
			
			@Override
			public void onLinkFound(String link)
			{
					System.out.println("onLinkFound: " + link);
			}
		});
		onlineSearch.searchAsync("Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben! Das ist nun mein Suchtext. TEST test und noch mehr Test. Ich hasse Text zu schreiben!", BlekkoSearch.NUM_WORDS_FOR_SEARCH_DEFAULT);

	}

}
