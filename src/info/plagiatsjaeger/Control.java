package info.plagiatsjaeger;

import java.util.HashSet;
import System.Backend.Interfaces.IOnlineSearch;
import System.Backend.Interfaces.IComparer;



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