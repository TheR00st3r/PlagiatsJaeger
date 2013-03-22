package plagiatssoftware;

import java.util.ArrayList;
import java.util.Random;


public class RabinKarpComparer
{
	// Basis-Wert: 257 für Anzahl Buchstaben des Alphabets
	private final int			BASE				= 257;
	// initialer Modulo-Wert für die Hash-Funktion. Muss eine 2er Potenz sein
	private int					q					= 1024;
	// damit q-1 nicht bei jeder Moduloberechnung erneut berechnet werden muss
	private int					reducedQ			= q - 1;

	// ab wievielen false matches soll q neu gewählt werden? 0 = Zufallsmodus
	// ausschalten
	private final int			MAX_FALSEMATCHES	= 1000;

	// Min und Max von q festlegen, z. b. 2^10 - 2^31 Integer: Max 2^31
	private final int			MIN_Q				= 10;
	private final int			MAX_Q				= 31;

	private int					_shiftFactor;
	private ArrayList<Integer>	_resultPositions	= new ArrayList<Integer>();

	private int					_falseMatches;
	private int					_minQResult;
	private int					_qDiff;

	private int					_SingleSearchThreadCounter;

	/**
	 * Beinhaltet Funktionen zum Durchsuchen von Strings mithilfe des
	 * RabinKarpAlgorithmus.
	 * 
	 * @author Andreas Hahn
	 */
	public RabinKarpComparer()
	{
		// Minimum fuer q berechnen, pow ist relativ rechenzeitintensiv
		_minQResult = (int) Math.pow(2, MIN_Q);
		_qDiff = MAX_Q - MIN_Q + 1;
	}

	/**
	 * Durchsucht den completeString nach Vorkommnissen der searchStrings in
	 * jeweils einem eigenen Task. Wenn die Suche abgeschlossen ist wird das
	 * Ergebniss durch den {@link OnSearchFinishedListener} zur�ckgeliefert.
	 * 
	 * @param searchStrings
	 * @param completeString
	 * @param listener
	 */
	public void searchAsync(final ArrayList<String> searchStrings, StringBuilder completeString, final OnSearchFinishedListener listener)
	{
		final ArrayList<ArrayList<String>> searchResults = new ArrayList<ArrayList<String>>();
		for (String searchString : searchStrings)
		{
			searchAsync(searchString, completeString, new OnSingleSearchFinishedListener()
			{
				@Override
				public void onSearchFinished(String searchString, ArrayList<String> searchResult)
				{
					editCounter(-1);
					searchResults.add(searchResult);
					if (_SingleSearchThreadCounter <= 0)
					{
						listener.onSearchFinished(searchStrings, searchResults);
					}
				}
			});
		}
	}

	/**
	 * Managed den Zugriff auf den {@link _SingleSearchCounter}, damit immer nur
	 * 1 Thread gleichzeitig zugriff bekommt.
	 */
	private synchronized void editCounter(int delta)
	{
		_SingleSearchThreadCounter += delta;
	}

