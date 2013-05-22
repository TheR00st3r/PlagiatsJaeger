package info.plagiatsjaeger.types;

import info.plagiatsjaeger.ConfigReader;

import java.util.ArrayList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;


/**
 * Datentyp fuer die Einstellungen.
 * 
 * @author Andreas
 */
public class Settings
{

	private double							_threshold;
	// TODO: Default Settings setzen eventuell ueber Config File
	private int								_searchSentenceLength	= ConfigReader.getPropertyInt("SEARCHSENTENCELENGTH");
	private int								_searchJumpLength		= ConfigReader.getPropertyInt("SEARCHJUMPLENGTH");
	private int								_compareSentenceLength	= ConfigReader.getPropertyInt("COMPARESENTENCELENGTH");
	private int								_compareJumpLength		= ConfigReader.getPropertyInt("COMPAREJUMPLENGTH");
	private boolean							_checkWWW				= Boolean.getBoolean(ConfigReader.getPropertyString("CHECKWWW"));
	private ArrayList<Integer>				_localFolders			= new ArrayList<Integer>();

	private String							_searchURL				= ConfigReader.getPropertyString("SEARCHURL");
	private String							_searchSearchArg		= ConfigReader.getPropertyString("SEARCHARG");
	private String							_searchAuthArg			= ConfigReader.getPropertyString("SEARCHAUTHARGS");
	private String							_searchURLArgs			= ConfigReader.getPropertyString("SEARCHURLARGS");

	private static Settings					_Instance;

	private final ReentrantReadWriteLock	_readWriteLock			= new ReentrantReadWriteLock();
	private final Lock						_read					= _readWriteLock.readLock();
	private final Lock						_write					= _readWriteLock.writeLock();

	public static Settings getInstance()
	{
		if(_Instance == null)
		{
			_Instance = new Settings();
		}
		return _Instance;
	}

	private Settings()
	{
		
	}

	public void putSettings(int threshold, int searchSentenceLength, int searchJumpLength, int compareSentenceLength, int compareJumpLength, boolean checkWWW, ArrayList<Integer> localFolders)
	{
		_write.lock();
		try
		{
			_threshold = threshold;
			_searchSentenceLength = searchSentenceLength;
			_searchJumpLength = searchJumpLength;
			_compareSentenceLength = compareSentenceLength;
			_compareJumpLength = compareJumpLength;
			_checkWWW = checkWWW;
			if (localFolders != null)
			{
				_localFolders = localFolders;
			}
		}
		finally
		{
			_write.unlock();
		}
	}

	public void putSettings(int threshold, int searchSentenceLength, int searchJumpLength, int compareSentenceLength, int compareJumpLength, boolean checkWWW, ArrayList<Integer> localFolders, String searchUrl, String searchSearchArg, String searchAuthArg, String searchUrlArgs)
	{
		putSettings(threshold, searchSentenceLength, searchJumpLength, compareSentenceLength, compareJumpLength, checkWWW, localFolders);
		_write.lock();
		try
		{
			_searchURL = searchUrl;
			_searchSearchArg = searchSearchArg;
			_searchAuthArg = searchAuthArg;
			_searchURLArgs = searchUrlArgs;
		}
		finally
		{
			_write.unlock();
		}
	}

	public double getThreshold()
	{
		_read.lock();
		try
		{
			return _threshold;
		}
		finally
		{
			_read.unlock();
		}
	}

	public int getSearchSentenceLength()
	{
		_read.lock();
		try
		{
			return _searchSentenceLength;
		}
		finally
		{
			_read.unlock();
		}
	}

	public int getSearchJumpLength()
	{
		_read.lock();
		try
		{
			return _searchJumpLength;
		}
		finally
		{
			_read.unlock();
		}
	}

	public int getCompareSentenceLength()
	{
		_read.lock();
		try
		{
			return _compareSentenceLength;
		}
		finally
		{
			_read.unlock();
		}
	}

	public int getCompareJumpLength()
	{
		_read.lock();
		try
		{
			return _compareJumpLength;
		}
		finally
		{
			_read.unlock();
		}
	}

	public boolean getCheckWWW()
	{
		_read.lock();
		try
		{
			return _checkWWW;
		}
		finally
		{
			_read.unlock();
		}
	}

	public ArrayList<Integer> getLocalFolders()
	{
		_read.lock();
		try
		{
			return _localFolders;
		}
		finally
		{
			_read.unlock();
		}
	}

	public String getSearchURL()
	{
		_read.lock();
		try
		{
			return _searchURL;
		}
		finally
		{
			_read.unlock();
		}
	}

	public String getSearchAuthArg()
	{
		_read.lock();
		try
		{
			return _searchAuthArg;
		}
		finally
		{
			_read.unlock();
		}
	}

	public String getSearchSearchArg()
	{
		_read.lock();
		try
		{
			return _searchSearchArg;
		}
		finally
		{
			_read.unlock();
		}
	}

	public String getSearchURLArgs()
	{
		_read.lock();
		try
		{
			return _searchURLArgs;
		}
		finally
		{
			_read.unlock();
		}
	}

}