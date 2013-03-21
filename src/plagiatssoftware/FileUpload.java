package plagiatssoftware;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;


@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUpload()
	{
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		for (String text : uploadFiles(request, FileSystemView.getFileSystemView().getHomeDirectory() + "\\uploadedFiles\\"))
		{
			out.println(text + "<br/>");
		}
	}

	/**
	 * Alle FileUploads im HttpServletRequest werden unter dem angegebenen
	 * Dateipfad gespeichert
	 * 
	 * @param request
	 *            {@link HttpServletRequest} mit FileUploads
	 * @param filePath
	 *            Verzeichnis in dem die Dateien gespeichert werden sollen
	 * @return List mit allen Dateipfaden
	 */
	private ArrayList<String> uploadFiles(HttpServletRequest request, String filePath)
	{
		ArrayList<String> result = new ArrayList<String>();
		if (ServletFileUpload.isMultipartContent(request))
		{

			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
			try
			{
				List<FileItem> listFields = servletFileUpload.parseRequest(request);
				Iterator<FileItem> iteratorFields = listFields.iterator();
				while (iteratorFields.hasNext())
				{
					String strSavePath = uploadFileItem(iteratorFields.next(), filePath);
					if (strSavePath != "")
					{
						result.add(uploadFileItem(iteratorFields.next(), filePath));
					}
				}
			}
			catch (FileUploadException e)
			{
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * Läd ein {@link Fileitem} auf den Server und speichert es unter dem
	 * angegebenen Pfad
	 * 
	 * @param fileItem
	 *            enthält die Dateien für den upload
	 * @param filePath
	 *            Speicherpfad für die Daten
	 * @return Vollständiger Dateipfad zur gespeicherten Datei
	 */
	private String uploadFileItem(FileItem fileItem, String filePath)
	{
		String result = "";
		if (!fileItem.isFormField())
		{
			String strFileName = fileItem.getName();
			if (strFileName != null)
			{
				strFileName = FilenameUtils.getName(strFileName);

				// Falls das angegebene Verzeichnis nicht vorhanden ist, wird es
				// neu angelegt
				File file = new File(filePath);
				file.mkdirs();

				OutputStream outputStream;
				try
				{
					outputStream = new FileOutputStream(new File(filePath + strFileName));
					outputStream.write(fileItem.get());
					outputStream.flush();
					outputStream.close();
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
					result = filePath + strFileName;
				}

			}
		}
		return result;
	}
}