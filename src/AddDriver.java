

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddDriver
 */

@WebServlet("/AddDriver")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB

public class AddDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDriver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InputStream inputStream = null;
		HttpSession session=request.getSession();
		
		if(session.getAttribute("adminId")==null)
		{
			System.out.print("admin id "+session.getAttribute("adminId"));
			session.setAttribute("error","Please Login to Continue");	
			RequestDispatcher dispatcher=request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}

		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String contactNumber=request.getParameter("contactNumber");
		String licenceNumber=request.getParameter("licenceNumber");
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
			
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			if(filePart.getSize()>15177215)
			{
				session.setAttribute("error","Image Too Long, Please Login Again to Continue");	
				RequestDispatcher dispatcher=request.getRequestDispatcher("error.jsp");
				dispatcher.forward(request, response);
			
			}
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		
		
		PreparedStatement stmt=con.prepareStatement("insert into driver(first_name,last_name,contact_number,licence,photo) values(?,?,?,?,?)");
		stmt.setString(1,firstName);
		stmt.setString(2,lastName);
		stmt.setString(3,contactNumber);
		stmt.setString(4,licenceNumber);
		if (inputStream != null)
		{
		stmt.setBlob(5, inputStream);
		}
		stmt.executeUpdate();

		RequestDispatcher dispatcher=request.getRequestDispatcher("viewDriver.jsp");
		dispatcher.forward(request, response);
	
		}catch(Exception exception)
		{
			session.setAttribute("error","Error in Adding Driver, Please Login Again to Continue");	
			RequestDispatcher dispatcher=request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	
}
