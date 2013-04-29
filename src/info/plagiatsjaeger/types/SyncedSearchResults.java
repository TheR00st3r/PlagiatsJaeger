package info.plagiatsjaeger.types;

import java.util.HashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;


/**
 * @deprecated Nicht mehr verwendet.
 * @author Andreas
 */
public class SyncedSearchResults
{
	private final ReentrantReadWriteLock			_readWriteLock	= new ReentrantReadWriteLock();
	private final Lock								_read			= _readWriteLock.readLock();
	private final Lock								_write			= _readWriteLock.writeLock();

	private static HashMap<Integer, CompareResult>	_searchResults	= new HashMap<Integer, CompareResult>();

	public void put(int key, CompareResult value)
	{
		_write.lock();
		try
		{
			_searchResults.put(key, value);
		}
		finally
		{
			_write.unlock();
		}
	}

	public CompareResult get(int key)
	{
		_read.lock();
		try
		{
			return _searchResults.get(key);
		}
		finally
		{
			_read.unlock();
		}
	}

	public HashMap<Integer, CompareResult> getAll()
	{
		_read.lock();
		try
		{
			return _searchResults;
		}
		finally
		{
			_read.unlock();
		}
	}

	public Integer[] getKeys()
	{
		_read.lock();
		try
		{
			Integer[] keys = new Integer[_searchResults.size()];
			return _searchResults.keySet().toArray(keys);
		}
		finally
		{
			_read.lock();
		}
	}

}
