package info.plagiatsjaeger;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;


/**
 * Klasse zum Laden von Daten.
 * 
 * @author Andreas
 */
public class SourceLoader
{
	public static final Logger	_logger				= Logger.getLogger(SourceLoader.class.getName());

	private static final String	DEFAULT_CONTENTTYPE	= ConfigReader.getPropertyString("DEFAULTCONTENTTYPE");
	private static final String	CONTENTTYPE_PATTERN	= ConfigReader.getPropertyString("CONTENTTYPEPATTERN");

	/**
	 * Laed den Text einer Webseite.
	 * 
	 * @param strUrl
	 * @return
	 */
	public static String loadURL(String strUrl)
	{
		try
		{
			URL url = new URL(cleanUrl(strUrl));
			_logger.info(url.toString());
			URLConnection urlConnection = url.openConnection();
			// Pattern zum auffinden des contenttypes
			String charset = DEFAULT_CONTENTTYPE;
			String contentType = urlConnection.getContentType();
			if (contentType != null)
			{
				Pattern pattern = Pattern.compile(CONTENTTYPE_PATTERN);
				_logger.info("ContentEncoding: " + urlConnection.getContentEncoding());
				_logger.info("ContentType: " + urlConnection.getContentType());
				
				Matcher matcher = pattern.matcher(urlConnection.getContentType());
				// Wenn ein Contenttype gefunden wird, wird dieser verwendet,
				// sonst
				// der defaul wert
				if (matcher.matches())
				{
					charset = matcher.group(1);
					_logger.info("Charset detected: " + charset + "(URL: " + strUrl + ")");
				}
				else
				{
					_logger.info("No match found " + strUrl);
					//TODO: Gesamte seite nach contenttype durchsuchen
				}
			}
			else
			{
				_logger.info("CONTENT_TYPE IS null " + strUrl);
			}
			Reader inputStreamReader = new InputStreamReader(urlConnection.getInputStream(), charset);
			StringBuilder stringBuilder = new StringBuilder();
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String line = "";
			while ((line = bufferedReader.readLine()) != null)
			{
				stringBuilder.append(line).append("\n");
			}
			return Jsoup.parse(stringBuilder.toString()).text();
		}
		catch (MalformedURLException e)
		{
			_logger.fatal(e.getMessage(), e);
			return "FAIL MalformedURLException";
		}
		catch (UnsupportedEncodingException e)
		{
			_logger.fatal(e.getMessage(), e);
			return "FAIL UnsupportedEncodingException";
		}
		catch (IOException e)
		{
			_logger.fatal(e.getMessage(), e);
			return "FAIL IOException";
		}
	}

	/**
	 * Laed eine Datei.
	 * 
	 * @param filePath
	 * @return
	 */
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
				stringBuilder.append(line).append("\n");
			}
			// Close the input stream
			dataInputStream.close();
		}
		catch (FileNotFoundException e)
		{
			_logger.fatal(e.getMessage(), e);
			return "FAIL FileNotFoundException";
		}
		catch (IOException e)
		{
			_logger.fatal(e.getMessage(), e);
			return "FAIL IOException";
		}
		finally
		{
			result = stringBuilder.toString();
		}
		return result;
	}

	/**
	 * Bereinigt eine Url, sodass sie immer vollstaendig ist
	 * 
	 * @param dirtyUrl
	 * @return result
	 */
	public static String cleanUrl(String dirtyUrl)
	{
		String result = "";
		//dirtyUrl = dirtyUrl.replaceAll("www.", "");
		dirtyUrl = dirtyUrl.replaceAll("http://", "");
		dirtyUrl = dirtyUrl.replaceAll("https://", "");
		result = "http://" + dirtyUrl;
		_logger.info("Dirty-URL: " + dirtyUrl);
		_logger.info("Clean-URL: " + result);
		return result;
	}
}