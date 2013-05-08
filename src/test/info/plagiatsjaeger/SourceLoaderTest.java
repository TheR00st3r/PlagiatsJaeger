package test.info.plagiatsjaeger;

import static org.junit.Assert.*;

import javax.swing.JOptionPane;

import info.plagiatsjaeger.SourceLoader;

import org.junit.Before;
import org.junit.Test;

public class SourceLoaderTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testLoadURL() {
		SourceLoader sloader = new SourceLoader();
		
		String ergebnisstring1 = "testseite Hallo ich bin ein Body";
		String ergebnisstring2 = "Das Böse – Wikipedia Das Böse aus Wikipedia, der freien Enzyklopädie Wechseln zu: Navigation, Suche Dieser Artikel behandelt den philosophischen Begriff";
		
		String teststring1 = "http://192.168.4.28/testfiles/testseite.html";
		String teststring2 = "http://www.assdsdadasdasdasda.de";
		String teststring3 = "www.plagiatsjaeger.de.de.de";
		String teststring4 = ""; 
		String teststring5 = "www.plagiatsjaeger.info/projektplan/projektteam/"; 
		String teststring6 = "plagiatsjaeger.info/projektplan/projektteam/"; 
		String teststring7 = "http://de.wikipedia.org/wiki/Das_Böse";
			
		 assertEquals(ergebnisstring1, sloader.loadURL(teststring1) );
		 assertTrue(sloader.loadURL(teststring7).contains(ergebnisstring2));
		 assertTrue(sloader.loadURL(teststring2).contains("FAIL IOException"));
		 assertTrue(sloader.loadURL(teststring3).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring4).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring5).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring6).contains("FAIL MalformedURLException"));
		
	}

	@Test
	public void testLoadFile() {
		SourceLoader sloader = new SourceLoader();
		
		String ergebnisstring1 = "";
		String ergebnisstring2 = "Hallo, ich bin ein/nZeilenumbruch";
		String ergebnisstring3 = "Gesperrtes File";
		String ergebnisstring4 = "Döner mit Soße & einer bärigen türkischen Bananen & Co KG";
		
		assertTrue(sloader.loadFile("/srv/www/testfiles/testfile3.txt").contains("FAIL FileNotFoundException"));
		assertEquals(ergebnisstring1, sloader.loadFile("/srv/www/testfiles/testfile1.txt"));
		assertEquals(ergebnisstring2, sloader.loadFile("/srv/www/testfiles/fehlendesfile.txt"));
		assertTrue(sloader.loadFile("/srv/www/testfiles/testfile3.txt").contains("FAIL IOException"));
		assertEquals(ergebnisstring4, sloader.loadFile("/srv/www/testfiles/testfile4.txt"));

	}

}
