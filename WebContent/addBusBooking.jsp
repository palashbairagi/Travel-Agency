<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
int busId=Integer.parseInt(request.getParameter("busId"));
int passengerId=Integer.parseInt(request.getParameter("passengerId"));
String journeyDate=request.getParameter("date");
String fare=request.getParameter("fare");
int person=Integer.parseInt(request.getParameter("person"));
Date date=new Date();
DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
String bookingDate=dateFormat.format(date);

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("insert into bus_booking(bus_id,passenger_id,booking_date,journey_date,fare,person) values(?,?,?,?,?,?)");
stmt.setInt(1,busId);
stmt.setInt(2,passengerId);
stmt.setString(3,bookingDate);
stmt.setString(4, journeyDate);
stmt.setString(5,fare);
stmt.setInt(6,person);
stmt.executeUpdate();
%>
<jsp:forward page="busBookingDetails.jsp"></jsp:forward>