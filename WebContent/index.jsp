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
        <li class="selected"><a href="index.jsp">Home</a></li>
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

          <h3><strong>Welcome</strong> 
          <%
          if(session.getAttribute("passengerName")==null)
          {
          %>
          to our Travel Agency
		  <%}else{ %>
		  <%=session.getAttribute("passengerName") %>
		  <%} %>
		  </h3>
          <Marquee><img src="images/bus.jpg" alt="Welcome"></image></Marquee>
          <h3>Packages</h3>
          <img src="images/tour1.jpg" width="230" height='230'/>
          <img src="images/tour2.jpg"  width="230" height='230'/>
          <img src="images/tour3.jpg"  width="230" height='230'/>
          <img src="images/tour4.jpg" width="230" height='230'/>
          <img src="images/tour9.jpg"  width="230" height='230'/>
          <img src="images/tour6.jpg"  width="230" height='230'/>
          <img src="images/tour7.jpg" width="230" height='230'/>
          <img src="images/tour8.jpg"  width="230" height='230'/>
          <img src="images/tour5.jpg"  width="230" height='230'/>
          
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
