package info.plagiatsjaeger;

import info.plagiatsjaeger.enums.FileType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.xmlbeans.XmlException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


/**
 * @author Christian
 */
public class FileParser
{
	private File	_file;

	private static final Logger	log				= Logger.getLogger(FileParser.class.getName());

	/**
	 * startet die Konvertierung der Datei
	 * 
	 * @param String
	 *            filePath, gibt den Speicherpfad der zu konvertierende Datei an
	 * @return boolean result, gibt bei Erfolg true zurueck
	 */
	public boolean parseFile(String filePath)
	{
		boolean result = false;
		_file = new File(filePath);
		try
		{
			result = fileToTxt();
		}
		catch (InvalidFormatException e)
		{
			e.printStackTrace();
		}
		catch (OpenXML4JException e)
		{
			e.printStackTrace();
		}
		catch (XmlException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Ermittelt den Dateityp der Datei
	 * 
	 * @return FileTyp result, gibt den ermittelten Enum-Wert zurueck
	 */
	private FileType detectFileType()
	{
		FileType result = null;
		String fileName = _file.getName();
		if (fileName.endsWith("docx"))
		{
			result = FileType.DOCX;
		}
		else if (fileName.endsWith("doc"))
		{
			result = FileType.DOC;
		}
		else if (fileName.endsWith(".pdf"))
		{
			result = FileType.PDF;
		}
		else if (fileName.endsWith(".txt"))
		{
			result = FileType.TXT;
		}
		return result;
	}

	/**
	 * Liesst die gegebende Datei ein und speichert den beinhalteten Text in
	 * einer txt File unter dem selben Namen und Speicherort ab.
	 * 
	 * @return boolean result; true falls Konvertierung erfolgreich
	 * @throws InvalidFormatException
	 *             ; Falls eine Datei mit falscher Endung abgespeichert war
	 * @throws OpenXML4JException
	 *             ; Falls docx auslesen Fehlschlaegt
	 * @throws XmlException
	 *             ; Falls es Probleme mit docx gibt
	 * @throws IOException
	 *             ; falls auf die Dateien nicht zugegriffen werden kann
	 */
	private boolean fileToTxt() throws InvalidFormatException, OpenXML4JException, XmlException, IOException
	{
		boolean result = false;
		FileType fileTyp = detectFileType();
		// Filename= Selber Dateiname und Speicherort wie orginale Datei, nur
		// mit txt Endung
		String strName = _file.getAbsolutePath().toString().substring(0, _file.getAbsolutePath().toString().length() - fileTyp.toString().length()) + "txt";
		Writer writer = null;
		File file = new File(strName);
		writer = new BufferedWriter(new FileWriter(file));
		String strLineSeparator = System.getProperty("line.separator"); // Zeilenumbruch

		FileInputStream fileInputStream = new FileInputStream(_file);
		String text = "";

		switch (fileTyp)
		{
			case DOC:
			{
				POIFSFileSystem poifsFileSystem = new POIFSFileSystem(fileInputStream);
				HWPFDocument hwpfDoc = new HWPFDocument(poifsFileSystem);
				WordExtractor we = new WordExtractor(hwpfDoc);
				// Geht alle Absaetze durch und schreibt diese in txt
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
				break;
			}
			case DOCX:
			{
				ZipFile zipFile = null;
				try
				{
					// Entzippt die Docx, parst die XML
					zipFile = new ZipFile(_file);
					ZipEntry zipEntryXML = zipFile.getEntry("word/document.xml");
					InputStream inputStreamXMLIS = zipFile.getInputStream(zipEntryXML);
					DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
					Document doc = dbf.newDocumentBuilder().parse(inputStreamXMLIS);

					Element element = doc.getDocumentElement();
					NodeList n = (NodeList) element.getElementsByTagName("w:p");
					// schreibt alle Absaetze in die txt
					for (int j = 0; j < n.getLength(); j++)
					{
						Node nChild = n.item(j);
						String strLine = nChild.getTextContent();
						if (strLine != null && !strLine.trim().isEmpty())
						{
							writer.write(strLine.trim() + strLineSeparator);
						}
					}
					result = true;
				}
				catch (Exception e)
				{
					System.out.print(e.toString());
				}
				finally
				{
					if (writer != null)
					{
						writer.close();
					}
					if (zipFile != null)
					{
						zipFile.close();
					}
				}
				break;
			}
			case PDF:
			{
				PDFParser pdfParser = null;

				PDFTextStripper pdfStripper;
				PDDocument pdDoc = null;
				COSDocument cosDoc = null;
				// PDDocumentInformation pdDocInfo;

				if (!_file.isFile())
				{
					System.out.println("File does not exist.");
				}
				try
				{
					pdfParser = new PDFParser(new FileInputStream(_file));
				}
				catch (FileNotFoundException e)
				{
					e.printStackTrace();
				}
				catch (IOException e)
				{
					e.printStackTrace();
					System.out.println("Unable to open PDF Parser.");
				}
				try
				{
					pdfParser.parse();
					cosDoc = pdfParser.getDocument();
					pdfStripper = new PDFTextStripper();
					pdDoc = new PDDocument(cosDoc);
					text = pdfStripper.getText(pdDoc);
					result = true;
				}
				catch (IOException e)
				{
					System.out.println("An exception occured in parsing the PDF Document.");
					e.printStackTrace();
					try
					{
						if (cosDoc != null) cosDoc.close();
						if (pdDoc != null) pdDoc.close();
					}
					catch (IOException e1)
					{
						e.printStackTrace();
					}
				}
				finally
				{
					writer.write(text);
					writer.close();
				}
				break;
			}
			case TXT:
			{
				result = true;
				break;
			}
			default:
			{
				break;
			}
		}

		System.out.println("fertig");
		return result;
	}
}