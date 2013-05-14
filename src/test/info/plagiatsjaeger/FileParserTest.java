package test.info.plagiatsjaeger;

import static org.junit.Assert.*;

import java.io.File;

import info.plagiatsjaeger.FileParser;
import info.plagiatsjaeger.SourceLoader;
import info.plagiatsjaeger.enums.FileType;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class FileParserTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testParseFile() {
		FileParser fparser = new FileParser();
		SourceLoader sloader = new SourceLoader();
		
		String ergebnisstring1 = "Ich bin eine PDF";
		String ergebnisstring2 = "Ich bin eine doc";
		String ergebnisstring3 = "Ich bin eine docx";
		
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser1.txt"));		//TXT-Datei mit Leerstring
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser2.txt"));		//TXT-Datei mit Inhalt
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser3.pdf"));		//PDF-Datei mit Leerstring
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser4.pdf"));		//PDF-Datei mit Inhalt
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser5.docx"));		//DOCX-Datei mit Leerstring
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser6.docx"));		//DOCX-Datei mit Inhalt
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser7.doc"));		//DOC-Datei mit Leerstring
		assertTrue(fparser.parseFile("/srv/www/testfiles/testfileparser8.doc"));		//DOC-Datei mit Inhalt
		
		assertFalse(fparser.parseFile("/srv/www/testfiles/dateifehlt"));
		assertFalse(fparser.parseFile("/srv/www/testfiles/dateifehlt.txt"));
		assertFalse(fparser.parseFile("/srv/www/testfiles/testfileparser9.pdf"));
		
		assertEquals(ergebnisstring1, sloader.loadFile("/srv/www/testfiles/testfileparser3.txt"));
		assertEquals(ergebnisstring1, sloader.loadFile("/srv/www/testfiles/testfileparser4.txt"));
		assertEquals(ergebnisstring3, sloader.loadFile("/srv/www/testfiles/testfileparser5.txt"));
		assertEquals(ergebnisstring3, sloader.loadFile("/srv/www/testfiles/testfileparser6.txt"));
		assertEquals(ergebnisstring2, sloader.loadFile("/srv/www/testfiles/testfileparser7.txt"));
		assertEquals(ergebnisstring2, sloader.loadFile("/srv/www/testfiles/testfileparser8.txt"));
		
		
		
	}
	
	@After
	public void tearDown() throws Exception {
		File datei1 = new File("/srv/www/testfiles/testfileparser3.txt");
		File datei2 = new File("/srv/www/testfiles/testfileparser4.txt");
		File datei3 = new File("/srv/www/testfiles/testfileparser5.txt");
		File datei4 = new File("/srv/www/testfiles/testfileparser6.txt");
		File datei5 = new File("/srv/www/testfiles/testfileparser7.txt");
		File datei6 = new File("/srv/www/testfiles/testfileparser8.txt");
		datei1.delete();
		datei2.delete();
		datei3.delete();
		datei4.delete();
		datei5.delete();
		datei6.delete();
		
	}
}
