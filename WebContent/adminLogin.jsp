<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("passengerId")!=null)
{
	session.removeAttribute("passengerId");
}

String userName=request.getParameter("userName");
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

PreparedStatement preparedStatement=con.prepareStatement("select * from user where user_name=? and password=?");
preparedStatement.setString(1, userName);
preparedStatement.setString(2, password);
ResultSet resultSet=preparedStatement.executeQuery();

if(resultSet.next())
{
	int adminId=resultSet.getInt("id");
	session.setAttribute("adminId",""+adminId);
%>
<jsp:forward page="viewBus.jsp"></jsp:forward>
<%}
else
{
%>
<%
session.setAttribute("error", "Invalid Username or Password");
%>
<jsp:forward page="adminLoginPage.jsp"></jsp:forward><%
	}
%>
