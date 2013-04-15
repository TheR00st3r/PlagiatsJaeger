package info.plagiatsjaeger;

import info.plagiatsjaeger.enums.FileType;


/**
 * Description of the class FileParser.
 */
public class FileParser
{

	/**
	 * Description of the method parseFile.
	 * 
	 * @param filePath
	 * @return result
	 */
	public boolean parseFile(String filePath)
	{
		boolean result = false;

		return result;
	}

	/**
	 * Description of the method detectFileType.
	 * 
	 * @return result
	 */
	private FileType detectFileType()
	{
		FileType result = null;
		return result;
	}

	/**
	 * Description of the method fileToTxt.
	 * 
	 * @return result
	 */
	private boolean fileToTxt()
	{
		boolean result = false;

		return result;
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