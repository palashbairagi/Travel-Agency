<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("passengerId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} 
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>My Bookings</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
</head>
<body>
<div id="wrapper">
  <div id="left">
    <h1>Travel Agency</h1>
    <div id="copyright">
      <p>Major Project By MITM Final Year Students</p>
      </div>
  </div>
  <div id="right">
    <div id="nav">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="findBusPage.jsp">Bus Booking </a></li>
        <li><a href="findPackagePage.jsp">Package Tour</a></li>
        <li><a href="findHotelPage.jsp">Search Hotel</a></li>
        <% if(session.getAttribute("passengerId")!=null){ %>
        <li class="selected"><a href="myBookingPage.jsp">My Bookings </a></li>
        <li><a href="changePassengerPasswordPage.jsp">Change Password </a></li>
        <li><a href="logout.jsp">Logout </a></li>
        <%}else{ %>
        <li><a href="passengerLoginPage.jsp">User Login </a></li>     
        <%} %>
        <li class="last"><a href="adminLoginPage.jsp">Admin Login </a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">

<table class="style1">
<caption>
<h3>
Bus Booking
</h3>
</caption>
<tr><th>Bus Number</th><th>From</th><th>To</th><th>Booking Date</th><th>Journey Date</th><th>Amount</th></tr>


<%
String passengerId=(String)session.getAttribute("passengerId");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from bus_booking where passenger_id="+passengerId);
ResultSet r=stmt.executeQuery();
while(r.next())
{
	int busId=Integer.parseInt(r.getString("bus_id"));
	String bookingDate=r.getString("booking_date");
	String journeyDate=r.getString("journey_date");
	int fare=r.getInt("fare");
	int person=r.getInt("person");
	int bookingId=r.getInt("id");
	
	PreparedStatement p=con.prepareStatement("select * from bus where id="+busId);
	ResultSet rs=p.executeQuery();
	if(rs.next())
	{
		String busNumber,busFrom,busTo;
		busNumber=rs.getString("bus_number");
		busFrom=rs.getString("bus_from");
		busTo=rs.getString("bus_to");
		
	%>
	<tr><td><%=busNumber%></td><td><%=busFrom%></td><td><%=busTo %></td><td><%=bookingDate%></td><td><%=journeyDate%></td><td><%=fare*person%></td></tr>
<%}
	}%> 
</table>


<table class="style1">
<caption>
<h3>
Package Booking
</h3>
</caption>
<tr><th>Place</th><th>Booking Date</th><th>From</th><th>To</th><th>Amount</th></tr>

<%
stmt=con.prepareStatement("select * from package_booking where passenger_id="+passengerId);
r=stmt.executeQuery();
while(r.next())
{
	String packageId=r.getString("package_id");
	String bookingDate=r.getString("booking_date");
	int fare=r.getInt("fare");
	int person=r.getInt("person");
	int id=r.getInt("id");
	
	PreparedStatement p=con.prepareStatement("select * from package where id="+packageId);
	ResultSet rs=p.executeQuery();
	if(rs.next())
	{
		String dateFrom,dateTo,place;
		place=rs.getString("place");
		dateFrom=rs.getString("date_from");
		dateTo=rs.getString("date_to");
	%>
	
	<tr><td><%=place%></td><td><%=bookingDate%></td><td><%=dateFrom%></td><td><%=dateTo%></td><td><%=fare*person %></td></tr>
<%}
}%> 
</table>
       
          <div class="clear"></div>
          <div class="body-hr"> </div>
          <div id="footer">
            <div id="footer-1"> Our Authorised <strong>Agents</strong> </div>
            <div id="footer-2"> <img src="images/pic_2.gif" width="31" height="42" alt="Pic 2" class="left" /> Famous Cook </div>
            <div id="footer-3"> <img src="images/pic_3.gif" width="60" height="42" alt="Pic 3" class="left" /> Around The <br />
              World </div>
            <div class="clear"> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
