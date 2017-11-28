<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Bus</title>
<script type="text/javascript" src="validation.js"></script>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
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

<%@ page import="java.sql.*" %>
<% 
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from bus where id=?");
stmt.setInt(1,id);
ResultSet r=stmt.executeQuery();
if(r.next())
{
	String busNumber=r.getString("bus_number");
	String busType=r.getString("bus_type");
	int seat=r.getInt("seat");
	String busFrom=r.getString("bus_from");
	String busTo=r.getString("bus_to");
	String departure=r.getString("departure");
	String arrival=r.getString("arrival");
	String date=r.getString("date");
	String fare=r.getString("fare");
	int driverId=r.getInt("driver_id");
	  
	String number1=busNumber.substring(0,2);
	String number2=busNumber.substring(2,4);
	String number3=busNumber.substring(4,6);
	String number4=busNumber.substring(6);
    
    %>
    
    
<form action="updateBus.jsp" method="post" id="busForm" name="busForm" onsubmit="return validateBusForm(this);">
<input type="hidden" name="id" id="id" value="<%=id%>"/>
<table class="style1">
<caption>
<h3>
Edit Bus
</h3></caption>
<tr>
<td>Bus Number
</td>
<td>
<input name="number1" type="text" size="2" maxlength="2" class='style1' id="number1" value="<%=number1%>"/>
<input name="number2" type="number" size="2" max="99" min="1" class='style1' id="number2" value="<%=number2%>"/>
<input name="number3" type="text" size="2" maxlength="2" class='style1' id="number3" value="<%=number3%>"/>
<input name="number4" type="number" size="4" min="0001" max="9999" class='style1' id="number4" value="<%=number4%>"/>
</td>
</tr>
<tr>
<td>Type
</td>
<td>
<select name="type" class='style1' id="type">
<%
if(busType.equals("Non-AC Seater"))
{
%>
<option value="Non-AC Seater" selected="selected">Non-AC Seater</option>
<option value="Non-AC Sleeper">Non-AC Sleeper</option>
<option value="AC Seater">AC Seater</option>
<option value="AC Sleeper">AC Sleeper</option>
<option value="Volvo">Volvo</option>
<%}
else if(busType.equals("Non-AC Sleeper"))
{
%><option value="Non-AC Seater" >Non-AC Seater</option>
<option value="Non-AC Sleeper" selected="selected">Non-AC Sleeper</option>
<option value="AC Seater">AC Seater</option>
<option value="AC Sleeper">AC Sleeper</option>
<option value="Volvo">Volvo</option>
<%}
else if(busType.equals("AC Seater"))
{
%><option value="Non-AC Seater" >Non-AC Seater</option>
<option value="Non-AC Sleeper">Non-AC Sleeper</option>
<option value="AC Seater" selected="selected">AC Seater</option>
<option value="AC Sleeper">AC Sleeper</option>
<option value="Volvo">Volvo</option>
<%}
else if(busType.equals("AC Sleeper"))
{
%><option value="Non-AC Seater" >Non-AC Seater</option>
<option value="Non-AC Sleeper">Non-AC Sleeper</option>
<option value="AC Seater">AC Seater</option>
<option value="AC Sleeper" selected="selected">AC Sleeper</option>
<option value="Volvo">Volvo</option>
<%}
else if(busType.equals("Volvo"))
{
%><option value="Non-AC Seater" >Non-AC Seater</option>
<option value="Non-AC Sleeper">Non-AC Sleeper</option>
<option value="AC Seater">AC Seater</option>
<option value="AC Sleeper">AC Sleeper</option>
<option value="Volvo" selected="selected">Volvo</option>
<%} %>
</select>
</td>
</tr>

<td>Seat
</td>
<td><input name="seat" type="number" max="60" min="10" class='style1' id="seat" value="<%=seat%>"/>
</td>
</tr>
<tr>
<td>From
</td>
<td><input name="from" type="text" size="20" maxlength="20" class='style1' id="from" value="<%=busFrom%>"/>
</td>
</tr>
<tr>
<td>To
</td>
<td><input name="to" type="text" size="20" maxlength="20" class='style1' id="to" value="<%=busTo %>"/>
</td>
</tr>
<tr>
<td>Departure
</td>
<td><input type="time" name="departure" class='style1' id="departure" value="<%=departure %>">
</td>
</tr>
<tr>
<td>Arrival
</td>
<td><input type="time" name="arrival" class='style1' id="arrival" value="<%=arrival%>">  
</td>
</tr>
<tr>
<td>
Date
</td>
<td>
<input type="date" name="date" value="<%=date %>" class="style1"/>
</td>
</tr>
<tr>
<td>
Fare
</td>
<td>
<input type="number" min='100' max='9999' name="fare" value="<%=fare %>" class="style1"/>
</td>
</tr>
<td>
Driver
</td>
<td>
<select name="driver" class="style1">
<%
PreparedStatement ps=con.prepareStatement("select * from driver");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	int driverId1=Integer.parseInt(rs.getString("id"));
	String firstName=rs.getString("first_name");
	String lastName=rs.getString("last_name");

	if(driverId==driverId1)
	{%>
		<option value='<%=driverId1%>' selected="selected"><%= firstName+" "+lastName %></option>
	<%}else{%>
	<option value='<%=driverId1%>'><%= firstName+" "+lastName %></option>
<%}} %>
</select>
</td>
</tr>
<tr>
<td><input name="Update" type="submit" value="Update" class='style1'/>
</td>
</tr>
</table>
</form>
    <%} %>

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
