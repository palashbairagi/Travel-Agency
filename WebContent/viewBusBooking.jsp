<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Bus</title>
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
        <li class="selected"><a href="viewBus.jsp">Bus</a></li>
        <li><a href="viewDriver.jsp">Driver</a></li>
        <li><a href="viewHotel.jsp">Hotel</a></li>
        <li><a href="viewPackage.jsp">Package</a></li>
        <li><a href="viewUser.jsp">User</a></li>
        <li><a href="viewPassenger.jsp">Passenger</a></li>
        <li><a href="changeAdminPasswordPage.jsp">Change Password</a></li>
        <li class="last"><a href="logout.jsp">Logout</a></li>
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
<h2>
<%
String busNumber= request.getParameter("busNumber");
%>
Bus Number&nbsp;&nbsp;&nbsp;<%=busNumber %>
</h2> 
</caption>
<tr><th>Name</th><th>Booking Date</th><th>Journey Date</th><th>Fare</th><th>Person</th><th>Total</th></tr>


<%
String busId=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from bus_booking where bus_id="+busId);
ResultSet r=stmt.executeQuery();
while(r.next())
{
	int passengerId=Integer.parseInt(r.getString("passenger_id"));
	String bookingDate=r.getString("booking_date");
	String journeyDate=r.getString("journey_date");
	int fare=r.getInt("fare");
	int person=r.getInt("person");
	int bookingId=r.getInt("id");
	
	PreparedStatement p=con.prepareStatement("select first_name,last_name from passenger where id="+passengerId);
	ResultSet rs=p.executeQuery();
	if(rs.next())
	{
		String name=rs.getString("first_name")+" "+rs.getString("last_name");
	%>
	<tr><td><%=name%></td><td><%=bookingDate%></td><td><%=journeyDate %></td><td><%=fare%></td><td><%=person%></td>
	<td><%=person*fare %></td><td><a href="deleteBusBooking.jsp?id=<%=bookingId%>&busId=<%=busId%>&busNumber=<%=busNumber%>">Cancel</a></td></tr>
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
