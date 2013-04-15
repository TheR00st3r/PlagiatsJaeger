package info.plagiatsjaeger;

import info.plagiatsjaeger.enums.FileType;


public class FileParser
{

	public boolean parseFile(String filePath)
	{
		boolean result = false;

		return result;
	}

	private FileType detectFileType()
	{
		FileType result = null;
		return result;
	}

	private boolean fileToTxt()
	{
		boolean result = false;

		return result;
	}

	public interface OnFileParsedListener
	{

		public void onFileParsed(String filePath);

	}
}