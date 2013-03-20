package plagiatssoftware;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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

		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent)
		{
			return;
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try
		{
			List<FileItem> fields = upload.parseRequest(request);
			Iterator<FileItem> it = fields.iterator();
			while (it.hasNext())
			{
				FileItem fileItem = it.next();
				if (!fileItem.isFormField())
				{
					String fileName = fileItem.getName();
					if (fileName != null)
					{
						fileName = FilenameUtils.getName(fileName);
						String filePath = FileSystemView.getFileSystemView().getHomeDirectory() + "\\uploadedFiles\\";
						out.println("File uploaded to : " + filePath + fileName + "<br/>");
						
						File file = new File(filePath);
						file.mkdirs();
						
						OutputStream outputStream = new FileOutputStream(new File(filePath + fileName));
						outputStream.write(fileItem.get());
						outputStream.close();
					}
				}
			}
		}
		catch (FileUploadException e)
		{
			e.printStackTrace();
		}
	}
}