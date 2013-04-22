package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;


public class Control
{

	private IOnlineSearch	    iOnlineSearch;
	private MySqlDatabaseHelper	mySqlDatabaseHelper;
	public FileParser	        fileParser;
	public WordProcessing	    wordProcessing;
	public SourceLoader	        sourceLoader;

	private static final String	ROOT_FILES	= "/srv/www/uploads/";

	public void startParsing(int documentHash)
	{

	}

	public void startPlagiatsSearch(int rId)
	{
		int documentId = mySqlDatabaseHelper.getDocumentID(rId);
		startPlagiatsSearch(ROOT_FILES + documentId + ".txt", rId);
	}

	public void startPlagiatsSearch(String filePath, int rId)
	{
		final String orginalText = SourceLoader.loadFile(filePath);
		iOnlineSearch = new BlekkoSearch();
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
						new MyComparer().compareText(orginalText, SourceLoader.loadURL(link), link);
					}
				}).start();
			}
		});
		iOnlineSearch.searchAsync(orginalText, 8);
	}
}