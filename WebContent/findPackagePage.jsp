<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
if(session.getAttribute("passengerId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Best Package</title>
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
        <li><a href="index.jsp">Home</a></li>
        <li><a href="findBusPage.jsp">Bus Booking </a></li>
        <li class="selected"><a href="findPackagePage.jsp">Package Tour</a></li>
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
if(session.getAttribute("passengerId")==null)
{
%>
Please Login to continue or <a href="addPassengerPage.jsp">Register here</a>
<%	
}%>
<form action="findPackage.jsp" onsubmit="return validatePackageForm(this);">
<table class="style1">
<caption><h3>Package Details</h3></caption>
<tr>
<td>
Location
</td>
<td>
<input type="text" name='location' size="20" maxlength="20" class="style1"></input>
</td>
</tr>
<tr>
<td>
Number of Passenger
</td>
<td>
<input type="number" name='passenger' max='10' min='1' class="style1"></input>
</td>
</tr>
<tr>
<td>
<input type="submit" value="View Package" class="style1" />
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
