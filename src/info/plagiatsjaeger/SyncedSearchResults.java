package info.plagiatsjaeger;

import java.util.HashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;


public class SyncedSearchResults
{
	private final ReentrantReadWriteLock	      _readWriteLock	= new ReentrantReadWriteLock();
	private final Lock	                          _read	           = _readWriteLock.readLock();
	private final Lock	                          _write	       = _readWriteLock.writeLock();

	private static HashMap<Integer, SearchResult>	_searchResults	= new HashMap<Integer, SearchResult>();

	public void put(int key, SearchResult value)
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

	public SearchResult get(int key)
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
	
	public HashMap<Integer, SearchResult> getAll()
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
