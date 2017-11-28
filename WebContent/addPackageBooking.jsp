<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
if(session.getAttribute("passengerId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%}
int packageId=Integer.parseInt(request.getParameter("packageId"));
String fare=request.getParameter("fare");
int person=Integer.parseInt(request.getParameter("person"));
int passengerId=Integer.parseInt((String)session.getAttribute("passengerId"));

Date date=new Date();
DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
String bookingDate=dateFormat.format(date);

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into package_booking(package_id,passenger_id,booking_date,fare,person) values(?,?,?,?,?)");
stmt.setInt(1,packageId);
stmt.setInt(2,passengerId);
stmt.setString(3,bookingDate);
stmt.setString(4,fare);
stmt.setInt(5,person);
stmt.executeUpdate();
%>
<jsp:forward page="packageBookingDetails.jsp"></jsp:forward>