
import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.*;

@SuppressWarnings("serial")
public class sendMail extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			final String sender ="";
			final String password ="";

			String receiver =request.getParameter("receiver");
			String subject = request.getParameter("subject");
			String msg = request.getParameter("message");
		
			Session session = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(sender, password);
						}
					});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiver, false));
			message.setSubject(subject);
			message.setText(msg);
			Transport.send(message);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("myBookingPage.jsp");
			dispatcher.forward(request, response);
		
			}catch(Exception exception)
			{
				System.out.println(exception);
				HttpSession session=request.getSession();
				session.setAttribute("error","Error in Sending Mail, Please Login Again to Continue");	
				RequestDispatcher dispatcher=request.getRequestDispatcher("error.jsp");
				dispatcher.forward(request, response);
			}
	}
}