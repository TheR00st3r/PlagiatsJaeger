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
	private static File myFile;
	
	public boolean parseFile(String filePath)
	{
		boolean result = false;
		myFile=new File(filePath);
		return result;
	}

	private FileType detectFileType()
	{
		FileType typ=null;
		if (myFile.getName().endsWith("docx")){
			
			typ=FileType.DOCX;
		}
		else if (myFile.getName().endsWith("doc")){
			typ=FileType.DOC;
			
		}
		else if(myFile.getName().endsWith(".pdf")){
			typ=FileType.PDF;
			
		}
		else if(myFile.getName().endsWith(".txt")){
			typ=FileType.TXT;
			
		}
		return typ;
	}

	private boolean fileToTxt() throws InvalidFormatException,
		OpenXML4JException, XmlException, IOException {

	boolean result = false;
	FileType typ = detectFileType();
	//Filename= Selber Dateiname und Speicherort wie orginale Datei, nur mit txt Endung
	String filename = myFile.getAbsolutePath().toString().substring(0,myFile.getAbsolutePath().toString().length()- typ.toString().length()) + "txt";
	Writer writer = null;
	File file = new File(filename);
	writer = new BufferedWriter(new FileWriter(file));
	String lineSeparator = System.getProperty("line.separator"); //Zeilenumbruch

	FileInputStream inputStream = new FileInputStream(myFile);
	String text = "";

	// Falls .doc
	if (typ == FileType.DOC) {
		//System.out.println("Well, it's a doc!"); // Geht
		POIFSFileSystem fs = new POIFSFileSystem(inputStream);
		HWPFDocument doc = new HWPFDocument(fs);
		WordExtractor we = new WordExtractor(doc);
		//Geht alle Absätze durch und schreibt diese in txt
		String[] paragraphs = we.getParagraphText();
		for (String line : paragraphs) {
			if (line != null && !line.trim().isEmpty()) {
				writer.write(line.trim() + lineSeparator);
			}
		}
		writer.close();
		result = true;
	}
	// falls docx ----> Geht
	else if (typ == FileType.DOCX) {
		try {
			//Entzippt die Docx, parst die XML
			ZipFile docxFile = new ZipFile(myFile);
			ZipEntry documentXML = docxFile.getEntry("word/document.xml");
			InputStream documentXMLIS = docxFile
					.getInputStream(documentXML);
			DocumentBuilderFactory dbf = DocumentBuilderFactory
					.newInstance();
			Document doc = dbf.newDocumentBuilder().parse(documentXMLIS);

			Element tElement = doc.getDocumentElement();
			NodeList n = (NodeList) tElement.getElementsByTagName("w:p");
			//schreibt alle Absätze in die txt
			for (int j = 0; j < n.getLength(); j++) {

				Node child = n.item(j);
				String line = child.getTextContent();

				if (line != null && !line.trim().isEmpty()) {

					writer.write(line.trim() + lineSeparator);
				}

			}
			writer.close();
			docxFile.close();
			result = true;
		} catch (Exception e) {
			System.out.print(e.toString());
			
		}

	} else if (typ == FileType.PDF) { // Geht!
		PDFParser parser = null;
		// String parsedText=null;
		PDFTextStripper pdfStripper;
		PDDocument pdDoc = null;
		COSDocument cosDoc = null;
		// PDDocumentInformation pdDocInfo;

		if (!myFile.isFile()) {
			System.out.println("File does not exist.");
			
		}

		try {
			parser = new PDFParser(new FileInputStream(myFile));
		} catch (Exception e) {
			System.out.println("Unable to open PDF Parser.");

		}

		try {
			parser.parse();
			cosDoc = parser.getDocument();
			pdfStripper = new PDFTextStripper();
			pdDoc = new PDDocument(cosDoc);
			text = pdfStripper.getText(pdDoc);
		} catch (Exception e) {
			System.out.println("An exception occured in parsing the PDF Document.");
			e.printStackTrace();
			try {
				if (cosDoc != null)
					cosDoc.close();
				if (pdDoc != null)
					pdDoc.close();
			} catch (Exception e1) {
				e.printStackTrace();
			}
			
		}
		writer.write(text);
		writer.close();
		result = true;
	} else if (typ == FileType.TXT) {
		// Do nothing
		result = true;
	} else {
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