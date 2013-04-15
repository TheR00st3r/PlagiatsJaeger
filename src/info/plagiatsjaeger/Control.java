package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.util.HashSet;


public class Control
{

	private HashSet<IOnlineSearch>	iOnlineSearch;
	private IComparer	           iComparer;
	private MySqlDatabaseHelper	   mySqlDatabaseHelper;
	public FileParser	           fileParser;
	public WordProcessing	       wordProcessing;
	public SourceLoader	           sourceLoader;

	public void startParsing(int documentHash)
	{

	}

	public void startPlagiatsSearch(int rId)
	{

	}

}