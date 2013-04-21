package info.plagiatsjaeger;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;


public class SourceLoader
{

	public static String loadURL(String strUrl)
	{
		StringBuilder result = new StringBuilder();

		try
		{
			URL url = new URL(strUrl);
			InputStreamReader reader = new InputStreamReader(url.openStream(), "UTF-8");

			BufferedReader bufferedReader = new BufferedReader(reader);

			String line = bufferedReader.readLine();
			while (line != null)
			{
				result.append(line);
				line = bufferedReader.readLine();
			}

		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}

	public static String loadFile(String filePath)
	{
		String result = "";
		FileInputStream fileInputstream = null;
		DataInputStream dataInputStream = null;

		StringBuilder stringBuilder = new StringBuilder();

		try
		{
			String line = "";
			fileInputstream = new FileInputStream(filePath);
			dataInputStream = new DataInputStream(fileInputstream);
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(dataInputStream));

			while ((line = bufferedReader.readLine()) != null)
			{
				stringBuilder.append(line);
			}
			// Close the input stream
			dataInputStream.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			result = stringBuilder.toString();
		}
		return result;
	}
}