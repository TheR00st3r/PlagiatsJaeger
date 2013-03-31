package plagiatssoftware;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Testservlet fuer die Designstudie. Baut die Kommunikation zwischen Weboberflaeche und Backend auf.
 * 
 * @author Andreas
 * 
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet
{
	private static final long	serialVersionUID	= 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestServlet()
	{
		super();
	}

	/**
	 * Startet eine neue Ueberpruefung und schreibt "true" zurueck.
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");

		new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				int rID = Integer.parseInt(request.getParameter("rID"));
				new PlagiatsJaeger().start(rID);
			}
		}).start();

		PrintWriter out = response.getWriter();
		out.print("true");
		out.close();
	}

	/**
	 * Leer
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	}

}
