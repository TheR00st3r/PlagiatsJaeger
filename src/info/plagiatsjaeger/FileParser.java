package info.plagiatsjaeger;

/**
 * Description of the class FileParser.
 */
public class FileParser
{

	private static int	PDF		= 0;
	private static int	DOC		= 1;
	private static int	DOCX	= 2;
	private static int	TXT		= 3;

	/**
	 * Description of the method parseFile.
	 * 
	 * @param filePath
	 * @return result
	 */
	public boolean parseFile(String filePath)
	{

	}

	/**
	 * Description of the method detectFileType.
	 * 
	 * @return result
	 */
	private int detectFileType()
	{

	}

	/**
	 * Description of the method fileToTxt.
	 * 
	 * @return result
	 */
	private boolean fileToTxt()
	{

	}

	/**
	 * Description of the interface OnFileParsedListener.
	 */
	public interface OnFileParsedListener
	{

		/**
		 * Description of the method onFileParsed.
		 * 
		 * @param filePath
		 */
		public void onFileParsed(String filePath);

	}
}