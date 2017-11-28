<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Admin Login</title>
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
        <li class="start"><a href="index.jsp">Home</a></li>
        <li><a href="findBusPage.jsp">Bus Booking </a></li>
        <li><a href="findPackagePage.jsp">Package Tour</a></li>
        <li><a href="findHotelPage.jsp">Search Hotel</a></li>
     	<% if(session.getAttribute("passengerId")!=null){ %>
        <li><a href="myBookingPage.jsp">My Bookings </a></li>
        <li><a href="changePassengerPasswordPage.jsp">Change Password </a></li>
        <li><a href="logout.jsp">Logout </a></li>
        <%}else{ %>
        <li class="selected"><a href="passengerLoginPage.jsp">User Login </a></li>     
        <%} %>
        <li class="last"><a href="adminLoginPage.jsp">Admin Login </a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">

<%if(session.getAttribute("error")!=null){ %>
<%=session.getAttribute("error")%>
<%session.removeAttribute("error");
} %>
<form action="passengerLogin.jsp" method="get" name="passengerLoginForm" onsubmit="return validateAdminLoginForm(this);">
<table class="style1">
<caption>
<h3>
User Login
</h3>
</caption>
<tr>
<td>Username
</td>
<td><input name="emailId" type="text" size="50" maxlength="50" class="style1"/>
</td>
</tr>
<tr>
<td>Password
</td>
<td><input name="password" type="password" size="50" maxlength="50" class="style1"/>
</td>
</tr>
<tr>
<td><input name="submit" type="submit" value="Login" class="style1"/>
</td>
<td><input name="reset" type="reset" value="Clear" class="style1"/>
new User?<a href="addPassengerPage.jsp">Register Here</a>
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
