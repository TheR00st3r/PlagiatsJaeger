package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;
import info.plagiatsjaeger.onlinesearch.BlekkoSearch;

import java.util.ArrayList;


public class Control
{

	private MySqlDatabaseHelper	mySqlDatabaseHelper;
	private Settings			_settings;

	private static final String	ROOT_FILES	= "/srv/www/uploads/";

	public Control()
	{
		mySqlDatabaseHelper = new MySqlDatabaseHelper();
	}

	public void startParsing(int documentHash)
	{

	}

	public void startPlagiatsSearch(int rId)
	{
		int documentId = mySqlDatabaseHelper.getDocumentID(rId);
		_settings = mySqlDatabaseHelper.getSettings(rId);
		startPlagiatsSearch(ROOT_FILES + documentId + ".txt", rId);
	}

	public void startPlagiatsSearch(String filePath, final int rId)
	{
		final String orginalText = SourceLoader.loadFile(filePath);
		if (_settings.getCheckWWW())
		{
			IOnlineSearch iOnlineSearch = new BlekkoSearch();
			iOnlineSearch.setOnLinkFoundListener(new OnLinkFoundListener()
			{

				@Override
				public void onLinkFound(final String link)
				{
					new Thread(new Runnable()
					{

						@Override
						public void run()
						{
							compare(rId, orginalText, link, 0);
						}
					}).start();
				}
			});
			iOnlineSearch.searchAsync(orginalText, 8);
		}
		for(int i : _settings.getLocalFolders())
		{
			//TODO: Compare local Files
		}
	}

	private void compare(int rId, String sourceText, String link, int docId)
	{
		IComparer comparer = new MyComparer(rId);
		comparer.setOnCompareFinishedListener(new OnCompareFinishedListener()
		{
			@Override
			public void onLinkFound(ArrayList<SearchResult> searchResult, int docId)
			{

			}

			@Override
			public void onLinkFound(ArrayList<SearchResult> searchResult, String link)
			{

			}
		});
		if (link.length() <= 0)
		{
			comparer.compareText(sourceText, SourceLoader.loadFile(ROOT_FILES + docId + ".txt"), docId);
		}
		else
		{
			comparer.compareText(sourceText, SourceLoader.loadURL(link), link);
		}
	}
}