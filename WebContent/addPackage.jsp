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
String place=request.getParameter("place");
String description=request.getParameter("description");
String from=request.getParameter("dateFrom");
String to=request.getParameter("dateTo");
String fare=request.getParameter("fare");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into package(place,description,date_from,date_to,fare) values(?,?,?,?,?)");
stmt.setString(1,place);
stmt.setString(2,description);
stmt.setString(3,from);
stmt.setString(4,to);
stmt.setString(5,fare);
stmt.executeUpdate();
%>
<script type="text/javascript">
alert("Successfully Added");
</script>
<jsp:forward page="viewPackage.jsp"></jsp:forward>
</body>
</html>