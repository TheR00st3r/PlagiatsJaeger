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
		
		String ergebnisstring1 = "Plagiatsjäger  | Projektteam Willkommen Berichte Projektplan Projektstrukturplan Projektteam Risikoanalyse Designstudie Applikation Dokumentationen Plagiatsjäger Projektteam Entschuldigung aber du hast nicht die Rechte um diese Seite zu sehen! Archive April 2013 (5) März 2013 (2) Kategorien Allgemein (7) Meta Anmelden Beitrags-Feed (RSS) Kommentare als RSS WordPress.org © by Plagiatsjäger, 2013 | www.plagiatsjaeger.info | team@plagiatsjaeger.info | app.plagiatsjaeger.info";
		String ergebnisstring2 = "Das Böse – Wikipedia Das Böse aus Wikipedia, der freien Enzyklopädie Wechseln zu: Navigation, Suche Dieser Artikel behandelt den philosophischen Begriff";
		
		String teststring1 = "http://www.plagiatsjaeger.info/projektplan/projektteam/";
		String teststring2 = "http://www.assdsdadasdasdasda.de";
		String teststring3 = "www.plagiatsjaeger.de.de.de";
		String teststring4 = ""; 
		String teststring5 = "www.plagiatsjaeger.info/projektplan/projektteam/"; 
		String teststring6 = "plagiatsjaeger.info/projektplan/projektteam/"; 
		String teststring7 = "http://de.wikipedia.org/wiki/Das_Böse";
		
		System.out.print(sloader.loadURL(teststring7));
			
		 assertEquals(ergebnisstring1, sloader.loadURL(teststring1) );
		 assertTrue(sloader.loadURL(teststring7).contains(ergebnisstring2));
		 assertTrue(sloader.loadURL(teststring2).contains("FAIL IOException"));
		 assertTrue(sloader.loadURL(teststring3).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring4).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring5).contains("FAIL MalformedURLException"));
		 assertTrue(sloader.loadURL(teststring6).contains("FAIL MalformedURLException"));
		
	}

//	@Test
//	public void testLoadFile() {
//		fail("Not yet implemented");
//	}

}
