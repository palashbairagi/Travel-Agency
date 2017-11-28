<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String emailId=request.getParameter("emailId");
String password=request.getParameter("password");
String address=request.getParameter("address");
String contactNumber=request.getParameter("contactNumber");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into passenger(first_name,last_name,email_id,password,address,contact_number) values(?,?,?,?,?,?)");
stmt.setString(1,firstName);
stmt.setString(2,lastName);
stmt.setString(3,emailId);
stmt.setString(4,password);
stmt.setString(5,address);
stmt.setString(6,contactNumber);
stmt.executeUpdate();

session.setAttribute("error", "Successfully Registered, Please login to Continue");
%>
<jsp:forward page="error.jsp"></jsp:forward>
