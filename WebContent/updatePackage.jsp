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
String place=request.getParameter("place");
String description=request.getParameter("description");
String from=request.getParameter("dateFrom");
String to=request.getParameter("dateTo");
String fare=request.getParameter("fare");
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("update package set place=?,description=?,date_from=?,date_to=?,fare=? where id=?");
stmt.setString(1,place);
stmt.setString(2,description);
stmt.setString(3,from);
stmt.setString(4,to);
stmt.setString(5, fare);
stmt.setInt(6,id);
stmt.executeUpdate();
%>



<script type="text/javascript">
<!--
alert('Package Successfully Updated');
//-->
</script>
<jsp:forward page="viewPackage.jsp"></jsp:forward>