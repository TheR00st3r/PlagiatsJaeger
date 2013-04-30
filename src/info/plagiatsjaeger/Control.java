package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;
import info.plagiatsjaeger.onlinesearch.BlekkoSearch;
import info.plagiatsjaeger.types.CompareResult;
import info.plagiatsjaeger.types.Settings;

import java.util.ArrayList;

import org.apache.log4j.Logger;


/**
 * Steuerung fuer den gesammten Ablauf.
 * 
 * @author Andreas
 */
public class Control
{
	private Settings			_settings;

	/**
	 * Dateipfad fuer die Dateien auf dem Server.
	 */
	private static final String	ROOT_FILES	= "/srv/www/uploads/";

	private static final Logger	_logger		= Logger.getLogger(Control.class.getName());

	/**
	 * <b>Noch nicht implementiert!</b></br> Konvertiert eine Datei in das
	 * normalisierte txt-Format.
	 * 
	 * @param documentHash
	 */
	public void startParsing(int documentHash)
	{
	}

	/**
	 * Startet eine Plagiatssuche zu dem uebergebenen Report.
	 * 
	 * @param rId
	 */
	public boolean startPlagiatsSearch(final int rId)
	{
		final MySqlDatabaseHelper mySqlDatabaseHelper = new MySqlDatabaseHelper();
		final int intDocumentId = mySqlDatabaseHelper.getDocumentID(rId);
		_logger.info("Document: " + intDocumentId);
		if (intDocumentId != 0)
		{
			_logger.info("Check started");
			new Thread(new Runnable()
			{

				@Override
				public void run()
				{
					_logger.info("Thread started!");
					_settings = mySqlDatabaseHelper.getSettings(rId);
					startPlagiatsSearch(ROOT_FILES + intDocumentId + ".txt", rId);
				}
			}).start();
			return true;
		}
		return false;
	}

	/**
	 * Fuehrt eine Plagiatssuche zu dem uebergebenen Dokument durch.
	 * 
	 * @param filePath
	 * @param rId
	 */
	public void startPlagiatsSearch(String filePath, final int rId)
	{
		final String strSourceText = SourceLoader.loadFile(filePath);
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
							_logger.info("Thread for Link started: " + link);
							compare(rId, strSourceText, link, 0);
						}
					}).start();
				}
			});
			iOnlineSearch.searchAsync(strSourceText, 8);
		}
		// for (int i : _settings.getLocalFolders())
		// {
		// // TODO: Compare local Files
		// }
	}

	/**
	 * Vergleicht den sourceText entweder mit einer Internetseite oder einem
	 * lokalen Dokument.
	 * 
	 * @param rId
	 * @param checkText
	 * @param link
	 * @param docId
	 */
	private void compare(int rId, String checkText, String link, int docId)
	{
		IComparer comparer = new MyComparer(rId);
		comparer.setOnCompareFinishedListener(new OnCompareFinishedListener()
		{
			@Override
			public void onLinkFound(ArrayList<CompareResult> compareResult, int docId)
			{
				MySqlDatabaseHelper mySqlDatabaseHelper = new MySqlDatabaseHelper();
				mySqlDatabaseHelper.insertCompareResults(compareResult, docId);
			}

			@Override
			public void onLinkFound(ArrayList<CompareResult> compareResult, String link)
			{
				MySqlDatabaseHelper mySqlDatabaseHelper = new MySqlDatabaseHelper();
				mySqlDatabaseHelper.insertCompareResults(compareResult, link);
			}
		});
		if (docId <= 0)
		{
			comparer.compareText(checkText, SourceLoader.loadURL(link), link);
		}
		else
		{
			comparer.compareText(checkText, SourceLoader.loadFile(ROOT_FILES + docId + ".txt"), docId);
		}
	}
}