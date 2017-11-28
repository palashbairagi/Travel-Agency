<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("adminId")!=null)
{
	session.removeAttribute("adminId");
}

String userName=request.getParameter("emailId");
String password=request.getParameter("password");
 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

PreparedStatement preparedStatement=con.prepareStatement("select * from passenger where email_id=? and password=?");
preparedStatement.setString(1, userName);
preparedStatement.setString(2, password);
ResultSet resultSet=preparedStatement.executeQuery();

if(resultSet.next())
{
	String name=resultSet.getString("first_name")+" "+resultSet.getString("last_name");
	int adminId=resultSet.getInt("id");
	session.setAttribute("passengerId",""+adminId);
	session.setAttribute("passengerName",name);
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%}
else
{
%>
<%
session.setAttribute("error", "Invalid Username or Password");
%>
<jsp:forward page="passengerLoginPage.jsp"></jsp:forward>
<%
	}
%>