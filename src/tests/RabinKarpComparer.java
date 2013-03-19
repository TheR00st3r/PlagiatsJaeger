package tests;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Random;
import java.util.concurrent.TimeUnit;


public class RabinKarpComparer
{
	/* Konfiguration */
	/*
	 * Basis-Wert: 10 für Zahlensuche verwenden (Anzahl Buchstaben des
	 * Alphabets)
	 */
	int					base				= 257;
	/* initialer Modulo-Wert für die Hash-Funktion */
	int					q					= 1024;
	/*
	 * ab wievielen false matches soll q neu gewählt werden? 0 = Zufallsmodus
	 * ausschalten
	 */
	int					fmThreshold			= 1000;
	/*
	 * Unter- und Obergrenze von q festlegen, z. b. 2^10 - 2^31 2^31 ist bereits
	 * das Maximum für einen int
	 */
	int					minQ				= 10;
	int					maxQ				= 31;

	/* Anzahl der Suchdurchläufe */
	//int					runs				= 1;
	/* Modus bestimmen; true für Textsuche, false für Zahlensuche */
	boolean				textSearch			= true;
	/* Konfiguration-Ende */

	// systemeigenes Zeilenumbruchszeichen ermitteln
	String				sep					= System.getProperty("line.separator");
	boolean				locked				= false;
	String				loadPath			= "";
	StringBuilder		completeString		= new StringBuilder(0);
	String				searchString		= "";
	String				searchedString		= "";
	boolean				fileSelected		= false;
	int					shiftFactor			= 0;
	ArrayList<Integer>	searchPosition		= new ArrayList<Integer>();
	String				timeString			= "";
	/* fm = false matches, Kollisionen */
	int					fm					= 0;
	long				completeTimeDiff	= 0;
	int					minQResult			= 0;
	int					qDiff				= 0;
	/* generische Liste mit allen Zeiten für jeden einzelnen Durchlauf */
	LinkedList<Long>	times				= new LinkedList<Long>();
	/*
	 * wenn bitweise Modulo gerechnet werden soll muss q-1 nicht jedes Mal neu
	 * berechnet werden
	 */
	int					reducedQ			= q - 1;
	int					qChanges			= 0;

	public RabinKarpComparer()
	{
		// TODO Auto-generated constructor stub
		
		 /* Minimum fόr q berechnen, pow ist relativ rechenzeitintensiv */  
		  minQResult = (int) Math.pow(2, minQ);  
		  qDiff = maxQ - minQ + 1;

	}

	/*-----------------------------------------------------------------------------
	 *  initiale Hash-Funktion
	 *-----------------------------------------------------------------------------*/

	int hashFirst(String searchText, int patternLength)
	{
		int result = 0;
		if (textSearch)
		{
			int reducedBase = 1;
			for (int i = (patternLength - 1); i >= 0; i--)
			{
				if (i != (patternLength - 1)) reducedBase = bitModulo(reducedBase * base);

				result += bitModulo(reducedBase * (int) searchText.charAt(i));
				result = bitModulo(result);
			}
			shiftFactor = reducedBase;
		}
		else
		{
			/* für den Zahlensuchmodus wird natürlich eine Basis von 10 benötigt */

			/* Verschiebe-Faktor berechnen */
			shiftFactor = 1;
			for (int i = 1; i < patternLength; i++)
				shiftFactor = bitModulo(shiftFactor * base);

			/* Zahl ausschneiden */
			result = Integer.parseInt(searchText.substring(0, patternLength));
		}
		return bitModulo(result);
	}

	/*-----------------------------------------------------------------------------
	 *  Diese Modulo-Variante arbeitet bitweise mit dem &-Operator und benötigt daher
	 *  als q eine Zweierpotenz
	 *-----------------------------------------------------------------------------*/
	int bitModulo(int x)
	{
		return (x & reducedQ);
	}

	/*-----------------------------------------------------------------------------
	 *  rollende Hash-Funktion
	 *-----------------------------------------------------------------------------*/
	int hash(int oldHashValue, int startPos, int patternLength)
	{
		/*
		 * wenn die gesamte Stringlänge kleiner als die des Musters ist, kann
		 * das Muster nicht vorkommen
		 */
		if (completeString.length() < patternLength) return 0;

		int result = 0;

		int intValue;
		int intValue2;
		if (textSearch)
		{
			/* das erste Zeichen von links bestimmen, das wegfällt */
			intValue = (int) completeString.charAt(startPos - 1);
			/* das hinzukommende Zeichen von rechts bestimmen */
			intValue2 = (int) completeString.charAt(startPos + patternLength - 1);
		}
		else
		{
			/* das erste Zeichen von links bestimmen, das wegfällt */
			intValue = Integer.parseInt(completeString.substring(startPos - 1, startPos));
			/* das hinzukommende Zeichen von rechts bestimmen */
			intValue2 = Integer.parseInt(completeString.substring(startPos + patternLength - 1, startPos + patternLength));
		}

		// System.out.println(oldHashValue + "-" + intValue + "-" + shiftFactor
		// + "-" +
		// base + "-" + intValue2);
		result = ((oldHashValue - (intValue * shiftFactor)) * base) + intValue2;
		result = bitModulo(result);

		return result;
	}

