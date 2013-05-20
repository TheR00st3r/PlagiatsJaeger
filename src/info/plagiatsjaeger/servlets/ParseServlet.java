package info.plagiatsjaeger.servlets;

import info.plagiatsjaeger.Control;
import info.plagiatsjaeger.enums.FileType;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


/**
 * Servlet implementation class ParseServlet
 */
@WebServlet("/ParseServlet")
public class ParseServlet extends HttpServlet
{
	private static final long	serialVersionUID	= 1L;

	private static final Logger	_logger				= Logger.getLogger(ParseServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParseServlet()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		File f = new File("dummy");
		_logger.info(f.getAbsolutePath());

		response.setContentType("text/html");
		final int dID = Integer.parseInt(request.getParameter("dID"));
		final FileType dFileEndign = FileType.valueOf(request.getParameter("dFileEnding").substring(1).toUpperCase());
		PrintWriter out = response.getWriter();
		if (new Control(0).startParsing(dID, dFileEndign))
		{
			out.print("true");
		}
		else
		{
			out.print("false");
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
	}

}
