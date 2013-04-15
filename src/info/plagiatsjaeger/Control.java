package info.plagiatsjaeger;

import info.plagiatsjaeger.interfaces.IComparer;
import info.plagiatsjaeger.interfaces.IOnlineSearch;

import java.util.HashSet;



/**
 * Description of the class Control.
 *
 *
 */
public class Control {

	private HashSet<IOnlineSearch> iOnlineSearch;
	private IComparer iComparer;
	private MySqlDatabaseHelper mySqlDatabaseHelper;
	public FileParser fileParser;
	public WordProcessing wordProcessing;
	public SourceLoader sourceLoader;


	/**
	 * Description of the method startParsing.
	 *
	 * @param documentHash
	 */
	public void startParsing(int documentHash) {

	}

	/**
	 * Description of the method startPlagiatsSearch.
	 *
	 * @param rId
	 */
	public void startPlagiatsSearch(int rId) {

	}


}