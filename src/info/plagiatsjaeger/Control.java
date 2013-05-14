package info.plagiatsjaeger;

import info.plagiatsjaeger.enums.ErrorCode;
import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;
import info.plagiatsjaeger.interfaces.OnCompareFinishedListener;
import info.plagiatsjaeger.interfaces.OnLinkFoundListener;
import info.plagiatsjaeger.onlinesearch.BlekkoSearch;
import info.plagiatsjaeger.types.CompareResult;
import info.plagiatsjaeger.types.Settings;

import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.log4j.Logger;


/**
 * Steuerung fuer den gesammten Ablauf.
 * 
 * @author Andreas
 */
public class Control
{
	/**
	 * Dateipfad fuer die Dateien auf dem Server.
	 */
	private static final String		ROOT_FILES		= "/srv/www/uploads/";
	private static final Logger		_logger			= Logger.getLogger(Control.class.getName());
	private static final int		SIZE_THREADPOOL	= 20;

	private Settings				_settings;
	private ExecutorService			_threadPool		= Executors.newFixedThreadPool(SIZE_THREADPOOL);
	private ArrayList<Future<Void>>	_futures		= new ArrayList<Future<Void>>();

	/**
	 * <b>Noch nicht implementiert!</b></br> Konvertiert eine Datei in das
	 * normalisierte txt-Format.
	 * 
	 * @param documentHash
	 */
	public void startParsing(int documentHash)
	{
		try
		{
		}
		catch (Exception e)
		{
			e.printStackTrace();
			_logger.fatal(e.getMessage());
		}

	}

	/**
	 * Startet eine Plagiatssuche zu dem uebergebenen Report.
	 * 
	 * @param rId
	 */
	public boolean startPlagiatsSearch(final int rId)
	{
		try
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
						mySqlDatabaseHelper.setReportState(rId, ErrorCode.Started);
						startPlagiatsSearch(ROOT_FILES + intDocumentId + ".txt", rId);
					}
				}).start();
				return true;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			_logger.fatal(e.getMessage());
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
					_futures.add(_threadPool.submit(new Callable<Void>()
					{
						@Override
						public Void call()
						{
							_logger.info("Thread for Link started: " + link);
							compare(rId, strSourceText, link, 0);
							return null;
						}
					}));
				}
			});
			iOnlineSearch.searchAsync(strSourceText, 8);
		}
		ArrayList<Integer> localFolders = _settings.getLocalFolders();
		if (localFolders != null)
		{
			for (final int i : _settings.getLocalFolders())
			{
				_futures.add(_threadPool.submit(new Callable<Void>()
				{
					@Override
					public Void call()
					{
						_logger.info("Thread for File started: " + i + ".txt");
						compare(rId, strSourceText, "", i);
						return null;
					}
				}));
			}
		}
		boolean succesful = true;
		for (Future<Void> future : _futures)
		{
			try
			{
				future.get();
			}
			catch (CancellationException e)
			{
				_logger.fatal(e.getMessage());
				e.printStackTrace();
				succesful = false;
			}
			catch (InterruptedException e)
			{
				_logger.fatal(e.getMessage());
				e.printStackTrace();
				succesful = false;
			}
			catch (ExecutionException e)
			{
				_logger.fatal(e.getMessage());
				e.printStackTrace();
				succesful = false;
			}
		}
		MySqlDatabaseHelper mySqlDatabaseHelper = new MySqlDatabaseHelper();
		if (succesful)
		{
			mySqlDatabaseHelper.setReportState(rId, ErrorCode.Succesful);
		}
		if(!succesful || ( _futures.size()<=0 && !_settings.getCheckWWW()))
		{
			mySqlDatabaseHelper.setReportState(rId, ErrorCode.Error);
		}
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