	/*-----------------------------------------------------------------------------
	 *  allgemeine Vorarbeiten
	 *-----------------------------------------------------------------------------*/
	void praeProcessing()
	{
		// if (loadPath == "" || searchString == "") return;

		long completeTimeBefore = 0;
		long completeTimeAfter = 0;

		/* Datei laden */
		completeString.setLength(0);
		// completeString = loadFile(loadPath);

		searchString = "est123456";
		for (int i = 0; i < 10000000; i++)
		{
			completeString.append("HalloTest" + i);
		}
		/* nimm die Vorher-Zeit für Gesamtdurchlauf */
		completeTimeBefore = System.currentTimeMillis();

		/* Algorithmus starten */
		searchPosition = rabinKarp();

		/* nimm die Danach-Zeit für Gesamtdurchlauf und bestimme Differenz */
		completeTimeAfter = System.currentTimeMillis();
		completeTimeDiff = completeTimeAfter - completeTimeBefore;

		/* berechne den Median = Durchschnitt der errechneten Durchläufe */
		long median = calcMedian();

		/* Ausgabe für Gesamtdurchlauf formatieren */
		//timeString = String.format("Gesamtzeit: %02d min, %02d sec, %03d milliseconds, Median über %d-Durchläufe: %02d min, %02d sec, %03d milliseconds \n", TimeUnit.MILLISECONDS.toMinutes(completeTimeDiff), TimeUnit.MILLISECONDS.toSeconds(completeTimeDiff) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(completeTimeDiff)), completeTimeDiff % 1000, runs, TimeUnit.MILLISECONDS.toMinutes(median), TimeUnit.MILLISECONDS.toSeconds(median) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(median)), median % 1000);

		/* letztes Suchfenster für Anzeige festlegen */
		for (int i : searchPosition)
		{
			// int i = searchPosition;
			boolean cutted = false;
			if (i < 0)
			{
				/* nicht gefunden */
				if (completeString.length() > 100)
				{
					searchedString = completeString.substring(0, 100);
					cutted = true;
				}
				else
				{
					searchedString = completeString.substring(0);
				}
			}
			else if ((completeString.length() - i + 1) > 100)
			{
				/* ab der gefundenen Position folgen noch mehr als 100 Zeichen */
				searchedString = completeString.substring(i, i + 100);
				cutted = true;
			}
			else
			{
				/*
				 * ab der gefundenen Position folgen weniger oder genau 100
				 * Zeichen
				 */
				searchedString = completeString.substring(i);
			}
			/* Zeilenumbrüche entfernen */
			searchedString = searchedString.replace("\r\n", " ");
			searchedString = searchedString.replace("\n", " ");
			if (cutted) searchedString = searchedString + " [..]";
			
			System.out.println(searchedString);
		}
		/* Konsolenausgaben */
		/*
		 * die sind deswegen hier drin weil sie in draw() immer wieder
		 * aufgerufen werden würden
		 */
		System.out.println("q-Wechsel: " + qChanges);
		System.out.println(fm + " false matches nach letztem q-Wechsel\n");
		System.out.println("\nAlle Zeiten:\n");
		for (long timeX : times)
		{
			System.out.println(String.format("%02d min, %02d sec, %03d milliseconds", TimeUnit.MILLISECONDS.toMinutes(timeX), TimeUnit.MILLISECONDS.toSeconds(timeX) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(timeX)), timeX % 1000));
		}

