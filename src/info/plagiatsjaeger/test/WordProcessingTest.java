package info.plagiatsjaeger.test;

import static org.junit.Assert.*;
import info.plagiatsjaeger.WordProcessing;

import org.junit.Before;
import org.junit.Test;

public class WordProcessingTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSplitToWords() {
		String teststring1 = "Hallo ich bin ein Test";
		String teststring2 = "Ich bin ein\nZeilenumbruch";
		String teststring3 = "Hallo, ich bin ein Kommasatz. Und noch ein Satz";
		String teststring4 = "blabla - und so weiter.";
		String teststring5 = "GmbH & Co soll zusammengeschrieben werden.";
		
		String[] testarray1 = {"Hallo", "ich", "bin", "ein", "Test"};
		String[] testarray2 = {"Ich", "bin", "ein", "Zeilenumbruch"};
		String[] testarray3 = {"Hallo," ,"ich", "bin", "ein", "Kommasatz.", "Und", "noch", "ein", "Satz"};
		String[] testarray4 = {"blabla -", "und", "so", "weiter."};
		String[] testarray5 = {"GmbH &", "Co", "soll", "zusammengeschrieben", "werden."};
		
		WordProcessing testword = new WordProcessing();
		
		testword.splitToWords(teststring1);
		testword.splitToWords(teststring2);
		testword.splitToWords(teststring3);
		testword.splitToWords(teststring4);
		testword.splitToWords(teststring5);
		
		assertArrayEquals(testarray1, testword.splitToWords(teststring1));
		assertArrayEquals(testarray2, testword.splitToWords(teststring2));
		assertArrayEquals(testarray3, testword.splitToWords(teststring3));
		assertArrayEquals(testarray4, testword.splitToWords(teststring4));
		assertArrayEquals(testarray5, testword.splitToWords(teststring5));
		
		
		fail("SplitToWords l‰uft nicht ordnungsgem‰ﬂ.");
	}

	@Test
	public void testGetVerbsAndNouns() {
		fail("Not yet implemented");
	}

}
