<%@page import="java.io.InputStream"%>
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
<form action="addHotel" method="get" name="addHotel"></form>
<%
String name=request.getParameter("hotelName");
String description=request.getParameter("description");
String contactNumber=request.getParameter("contactNumber");
String location=request.getParameter("location");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into hotel(name,description,contact_number,location) values(?,?,?,?)");
stmt.setString(1,name);
stmt.setString(2,description);
stmt.setString(3,contactNumber);
stmt.setString(4,location);
stmt.executeUpdate();
%>
<script type="text/javascript">
alert("Successfully Added");
</script>
<jsp:forward page="viewHotel.jsp"></jsp:forward>
</body>
</html>