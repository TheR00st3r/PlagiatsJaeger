package info.plagiatsjaeger;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;



/**
 * Description of the class RabinKarpComparer.
 *
 *
 */
public class RabinKarpComparer implements IComparer{

	private Connection _connection = null;
	private Statement _statement = null;


	/**
	 * Description of the method generateHash.
	 *
	 * @param oldHashValue
	 * @param startPosition
	 * @param patternLength
	 * @param completeString
	 * @return result
	 */
	private int generateHash(int oldHashValue, int startPosition, int patternLength, String completeString) {

	}

	/**
	 * Description of the method bitwiseModulo.
	 *
	 * @param value
	 * @return result
	 */
	private int bitwiseModulo(int value) {

	}

	/**
	 * Description of the method firstHash.
	 *
	 * @param searchText
	 * @param patternLength
	 * @return result
	 */
	private int firstHash(int searchText, int patternLength) {

	}

	/**
	 * Description of the method rabinKarbSearch.
	 *
	 * @param searchString
	 * @param textToCheck
	 * @param startPosition
	 * @return result
	 */
	private int rabinKarbSearch(String searchString, String textToCheck, int startPosition) {

	}


}