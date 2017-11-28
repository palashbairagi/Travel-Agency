

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DownloadDriverPhoto
 */
public class DownloadDriverPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 4096;	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadDriverPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Connection conn = null;	// connection to the database
		
		try {
			String driverId=request.getParameter("id");
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

			// queries the database
			String sql = "SELECT photo from Driver where id="+driverId;
			PreparedStatement statement = conn.prepareStatement(sql);
			
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				// gets file name and file blob data
				Blob blob = result.getBlob("photo");
				InputStream inputStream = blob.getBinaryStream();
				int fileLength = inputStream.available();
							
				// sets MIME type for the file download
				String	mimeType = "application/octet-stream";
							
				
			    response.setContentType(mimeType);
				response.setContentLength(fileLength);
				String headerKey = "Content-Disposition";
				String headerValue = String.format("filename=\"%s\"", "image.jpg");
	     		response.setHeader(headerKey, headerValue);
	     		
				// writes the file to the client
				OutputStream outStream = response.getOutputStream();
				
				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;
				
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				
				inputStream.close();
				outStream.close();	
				
			} else {
				// no file found
		//		response.getWriter().print("File not found for the id: " + uploadId);	
			}
		} catch (Exception ex) {
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("error","Unable to Download Or Photo Not Available, Please Login Again");
			RequestDispatcher dispatcher=request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}			
		}

	}

}
