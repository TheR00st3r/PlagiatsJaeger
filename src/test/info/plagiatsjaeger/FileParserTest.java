package test.info.plagiatsjaeger;

import static org.junit.Assert.*;
import info.plagiatsjaeger.FileParser;
import info.plagiatsjaeger.SourceLoader;
import info.plagiatsjaeger.enums.*;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class FileParserTest
{

	@Before
	public void setUp() throws Exception
	{
	}

	@Test
	public void testParseFile()
	{
		FileParser fparser = new FileParser();

		String ergebnisstring1 = "Ich bin eine PDF";
		String ergebnisstring2 = "Ich bin eine doc";
		String ergebnisstring3 = "Ich bin eine docx";

		 assertTrue(fparser.parseFile(1)); //TXT-Datei mit Leerstring
		 assertTrue(fparser.parseFile(2)); //TXT-Datei mit Inhalt
		 assertTrue(fparser.parseFile(3)); //PDF-Datei mit Leerstring
		 assertTrue(fparser.parseFile(4)); //PDF-Datei mit Inhalt
		 assertTrue(fparser.parseFile(5)); //DOCX-Datei mit Leerstring
		 assertTrue(fparser.parseFile(6)); //DOCX-Datei mit Inhalt
		 assertTrue(fparser.parseFile(7)); //DOC-Datei mit Leerstring
		 assertTrue(fparser.parseFile(8)); //DOC-Datei mit Inhalt
		
		 assertFalse(fparser.parseFile(0));
		 assertFalse(fparser.parseFile(9)); //falsches Dateiende
		
		 assertEquals(ergebnisstring1,
		 SourceLoader.loadFile("/var/www/uploads/3.txt"));
		 assertEquals(ergebnisstring1,
		 SourceLoader.loadFile("/var/www/uploads/4.txt"));
		 assertEquals(ergebnisstring3,
		 SourceLoader.loadFile("/var/www/uploads/5.txt"));
		 assertEquals(ergebnisstring3,
		 SourceLoader.loadFile("/var/www/uploads/6.txt"));
		 assertEquals(ergebnisstring2,
		 SourceLoader.loadFile("/var/www/uploads/7.txt"));
		 assertEquals(ergebnisstring2,
		 SourceLoader.loadFile("/var/www/uploads/8.txt"));

	}

	@After
	public void tearDown() throws Exception
	{
		 File datei1 = new File("/var/www/uploads/3.txt");
		 File datei2 = new File("/var/www/uploads/4.txt");
		 File datei3 = new File("/var/www/uploads/5.txt");
		 File datei4 = new File("/var/www/uploads/6.txt");
		 File datei5 = new File("/var/www/uploads/7.txt");
		 File datei6 = new File("/var/www/uploads/8.txt");
		 datei1.delete();
		 datei2.delete();
		 datei3.delete();
		 datei4.delete();
		 datei5.delete();
		 datei6.delete();

	}
}