		/* bestimme maximale Zeitspanne zwischen Minimum und Maximum */
		/*
		 * muß nach Median-Funktion aufgerufen werden, da sortierte Collection
		 * erforderlich
		 */
		long maxTimeDiff = (times.get(times.size() - 1) - times.get(0));
		System.out.println(String.format("Maximale Differenz: %02d min, %02d sec, %03d milliseconds", TimeUnit.MILLISECONDS.toMinutes(maxTimeDiff), TimeUnit.MILLISECONDS.toSeconds(maxTimeDiff) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(maxTimeDiff)), maxTimeDiff % 1000));

		/* aktuelles q ausgeben */
		System.out.println("aktuelles q: " + q);
	}

	/*-----------------------------------------------------------------------------
	 *  eigentlicher Suchalgorithmus
	 *  - zurückgegeben wird die Suchposition
	 *    oder -1 wenn nicht gefunden
	 *-----------------------------------------------------------------------------*/
	ArrayList<Integer> rabinKarp()
	{
		ArrayList<Integer> result = new ArrayList<Integer>();
		long timeBefore = 0;
		long timeAfter = 0;
		long timeDiff = 0;
		int randomNumber = 0;
		int hs = 0;
		int hsub = 0;
		int n = 0;
		int m = 0;
		int n_m = 0;
		qChanges = 0;
		// boolean found = false;
		times.clear();

		/* Algorithmus gemäß der Anzahl in der Variablen ´runs´ durchlaufen */
		//for (int counter = 1; counter <= runs; counter++)
		//{
			/* n=Länge des gesamten Textes, m=Länge des Musters */
			n = completeString.length();
			m = searchString.length();
			n_m = n - m;

			/* nimm Zeit vorher */
			timeBefore = System.currentTimeMillis();

			/* hs=hash-Wert der ersten Zeichen des gesamten Textes */
			hs = hashFirst(completeString.substring(0, m), m);
			/* hsub=hash-Wert des Musters */
			hsub = hashFirst(searchString, m);

			/*
			 * da die Zufallszahlenerzeugung für die rand. RK-Algorithmus
			 * essentiell ist, messen wir die Instanziierung des Random-Objekts
			 * natürlich jeweils mit
			 */
			Random randomNumbers = new Random();
			/* Variablen für erneute Durchläufe zurücksetzen */
			// result = -1;
			result.clear();

			/*
			 * in fm werden die Anzahl "False Matches" gespeichert, also die
			 * Kollisionen
			 */
			fm = 0;
			// found = false;
			int i = 0;

			/* solange Text noch nicht komplett durchlaufen... */
			for (i = 0; i <= n_m; i++)
			{
				/*
				 * wenn Hashwert des Musters mit dem Hashwert des
				 * Textausschnittes übereinstimmt...
				 */
				if (hs == hsub)
				{
					/* ... und die Strings an der Stelle auch übereinstimmen ... */
					if (completeString.substring(i, i + m).equals(searchString))
					{
						/* Übereinstimmung gefunden */
						result.add(i);
						// found = true;
						//break;
					}
					else
					{
						fm += 1;
						if (fmThreshold != 0)
						{
							if (fm == fmThreshold)
							{
								/*
								 * wähle q neu - eine Zweierpotenz zwischen
								 * 2^minQ bis 2^maxQ
								 */
								randomNumber = randomNumbers.nextInt(qDiff) + minQ;
								/* Schiebeoperatoren sind schneller */
								q = minQResult << (randomNumber - minQ);
								reducedQ = q - 1;
								/* false matches zurücksetzen */
								fm = 0;
								qChanges++;

								/*
								 * mit neuem q muss Hash für Muster und
								 * Gesamtstring auch neu berechnet werden
								 */
								hsub = hashFirst(searchString, m);
								hs = hashFirst(completeString.substring(i, i + m), m);
							}
						}
					}
				}

				/* Bereichsüberlaufsfehler abfangen */
				if ((i + m + 1) > n) break;
				/* nächsten Hashwert bestimmen */
				hs = hash(hs, i + 1, m);
			}

			// if (found) result = i;

			/* nimm Zeit danach und bestimme Differenz */
			timeAfter = System.currentTimeMillis();
			timeDiff = timeAfter - timeBefore;

			/* Zeiten der Gesamttabelle hinzufügen */
			times.add(timeDiff);
		//}

		return result;
	}

	/*-----------------------------------------------------------------------------
	 *  Berechnung des Medians, Erklärung siehe hier:
	 *  http://www.mathe-lexikon.at/statistik/lagemasse/median.html 
	 *-----------------------------------------------------------------------------*/
	long calcMedian()
	{
		long result = 0;

		/* um den Median zu berechnen muß die generische Liste sortiert sein */
		Collections.sort(times);

		/* testen, ob Anzahl ungerade... */
		if (times.size() % 2 != 0)
		{
			/* (da /2 und nicht /2.0 ist es eine Integer-Division) */
			result = times.get((times.size() / 2));
		}
		else
		{
			/*
			 * für den Feld-Index wird natürlich eine gerade Zahl benötigt. Der
			 * errechnete Wert soll natürlich nicht abgeschnitten, sondern
			 * aufgerundet werden
			 */
			result = Math.round((times.get((times.size() / 2) - 1) + times.get(times.size() / 2)) / 2.0);
		}

		return result;
	}
}
