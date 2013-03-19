package plagiatssoftware;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private File homeDir;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();

		String filedest;

		try {
			if (ServletFileUpload.isMultipartContent(request)) {

				// UploadHander erstellen
				ServletFileUpload upload = new ServletFileUpload();

				// Die Post-Variablen einlesen
				FileItemIterator iter = upload.getItemIterator(request);

				// Die Variablen durchgehen
				while (iter.hasNext()) {

					iter.next();

					FileItemStream item = iter.next();

//					Class.forName(JDBCDRIVER).newInstance();
//					Connection con = DriverManager.getConnection(CONNECTSTRING,
//							USERNAMEDB, PASSWORDDB);

//					homeDir = new File("");
//					filedest = homeDir + System.getProperty("file.separator")
//							+ new File(item.getName()).getName();
//
//					if (!homeDir.exists()) {
//						homeDir.mkdir();
//					}
					InputStream fi = item.openStream();
					BufferedInputStream is = new BufferedInputStream(fi);
//					BufferedOutputStream os = new BufferedOutputStream(
//							new FileOutputStream(filedest));
//					byte[] buff = new byte[8192];
//					int len;
//					while (0 < (len = is.read(buff))) {
//						os.write(buff, 0, len);
//					}
//					is.close();
//					os.flush();
//					os.close();

//					PreparedStatement pstmt = con
//							.prepareStatement("INSERT INTO anhang (complaintID, anhang ) values (?,?)");
					// db
					// inhalt
					// schreiben
//					FileInputStream fin = new FileInputStream(filedest);
//					File file = new File(filedest);
//					int leng = (int) file.length();
//					pw.println("filedest2" + filedest);

//					pstmt.setInt(1, 1);
//					pstmt.setBinaryStream(2, fin, leng);
//					pstmt.executeUpdate();
					// fin.close();
//					pstmt = con.prepareStatement("commit");
//					pstmt.executeQuery();
//					con.close();
					pw.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
					pw.print("<result>");
					pw.print("<success>true</success>");
					pw.print("</result>");

				}
			}
		} catch (Exception e) {

			pw.println("Fehler" + e.getMessage() + e.toString());

		}

	}
}