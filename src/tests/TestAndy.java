package tests;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import plagiatssoftware.RabinKarpComparer;
import plagiatssoftware.RabinKarpComparer.OnSearchFinishedListener;
import plagiatssoftware.SearchResult;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class TestAndy
{
	private static RabinKarpComparer	_RabinCarpComparer;

	public static void main(String[] args)
	{
		//testDDG();

		// WordProcessing wp = new WordProcessing();

		 _RabinCarpComparer = new RabinKarpComparer();
		 test();
	}

	public static void testDDG()
	{
		String google = "http://blekko.com/ws/?q=";
		String args = "+/json";
		String search = "heise will viel";
		String charset = "UTF-8";

		URL url;
		try
		{
			url = new URL(google + URLEncoder.encode(search, charset) + args);
			InputStreamReader reader = new InputStreamReader(url.openStream(), charset);

			BufferedReader bufferedReader = new BufferedReader(reader);

			StringBuilder stringBuilder = new StringBuilder();
			String line = bufferedReader.readLine();
			while (line != null)
			{
				stringBuilder.append(line);
				line = bufferedReader.readLine();
			}
			
			System.out.println(stringBuilder.toString());

		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static void test()
	{
		ArrayList<String> searchStrings = new ArrayList<String>();

		StringBuilder completeString = new StringBuilder(0);
		String[]test = new String[10];
		for (int i = 0; i < 10; i++)
		{
			test[i] = "HalloTest12" + i;
			searchStrings.add("est123456");
		}
		for (int i = 0; i < 10000000; i++)
		{
			completeString.append(" HalloTest" + i);
		}
		long start1 = System.currentTimeMillis();
		//_RabinCarpComparer.search(searchStrings, completeString);
		
		for(SearchResult result: _RabinCarpComparer.search(test, completeString))
		{
			System.out.println(result.getreihenfolge() + " " + result.getorginalText() + " " + result.getplagiatsText());
		}
		
		long end1 = System.currentTimeMillis();
		System.out.println("Ohne Threads: " + (end1 - start1) + "ms");
		
		
//		final long start2 = System.currentTimeMillis();
//		_RabinCarpComparer.searchAsync(searchStrings, completeString, new OnSearchFinishedListener()
//		{
//		@Override
//		public void onSearchFinished(ArrayList<String> searchStrings, ArrayList<ArrayList<String>> searchResults)
//		{
//			long end2 = System.currentTimeMillis();
//			System.out.println("Mit Threads: " + (end2 - start2) + "ms");
//		}
//	});
	}
}
