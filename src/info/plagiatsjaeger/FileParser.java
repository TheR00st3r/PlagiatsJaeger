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
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
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
	private File				_file;

	private static final Logger	_logger	= Logger.getLogger(FileParser.class.getName());

	/**
	 * startet die Konvertierung der Datei
	 * 
	 * @param String
	 *            filePath, gibt den Speicherpfad der zu konvertierende Datei an
	 * @return boolean result, gibt bei Erfolg true zurueck
	 */
	public boolean parseFile(int dId, FileType fileType)
	{
		_logger.info("Start parsing: " + dId);
		boolean result = false;
		_file = new File(Control.ROOT_FILES + dId + "." + fileType);
		_logger.info("New File angelegt");
		try
		{
			result = fileToTxt(fileType);
		}
		catch (InvalidFormatException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}
		catch (OpenXML4JException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}
		catch (XmlException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
		}
		catch (IOException e)
		{
			_logger.fatal(e.getMessage());
			e.printStackTrace();
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
	private boolean fileToTxt(FileType fileTyp) throws InvalidFormatException, OpenXML4JException, XmlException, IOException
	{
		boolean result = false;
		
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
				_logger.info("Filetype = DOC");
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
				_logger.info("Filetype = DOCX");
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
					e.printStackTrace();
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
				_logger.info("Filetype = PDF");
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
					_logger.fatal(e.getMessage());
					e.printStackTrace();
				}
				catch (IOException e)
				{
					_logger.fatal(e.getMessage());
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
					_logger.fatal(e.getMessage());
					System.out.println("An exception occured in parsing the PDF Document.");
					e.printStackTrace();
					try
					{
						if (cosDoc != null) cosDoc.close();
						if (pdDoc != null) pdDoc.close();
					}
					catch (IOException e1)
					{
						_logger.fatal(e.getMessage());
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
			case HTML:{
				
			}
			case TXT:
			{
				_logger.info("Filetype = TXT");
				// TODO: txt auf gueltigkeit ueberpruefen.
				result = true;
				break;
			}
			default:
			{
				break;
			}
		}

		_logger.info("Fileparsed:" + _file.getName());
		return result;
	}
}