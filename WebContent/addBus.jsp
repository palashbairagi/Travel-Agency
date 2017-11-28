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
<form action="addBus" method="get" name="addBus"></form>
<%
String busNumber=request.getParameter("number1")+request.getParameter("number2")+request.getParameter("number3")+request.getParameter("number4");
String busType=request.getParameter("type");
int seat=Integer.parseInt(request.getParameter("seat"));
String busFrom=request.getParameter("from");
String busTo=request.getParameter("to");
String departure=request.getParameter("departure");
String arrival=request.getParameter("arrival");
String date=request.getParameter("date");
String fare=request.getParameter("fare");
int driver=Integer.parseInt(request.getParameter("driver"));

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into bus(bus_number,bus_type,seat,bus_from,bus_to,departure,arrival,date,fare,driver_id) values(?,?,?,?,?,?,?,?,?,?)");
stmt.setString(1,busNumber);
stmt.setString(2,busType);
stmt.setInt(3,seat);
stmt.setString(4,busFrom);
stmt.setString(5,busTo);
stmt.setString(6,departure);
stmt.setString(7,arrival);
stmt.setString(8,date);
stmt.setString(9,fare);
stmt.setInt(10,driver);
stmt.executeUpdate();
%>
<script type="text/javascript">
alert("Successfully Added");
</script>
<jsp:forward page="viewBus.jsp"></jsp:forward>
</body>
</html>