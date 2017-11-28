<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String userName=request.getParameter("userName");
String password=request.getParameter("password");
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("update user set user_name=?,password=? where id=?");
stmt.setString(1,userName);
stmt.setString(2,password);
stmt.setInt(3,id);
stmt.executeUpdate();
%>



<script type="text/javascript">
<!--
alert('User Successfully Updated');
//-->
</script>
<jsp:forward page="viewUser.jsp"></jsp:forward>