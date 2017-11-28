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
 
 <a href="addBusPage.jsp" class="style1">Add</a>
		<table>
<tr><th>Bus Number</th><th>Type</th><th>Seat</th><th>From</th><th>To</th><th>Depart</th><th>Arrive</th>
<th>Date</th><th>Fare</th><th>Driver</th>
</tr>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from bus");
ResultSet r=stmt.executeQuery();
while(r.next())
{
	int id=Integer.parseInt(r.getString("id"));
	String busNumber=r.getString("bus_number");
	String type=r.getString("bus_type");
	int seat=Integer.parseInt(r.getString("seat"));
	String from=r.getString("bus_from");
	String to=r.getString("bus_to");
	String departure=r.getString("departure");
	String arrival=r.getString("arrival");
	String date=r.getString("date");
	String fare=r.getString("fare");
	int driverId=r.getInt("driver_id");
	
	PreparedStatement ps=con.prepareStatement("select first_name,last_name from driver where id="+driverId);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
	String name=rs.getString("first_name")+" "+rs.getString("last_name");
	%>
	
	<tr><td><%=busNumber%></td><td><%=type%></td><td><%=seat%></td><td><%=from%></td><td><%=to%></td>
	<td><%=departure %></td><td><%=arrival %></td><td><%= date %></td><td><%=fare %></td><td><%=name %></td>
	<td><a href="editBus.jsp?id=<%=id %>">Edit</a></td><td><a href="deleteBus.jsp?id=<%=id %>">Delete</a></td>
	<td><a href="viewBusBooking.jsp?id=<%=id %>&busNumber=<%=busNumber%>">Bookings</a></td>
	</tr>
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
