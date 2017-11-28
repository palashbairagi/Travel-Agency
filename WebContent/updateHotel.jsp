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
String name=request.getParameter("name");
String description=request.getParameter("description");
String contactNumber=request.getParameter("contactNumber");
String location=request.getParameter("location");
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("update hotel set name=?,description=?,contact_number=?,location=? where id=?");
stmt.setString(1,name);
stmt.setString(2,description);
stmt.setString(3,contactNumber);
stmt.setString(4,location);
stmt.setInt(5,id);
stmt.executeUpdate();
%>


<script type="text/javascript">
<!--
alert('Hotel Successfully Updated');
//-->
</script>
<jsp:forward page="viewHotel.jsp"></jsp:forward>