	/**
	 * Durchsucht den completeString nach Vorkommnissen des searchString in
	 * einem extra Task. Wenn die Suche abgeschlossen ist wird das Ergebniss
	 * durch den {@link OnSingleSearchFinishedListener} zur�ckgeliefert.
	 * 
	 * @param searchString
	 * @param completeString
	 * @param listener
	 */
	public void searchAsync(final String searchString, final StringBuilder completeString, final OnSingleSearchFinishedListener listener)
	{
		new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				editCounter(1);
				ArrayList<String> searchResult = search(searchString, completeString);
				listener.onSearchFinished(searchString, searchResult);
			}
		}).start();
	}

	/**
	 * Sucht nach allen Vorkommnissen der searchStrings in completeString.
	 * 
	 * @param searchStrings
	 * @param completeString
	 * @return eine ArrayListe von Ergebnsslisten
	 */
	public ArrayList<ArrayList<String>> search(ArrayList<String> searchStrings, StringBuilder completeString)
	{
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		for (String searchString : searchStrings)
		{
			result.add(search(searchString, completeString));
		}
		return result;
	}

	/**
	 * Wird ausgel�st, sobald die Suche beendet ist
	 * 
	 * @author Andreas
	 */
	public interface OnSingleSearchFinishedListener
	{
		abstract void onSearchFinished(String searchString, ArrayList<String> searchResult);
	}

	/**
	 * Wird ausgel�st wenn alle Suchen fertig sind.
	 * 
	 * @author Andreas
	 */
	public interface OnSearchFinishedListener
	{
		abstract void onSearchFinished(ArrayList<String> searchStrings, ArrayList<ArrayList<String>> searchResults);
	}

	/**
	 * Durchsucht den String im StringBuilder nach vorkommnissen des
	 * searchStrings.
	 * 
	 * @param searchString
	 * @param completeString
	 * @return Eine ArrayList mit Treffern inkl. der n�chsten 100 Zeichen
	 */
	public ArrayList<String> search(String searchString, StringBuilder completeString)
	{
		ArrayList<String> result = new ArrayList<String>();
		_resultPositions = searchRabinKarb(searchString, completeString);

		String searchResult = "";
		for (int i : _resultPositions)
		{
			boolean cutted = false;
			if (i < 0)
			{
				// nichts gefunden
				if (completeString.length() > 100)
				{
					searchResult = completeString.substring(0, 100);
					cutted = true;
				}
				else
				{
					searchResult = completeString.substring(0);
				}
			}
			else if ((completeString.length() - i + 1) > 100)
			{
				// ab der gefundenen Position folgen noch mehr als 100 Zeichen
				searchResult = completeString.substring(i, i + 100);
				cutted = true;
			}
			else
			{
				// ab der gefundenen Position folgen weniger oder genau 100
				// Zeichen
				searchResult = completeString.substring(i);
			}
			// Zeilenumbrüche entfernen
			searchResult = searchResult.replace("\r\n", " ");
			searchResult = searchResult.replace("\n", " ");
			if (cutted) searchResult = searchResult + " [..]";

			result.add(searchResult);
		}
		return result;
	}

	/**
	 * Berechnung des 1. Hashwertes, von dem aus im Anschluss die neuen Hashes
	 * weitergerollt werden. Siehe {@link #hash}
	 * 
	 * @param searchText
	 * @param patternLength
	 * @return
	 */
	private int hashFirst(String searchText, int patternLength)
	{
		int result = 0;
		int reducedBase = 1;
		for (int i = (patternLength - 1); i >= 0; i--)
		{
			if (i != (patternLength - 1)) reducedBase = bitModulo(reducedBase * BASE);

			result += bitModulo(reducedBase * (int) searchText.charAt(i));
			result = bitModulo(result);
		}
		_shiftFactor = reducedBase;
		result = bitModulo(result);

		return result;
	}

	/**
	 * Bitweise Moduloberechnung. Daher wird für q eine 2er Potenz benötigt
	 * 
	 * @param x
	 * @return
	 */
	private int bitModulo(int x)
	{
		return (x & reducedQ);
	}

	/**
	 * Rollende HashFunktion
	 * 
	 * @param oldHashValue
	 * @param startPos
	 * @param patternLength
	 * @return
	 */
	private int hash(int oldHashValue, int startPos, int patternLength, StringBuilder completeString)
	{

		int result = 0;
		// wenn die gesamte Stringlänge kleiner als die des Musters ist, kann
		// das Muster nicht vorkommen
		if (completeString.length() >= patternLength)
		{
			int intValue;
			int intValue2;

			// das erste Zeichen von links bestimmen, das wegfällt
			intValue = (int) completeString.charAt(startPos - 1);
			// das hinzukommende Zeichen von rechts bestimmen
			intValue2 = (int) completeString.charAt(startPos + patternLength - 1);

			result = ((oldHashValue - (intValue * _shiftFactor)) * BASE) + intValue2;
			result = bitModulo(result);
		}
		return result;
	}

	/**
	 * Suchfunktion nach RabinKarp
	 * 
	 * @param searchString
	 *            Text nach dem gesucht werden soll
	 * @param completeString
	 *            Text als StringBuilder der durchsucht werden soll
	 * @return Liefter eine liste der Positionen(int) der Treffer zurück
	 */
	private ArrayList<Integer> searchRabinKarb(String searchString, StringBuilder completeString)
	{
		ArrayList<Integer> result = new ArrayList<Integer>();
		int intRandomNumber = 0;
		int intHashStringPart = 0;
		int intHashSearch = 0;
		// Länge des gesamten Textes
		int intLengthComplete = completeString.length();
		// Länge des Suchtextes
		int intLengthSearchString = searchString.length();
		int intLengthDifference = intLengthComplete - intLengthSearchString;

		// hash-Wert der ersten Zeichen des gesamten Textes
		intHashStringPart = hashFirst(completeString.substring(0, intLengthSearchString), intLengthSearchString);
		// Wert des Musters
		intHashSearch = hashFirst(searchString, intLengthSearchString);

		// da die Zufallszahlenerzeugung für die rand. RK-Algorithmus essentiell
		// ist, messen wir die Instanziierung des Random-Objekts natürlich
		// jeweils mit
		Random randomNumbers = new Random();

		// in falseMatches werden die Anzahl "False Matches" gespeichert, also
		// die Kollisionen
		_falseMatches = 0;

		// solange Text noch nicht komplett durchlaufen
		for (int i = 0; i <= intLengthDifference; i++)
		{
			// wenn Hashwert des Musters mit dem Hashwert des Textausschnittes
			// übereinstimmt...
			if (intHashStringPart == intHashSearch)
			{
				// und die Strings an der Stelle auch übereinstimmen
				if (completeString.substring(i, i + intLengthSearchString).equals(searchString))
				{
					// Übereinstimmung gefunden
					result.add(i);
				}
				else
				{
					_falseMatches++;
					if (MAX_FALSEMATCHES != 0)
					{
						if (_falseMatches == MAX_FALSEMATCHES)
						{
							// wähle q neu - eine Zweierpotenz zwischen 2^minQ
							// bis 2^maxQ
							intRandomNumber = randomNumbers.nextInt(_qDiff) + MIN_Q;
							// Schiebeoperatoren sind schneller
							q = _minQResult << (intRandomNumber - MIN_Q);
							reducedQ = q - 1;
							// false matches zurücksetzen
							_falseMatches = 0;

							// mit neuem q muss Hash für Muster und Gesamtstring
							// auch neu berechnet werden
							intHashSearch = hashFirst(searchString, intLengthSearchString);
							intHashStringPart = hashFirst(completeString.substring(i, i + intLengthSearchString), intLengthSearchString);
						}
					}
				}
			}

			// Bereichsüberlaufsfehler abfangen
			if ((i + intLengthSearchString + 1) > intLengthComplete) break;
			// nächsten Hashwert bestimmen
			intHashStringPart = hash(intHashStringPart, i + 1, intLengthSearchString, completeString);
		}
		return result;
	}
}
