<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Bus</title>
<script type="text/javascript" src="validation.js"></script>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<script>
function showReturnDate()
{
	document.getElementById("returnDateDivision").style.visibility='visible';
	}
	
function hideReturnDate()
{
	document.getElementById("returnDateDivision").style.visibility='hidden';
	document.getElementById("returnDate").value='';
	
	}
</script>
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
        <li class="start"><a href="index.jsp">Home</a></li>
        <li class="selected"><a href="findBusPage.jsp">Bus Booking </a></li>
        <li><a href="findPackagePage.jsp">Package Tour</a></li>
        <li><a href="findHotelPage.jsp">Search Hotel</a></li>
        <% if(session.getAttribute("passengerId")!=null){ %>
        <li><a href="myBookingPage.jsp">My Bookings </a></li>
        <li><a href="changePassengerPasswordPage.jsp">Change Password </a></li>
        <li><a href="logout.jsp">Logout </a></li>
        <%}else{ %>
        <li><a href="passengerLoginPage.jsp">User Login</a></li>     
        <%} %>
	   <li class="last"><a href="adminLoginPage.jsp">Admin Login </a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">

<%
if(session.getAttribute("passengerId")==null)
{
%>
Please Login to continue or <a href="addPassengerPage.jsp">Register here</a>
<%	
} %>

<form action="findBus.jsp" method="get" name="findBusForm" class="style1" onsubmit="return validateFindBusForm(this);">
<table class="style1">
<caption>
<h3>
Bus Booking
</h3>
</caption>
<tr>
<td width='100'>From
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
<td>Bus Type
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
<td>
Passenger
</td>
<td>
<input type="number" name="person" max='9' min='1' class="style1"></input>
</td>
</tr>

<tr>
<td>Date
</td>
<td><input name="date" type="date"  size="10" maxlength="10" class="style1"/>
</td>
</tr>

<tr id='returnDateDivision' style='visibility: hidden;'>
<td> Return Date
</td>
<td><input name="returnDate" id="returnDate" type="date"  size="10" maxlength="10" class="style1"/>
</td>
</tr>

<tr>
<td>
  <input type="radio" name="journey" value="oneWay" onchange="hideReturnDate();" checked="checked"/>
    One Way
  </td>
<td>
<input type="radio" name="journey" value="return" onchange="showReturnDate();"/>
    Return
</td>
</tr>
<tr>
<td><input name="submit" type="submit" value="Search" class='style1'/>
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
