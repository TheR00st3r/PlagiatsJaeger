package info.plagiatsjaeger.types;

import info.plagiatsjaeger.Control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Logger;

/**
 * Datentyp fuer die Einstellungen.
 * @author Andreas
 *
 */
public class Settings
{

	private int							_threshold;

	private int							_searchSentenceLength;
	private int							_searchJumpLength;
	private int							_compareSentenceLength;
	private int							_compareJumpLength;
	private boolean						_checkWWW;
	private static ArrayList<Integer>	_localFolders;

	private static final Logger	log				= Logger.getLogger(Settings.class.getName());

	public Settings(int threshold, int searchSentenceLength, int searchJumpLength, int compareSentenceLength, int compareJumpLength, boolean checkWWW)
	{
		_threshold = threshold;
		_searchSentenceLength = searchSentenceLength;
		_searchJumpLength = searchJumpLength;
		_compareSentenceLength = compareSentenceLength;
		_compareJumpLength = compareJumpLength;
		_checkWWW = checkWWW;
		
		Handler handler;
		try
		{
			handler = new FileHandler(Control.LOGGING_FOLDER + "log.txt");
			log.addHandler(handler);
		}
		catch (SecurityException e)
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

	public Settings(int threshold, int searchSentenceLength, int searchJumpLength, int compareSentenceLength, int compareJumpLength, boolean checkWWW, ArrayList<Integer> localFolders)
	{
		this(threshold, searchSentenceLength, searchJumpLength, compareSentenceLength, compareJumpLength, checkWWW);
		_localFolders = localFolders;
	}

	public int getThreshold()
	{
		return _threshold;
	}

	public int getSearchSentenceLength()
	{
		return _searchSentenceLength;
	}

	public int getSearchJumpLength()
	{
		return _searchJumpLength;
	}

	public int getCompareSentenceLength()
	{
		return _compareSentenceLength;
	}

	public int getCompareJumpLength()
	{
		return _compareJumpLength;
	}

	public boolean getCheckWWW()
	{
		return _checkWWW;
	}

	public ArrayList<Integer> getLocalFolders()
	{
		return _localFolders;
	}

}