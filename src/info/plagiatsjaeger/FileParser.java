package info.plagiatsjaeger;

import java.io.File;

import info.plagiatsjaeger.enums.FileType;


public class FileParser
{
	private static File myFile;
	private static FileType typ;
	
	public boolean parseFile(String filePath)
	{
		boolean result = false;
		myFile=new File(filePath);
		return result;
	}

	private FileType detectFileType()
	{
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

	private boolean fileToTxt()
	{
		boolean result = false;

		//Code zur Sicherung hier eingefügt, wird auskommentiert sobald er komplett ist
		
		
		
		
		
//        List<String> lines = new ArrayList<String>();
// 
//        FileInputStream inputStream = new FileInputStream( myFile );
//       
//        System.out.println("Now if Condition");
//        
//        
//        //Falls .doc
//        if (typ == FileType.DOC){
//        	System.out.println("Well, it's a doc!"); //Geht
//        	 POIFSFileSystem fs = new POIFSFileSystem( inputStream );
//        HWPFDocument doc = new HWPFDocument( fs );
//        WordExtractor we = new WordExtractor( doc );
// 
//        String[] paragraphs = we.getParagraphText();
//        for ( String line : paragraphs ) {
//       	 
//            if ( line != null && !line.trim().isEmpty() ) {
// 
//                lines.add( line.trim() );
//                System.out.println(line.trim());
// 
//            }
// 
//        } 
//        }
//        //falls docx ----> Geht NICHT!!!!
//        else if(typ == FileType.DOCX){
//       
//        	System.out.println("Well, this should be a docx!");
//        	    XWPFDocument docIn = new XWPFDocument(inputStream);
//        	    XWPFWordExtractor extractor = new XWPFWordExtractor(docIn);
//        	    String docText = extractor.getText();
//        	    System.out.print(docText);
//        }
//        else if (typ== FileType.PDF){ //Geht!
//        	System.out.println("Here comes the motherf***ing PDF");
//        	PDFParser parser=null;
//        	    String parsedText=null;
//        	     PDFTextStripper pdfStripper;
//        	     PDDocument pdDoc=null;
//        	     COSDocument cosDoc=null;
//        	    // PDDocumentInformation pdDocInfo;
//        	     
//        	     
//        	        
//        	              if (!myFile.isFile()) {
//        	                 System.out.println("File does not exist.");
//        	                 
//        	              }
//        	        
//        	             try {
//        	                  parser = new PDFParser(new FileInputStream(myFile));
//        	              } catch (Exception e) {
//        	                  System.out.println("Unable to open PDF Parser.");
//        	                 
//        	             }
//        	        
//        	              try {
//        	                  parser.parse();
//        	                  cosDoc = parser.getDocument();
//        	                  pdfStripper = new PDFTextStripper();
//        	                  pdDoc = new PDDocument(cosDoc);
//        	                  parsedText = pdfStripper.getText(pdDoc);
//        	              } catch (Exception e) {
//        	                  System.out.println("An exception occured in parsing the PDF Document.");
//        	                 e.printStackTrace();
//        	                 try {
//        	                        if (cosDoc != null) cosDoc.close();
//        	                        if (pdDoc != null) pdDoc.close();
//        	                     } catch (Exception e1) {
//        	                     e.printStackTrace();
//        	                  }
//        	                 
//        	              }
//        	              System.out.print(parsedText);
//        	             System.out.println("Done.");
//              
//        }
		
		return result;
	}

	public interface OnFileParsedListener
	{

		public void onFileParsed(String filePath);

	}
}