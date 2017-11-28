<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="addDriver" method="get" name="addDriver"></form>
<%
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String contactNumber=request.getParameter("contactNumber");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into driver(first_name,last_name,contact_number) values(?,?,?)");
stmt.setString(1,firstName);
stmt.setString(2,lastName);
stmt.setString(3,contactNumber);
stmt.executeUpdate();
%>
<script type="text/javascript">
alert("Successfully Added");
</script>
<jsp:forward page="viewDriver.jsp"></jsp:forward>
</body>
</html>