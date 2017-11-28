<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<%@ page import="java.sql.*;" %>
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

<form action="addBus.jsp" method="get" name="busForm" class='style1' onsubmit="return validateBusForm(this);">
<table>
<caption>
<h3>Add Bus</h3>
</caption>
<tr>
<td width="130">Bus Number
</td>
<td>
<input name="number1" type="text" size="2" maxlength="2" class='style1'/>
<input name="number2" id="number2" type="number" size="2" max="99" min="1" class='style1'/>
<input name="number3" id="number3" type="text" size="2" maxlength="2" class='style1'/>
<input name="number4" id="number4" type="number" size="4" min="0001" max="9999" class='style1'/>
</td>
</tr>
<tr>
<td>Type
</td>
<td>
<select name="type" class='style1'>
<option value="Non-AC Seater">Non-AC Seater</option>
<option value="Non-AC Sleeper">Non-AC Sleeper</option>
<option value="AC Seater">AC Seater</option>
<option value="AC Sleeper">AC Sleeper</option>
<option value="Volvo">Volvo</option>
</select>
</td>
</tr>
<tr>
<td>Seat
</td>
<td><input name="seat" id="seat" type="number" max="60" min="10" class='style1'/>
</td>
</tr>
<tr>
<td>From
</td>
<td><input name="from" id="from" type="text" size="20" maxlength="20" class='style1'/>
</td>
</tr>
<tr>
<td>To
</td>
<td><input name="to" id="to" type="text" size="20" maxlength="20" class='style1'/>
</td>
</tr>
<tr>
<td>Departure
</td>
<td><input type="time" name="departure" id="departure" class='style1'>
</td>
</tr>
<tr>
<td>Arrival
</td>
<td><input type="time" name="arrival"  id="arrival" class='style1'>  
</td>
</tr>
<tr>
<td>
Date
</td>
<td>
<input type="date" name="date" class="style1"/>
</td>
</tr>
<tr>
<td>
Fare
</td>
<td>
<input type="number" min='100' max='9999' name="fare" class="style1"/>
</td>
</tr>
<td>
Driver
</td>
<td>
<select name="driver">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from driver");
ResultSet r=stmt.executeQuery();
while(r.next())
{
	int id=Integer.parseInt(r.getString("id"));
	String firstName=r.getString("first_name");
	String lastName=r.getString("last_name");
	%>
<option value='<%=id%>'><%= firstName+" "+lastName %></option>
<%} %>
</select>
</td>
</tr>
<tr>
<td><input name="submit" type="submit" value="Add" class='style1'/>
</td>
<td><input name="reset" type="reset" value="Clear" class='style1'/>
</td>
</tr>
</table>
</form>

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
