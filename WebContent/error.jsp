<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
      <% System.out.println(session.getAttribute("passengerId")); %>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="findBusPage.jsp">Bus Booking </a></li>
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

<h3>
<%=session.getAttribute("error") %>

<% session.removeAttribute("error"); %>
</h3>
          
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
