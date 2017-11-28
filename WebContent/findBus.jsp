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
<title>Travel Agency</title>
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
        <li class="selected"><a href="findBusPage.jsp">Bus Booking </a></li>
        <li><a href="findPackagePage.jsp">Package Tour</a></li>
                <li><a href="findHotelPage.jsp">Search Hotel</a></li>
        <% if(session.getAttribute("passengerId")!=null){ %>
        <li><a href="myBookingPage.jsp">My Bookings </a></li>
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
        

<%
String passengerId=(String)session.getAttribute("passengerId");
String from1,to1,type1,date1,returnDate1,journey1,person1;
from1=request.getParameter("from");
to1=request.getParameter("to");
type1=request.getParameter("type");
date1=request.getParameter("date");
returnDate1=request.getParameter("returnDate");
journey1=request.getParameter("journey");
person1=request.getParameter("person");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from bus where bus_from=? and bus_to=? and bus_type=?");
stmt.setString(1,from1);
stmt.setString(2,to1);
stmt.setString(3,type1);
//stmt.setString(4, date1);
ResultSet r=stmt.executeQuery();
%>

<table class="style1">
<caption>
<h3>
Buses From <%=from1 %> To <%=to1 %> 
</h3></caption>

<%

if(r.next())
{
	int id=Integer.parseInt(r.getString("id"));
	String busNumber=r.getString("bus_number");
	String type=r.getString("bus_type");
	int fare=Integer.parseInt(r.getString("fare"));
	String from=r.getString("bus_from");
	String to=r.getString("bus_to");
	String departure=r.getString("departure");
	String arrival=r.getString("arrival");
	
	%>
	<tr><th>Bus Number</th><th>Type</th><th>Fare</th><th>From</th><th>To</th><th>Departure</th><th>Arrival</th></tr>
	
	<tr><td><%=busNumber%></td><td><%=type%></td><td><%=fare%></td><td><%=from%></td><td><%=to%></td><td><%=departure %></td><td><%=arrival %></td>
	<TD>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Bus Booking">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=person1%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book">
</form>
	</TD>
	<td><a href="addBusBooking.jsp?busId=<%=id%>&passengerId=<%=passengerId %>&date=<%=date1%>&fare=<%=fare%>&person=<%=person1%>">After Booking</a></td></tr>
<%}else{%>
<tr><td width=300><h2>No Bus Found</h2></td></tr>
<%} 
while(r.next())
{
	int id=Integer.parseInt(r.getString("id"));
	String busNumber=r.getString("bus_number");
	String type=r.getString("bus_type");
	int fare=Integer.parseInt(r.getString("fare"));
	String from=r.getString("bus_from");
	String to=r.getString("bus_to");
	String departure=r.getString("departure");
	String arrival=r.getString("arrival");
	
	%>
	
	<tr><td><%=busNumber%></td><td><%=type%></td><td><%=fare%></td><td><%=from%></td><td><%=to%></td><td><%=departure %></td><td><%=arrival %></td>
	<TD>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Bus Booking">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=person1%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book">
</form>
	</TD>
	<td><a href="addBusBooking.jsp?busId=<%=id%>&passengerId=<%=passengerId %>&date=<%=date1%>&fare=<%=fare%>&person=<%=person1%>">After Booking</a></td></tr>
<%}%>
</table>
<%
if(journey1.equals("return"))
{
	
	PreparedStatement stmt1=con.prepareStatement("select * from bus where bus_to=? and bus_from=? and bus_type=?");
	stmt1.setString(1,from1);
	stmt1.setString(2,to1);
	stmt1.setString(3,type1);
//	stmt1.setString(4,returnDate1);
	ResultSet r1=stmt1.executeQuery();
%>

		<table class="style1">
		<caption>
		<h3>
		Buses From <%=to1 %> To <%=from1 %> 
		</h3></caption>
		
<%
	if(r1.next())
	{
		int id=Integer.parseInt(r1.getString("id"));
		String busNumber=r1.getString("bus_number");
		String type=r1.getString("bus_type");
		int fare=Integer.parseInt(r1.getString("fare"));
		String from=r1.getString("bus_from");
		String to=r1.getString("bus_to");
		String departure=r1.getString("departure");
		String arrival=r1.getString("arrival");
		
		%>
	
		<tr><th>Bus Number</th><th>Type</th><th>Fare</th><th>From</th><th>To</th><th>Departure</th><th>Arrival</th></tr>
			
		<tr><td><%=busNumber%></td><td><%=type%></td><td><%=fare%></td><td><%=from%></td><td><%=to%></td><td><%=departure %></td><td><%=arrival %></td>
		<TD>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Bus Booking">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=person1%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book">
</form>
	</TD>
	<td><a href="addBusBooking.jsp?busId=<%=id%>&passengerId=<%=passengerId %>&date=<%=returnDate1%>&fare=<%=fare%>&person=<%=person1%>">After Booking</a></td></tr>
<%}else
{
%>
		
<tr><td width=300><h2>No Bus Found</h2></td></tr>
<%}
	while(r1.next())
	{
		int id=Integer.parseInt(r1.getString("id"));
		String busNumber=r1.getString("bus_number");
		String type=r1.getString("bus_type");
		int fare=Integer.parseInt(r1.getString("fare"));
		String from=r1.getString("bus_from");
		String to=r1.getString("bus_to");
		String departure=r1.getString("departure");
		String arrival=r1.getString("arrival");
		
		%>
		
		<tr><td><%=busNumber%></td><td><%=type%></td><td><%=fare%></td><td><%=from%></td><td><%=to%></td><td><%=departure %></td><td><%=arrival %></td>
		<TD>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Bus Booking">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=person1%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book">
</form>
	</TD>
	<td><a href="addBusBooking.jsp?busId=<%=id%>&passengerId=<%=passengerId %>&date=<%=returnDate1%>&fare=<%=fare%>&person=<%=person1%>">After Booking</a></td></tr>
<%}
}
%>
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
