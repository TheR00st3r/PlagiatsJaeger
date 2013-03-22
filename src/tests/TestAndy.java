package tests;

import java.util.ArrayList;

import plagiatssoftware.RabinKarpComparer;
import plagiatssoftware.RabinKarpComparer.OnSearchFinishedListener;



public class TestAndy
{
	private static RabinKarpComparer _RabinCarpComparer;
	
	public static void main(String[] args)
	{
		_RabinCarpComparer = new RabinKarpComparer();
		test();
	}

	private static void test()
	{
		ArrayList<String> searchStrings = new ArrayList<String>();

		StringBuilder completeString = new StringBuilder(0);

		for (int i = 0; i < 100; i++)
		{
			searchStrings.add("est123456");
		}
		for (int i = 0; i < 10000000; i++)
		{
			completeString.append("HalloTest" + i);
		}
		long start1 = System.currentTimeMillis();
		_RabinCarpComparer.search(searchStrings, completeString);
		long end1 = System.currentTimeMillis();
		System.out.println("Ohne Threads: " + (end1 - start1) + "ms");
		final long start2 = System.currentTimeMillis();
		_RabinCarpComparer.searchAsync(searchStrings, completeString, new OnSearchFinishedListener()
		{
			@Override
			public void onSearchFinished(ArrayList<String> searchStrings, ArrayList<ArrayList<String>> searchResults)
			{
				long end2 = System.currentTimeMillis();
				System.out.println("Mit Threads: " + (end2 - start2) + "ms");
			}
		});
	}

}
