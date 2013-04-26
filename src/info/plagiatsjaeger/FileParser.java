package info.plagiatsjaeger;

import java.io.File;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.Writer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import java.io.FileInputStream;
import java.io.IOException;
import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.xmlbeans.XmlException;
import info.plagiatsjaeger.enums.FileType;


public class FileParser
{
	private File _fileMy;

	/**
	 * startet die Konvertierung der Datei
	 * 
	 * @param String filePath, gibt den Speicherpfad der zu konvertierende Datei an
	 * @return boolean result, gibt bei Erfolg true zurück
	 * @throws NException Hier kann es sich um InvalidFormatException, OpenXML4JException, XmlException, IOException handeln
	 */
	public boolean parseFile(String filePath)
	{
		boolean result = false;
		_fileMy = new File(filePath);
		try
		{
			result=fileToTxt();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			result = false;
		}
	
		return result;
	}
	
	/**
	 * Ermittelt den Dateityp der Datei
	 * 
	 * @return FileTyp result, gibt den ermittelten Enum-Wert zurück
	  */
	private FileType detectFileType()
	{
		FileType result = null;
		if (_fileMy.getName().endsWith("docx"))
		{

			result = FileType.DOCX;
		}
		else if (_fileMy.getName().endsWith("doc"))
		{
			result = FileType.DOC;

		}
		else if (_fileMy.getName().endsWith(".pdf"))
		{
			result = FileType.PDF;

		}
		else if (_fileMy.getName().endsWith(".txt"))
		{
			result = FileType.TXT;

		}
		return result;
	}
/**
 * Ließt die gegebende Datei ein und speichert den beinhalteten Text in einer txt File unter dem selben Namen und Speicherort ab.
 * @return boolean result; true falls Konvertierung erfolgreich
 * @throws InvalidFormatException; Falls eine Datei mit falscher Endung abgespeichert war
 * @throws OpenXML4JException; Falls docx auslesen Fehlschlägt
 * @throws XmlException; Falls es Probleme mit docx gibt
 * @throws IOException; falls auf die Dateien nicht zugegriffen werden kann
 */
	private boolean fileToTxt() throws InvalidFormatException, OpenXML4JException, XmlException, IOException
	{

		boolean result = false;
		FileType fTyp = detectFileType();
		// Filename= Selber Dateiname und Speicherort wie orginale Datei, nur
		// mit txt Endung
		String strName = _fileMy.getAbsolutePath().toString().substring(0, _fileMy.getAbsolutePath().toString().length() - fTyp.toString().length()) + "txt";
		Writer writer = null;
		File file = new File(strName);
		writer = new BufferedWriter(new FileWriter(file));
		String strLineSeparator = System.getProperty("line.separator"); // Zeilenumbruch

		FileInputStream fileInputStream = new FileInputStream(_fileMy);
		String text = "";

		// Falls .doc
		if (fTyp == FileType.DOC)
		{
			POIFSFileSystem poifsFileSystem = new POIFSFileSystem(fileInputStream);
			HWPFDocument hwpfDoc = new HWPFDocument(poifsFileSystem);
			WordExtractor we = new WordExtractor(hwpfDoc);
			// Geht alle Absätze durch und schreibt diese in txt
			String[] strParagraphs = we.getParagraphText();
			for (String line : strParagraphs)
			{
				if (line != null && !line.trim().isEmpty())
				{
					writer.write(line.trim() + strLineSeparator);
				}
			}
			writer.close();
			result = true;
		}
		// falls docx 
		else if (fTyp == FileType.DOCX)
		{
			try
			{
				// Entzippt die Docx, parst die XML
				ZipFile zipFile = new ZipFile(_fileMy);
				ZipEntry zipEntryXML = zipFile.getEntry("word/document.xml");
				InputStream inputStreamXMLIS = zipFile.getInputStream(zipEntryXML);
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				Document doc = dbf.newDocumentBuilder().parse(inputStreamXMLIS);

				Element element = doc.getDocumentElement();
				NodeList n = (NodeList) element.getElementsByTagName("w:p");
				// schreibt alle Absätze in die txt
				for (int j = 0; j < n.getLength(); j++)
				{

					Node nChild = n.item(j);
					String strLine = nChild.getTextContent();

					if (strLine != null && !strLine.trim().isEmpty())
					{

						writer.write(strLine.trim() + strLineSeparator);
					}

				}
				writer.close();
				zipFile.close();
				result = true;
			}
			catch (Exception e)
			{
				System.out.print(e.toString());

			}

		}
		else if (fTyp == FileType.PDF)
		{ // Geht!
			PDFParser pdfParser = null;
			
			PDFTextStripper pdfStripper;
			PDDocument pdDoc = null;
			COSDocument cosDoc = null;
			// PDDocumentInformation pdDocInfo;

			if (!_fileMy.isFile())
			{
				System.out.println("File does not exist.");

			}

			try
			{
				pdfParser = new PDFParser(new FileInputStream(_fileMy));
			}
			catch (Exception e)
			{
				System.out.println("Unable to open PDF Parser.");

			}

			try
			{
				pdfParser.parse();
				cosDoc = pdfParser.getDocument();
				pdfStripper = new PDFTextStripper();
				pdDoc = new PDDocument(cosDoc);
				text = pdfStripper.getText(pdDoc);
			}
			catch (Exception e)
			{
				System.out.println("An exception occured in parsing the PDF Document.");
				e.printStackTrace();
				try
				{
					if (cosDoc != null) cosDoc.close();
					if (pdDoc != null) pdDoc.close();
				}
				catch (Exception e1)
				{
					e.printStackTrace();
				}

			}
			writer.write(text);
			writer.close();
			result = true;
		}
		else if (fTyp == FileType.TXT)
		{
			// Do nothing
			result = true;
		}
		else
		{
			// brauchen wir eine Fehlerbehandlung?
		}
		System.out.println("fertig");
		return result;

	}

	public interface OnFileParsedListener
	{

		public void onFileParsed(String filePath);

	}
}