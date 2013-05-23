package info.plagiatsjaeger;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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
import org.mozilla.intl.chardet.nsDetector;
import org.mozilla.intl.chardet.nsICharsetDetectionObserver;


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

	private static String		_detectedCharset;

	/**
	 * Laed den Text einer Webseite.
	 * 
	 * @param strUrl
	 * @return
	 */
	public static String loadURL(String strUrl)
	{
		String result = "";
		try
		{
			URL url = new URL(cleanUrl(strUrl));
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
					result = loadSiteWithCharset(urlConnection, charset);
				}
				else
				{
					_logger.info("No match found " + strUrl);
					// TODO: Gesamte seite nach contenttype durchsuchen
					detectCharset(url.openStream());
					result = loadSiteWithCharset(urlConnection, _detectedCharset);
				}
			}
			else
			{
				_logger.info("CONTENT_TYPE IS null " + strUrl);
				detectCharset(url.openStream());
				result = loadSiteWithCharset(urlConnection, _detectedCharset);
			}
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
		return result;
	}

	private static void detectCharset(InputStream stream)
	{
		_logger.info("Detect Charset...");
		nsDetector detector = new nsDetector();
		detector.Init(new nsICharsetDetectionObserver()
		{

			@Override
			public void Notify(String charset)
			{
				_logger.info("Charset detected: " + charset);
				_detectedCharset = charset;
			}
		});
		BufferedInputStream imp;
		try
		{
			imp = new BufferedInputStream(stream);
			byte[] buf = new byte[1024];
			int len;
			boolean done = false;
			boolean isAscii = true;

			while ((len = imp.read(buf, 0, buf.length)) != -1)
			{
				// Check if the stream is only ascii.
				if (isAscii) isAscii = detector.isAscii(buf, len);
				// DoIt if non-ascii and not done yet.
				if (!isAscii && !done) done = detector.DoIt(buf, len, false);
			}
			_logger.info("before Detector.DataEnd");
			detector.DataEnd();
			_logger.info("after Detector.DataEnd");
		}
		catch (IOException e)
		{
			_logger.fatal(e.getMessage(), e);
		}
	}

	private static String loadSiteWithCharset(URLConnection urlConnection, String charset)
	{
		if (charset == null)
		{
			charset = DEFAULT_CONTENTTYPE;
		}
		_logger.info("Load Website " + urlConnection.getURL().toString() + "with charset " + charset);
		Reader inputStreamReader;
		StringBuilder stringBuilder = new StringBuilder();
		try
		{
			inputStreamReader = new InputStreamReader(urlConnection.getInputStream(), charset);

			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String line = "";
			while ((line = bufferedReader.readLine()) != null)
			{
				stringBuilder.append(line).append("\n");
			}
		}
		catch (UnsupportedEncodingException e)
		{
			_logger.fatal(e.getMessage(), e);
		}
		catch (IOException e)
		{
			_logger.fatal(e.getMessage(), e);
		}
		return Jsoup.parse(stringBuilder.toString()).text();
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
			detectCharset(fileInputstream);
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
		// dirtyUrl = dirtyUrl.replaceAll("www.", "");
		dirtyUrl = dirtyUrl.replaceAll("http://", "");
		dirtyUrl = dirtyUrl.replaceAll("https://", "");
		result = "http://" + dirtyUrl;
		_logger.info("Dirty-URL: " + dirtyUrl);
		_logger.info("Clean-URL: " + result);
		return result;
	}
}
