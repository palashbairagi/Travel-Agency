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
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String contactNumber=request.getParameter("contactNumber");
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("update driver set first_name=?,last_name=?,contact_number=? where id=?");
stmt.setString(1,firstName);
stmt.setString(2,lastName);
stmt.setString(3,contactNumber);
stmt.setInt(4,id);
stmt.executeUpdate();
%>

<script type="text/javascript">
<!--
alert('Driver Successfully Updated');
//-->
</script>
<jsp:forward page="viewDriver.jsp"></jsp:forward>