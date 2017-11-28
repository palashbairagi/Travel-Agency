<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<title>Hotel</title>
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
        <li><a href="viewBus.jsp">Bus</a></li>
        <li><a href="viewDriver.jsp">Driver</a></li>
        <li  class="selected"><a href="viewHotel.jsp">Hotel</a></li>
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

<form action="addHotel.jsp" method="get" name="hotelForm" onsubmit="return validateHotelForm(this);">
<table class="style1">
<caption>
<h3>Add Hotel</h3>
</caption>
<tr>
<td width="182">Hotel Name</td>
<td ><input name="hotelName" type="text" size="20" maxlength="20" class="style1"/>
</td>
</tr>
<tr>
<td>Description
</td>
<td><textarea name="description" cols="50" rows="10" maxlength="250" class="style1"></textarea>
</td>
</tr>
<tr>
<td>Contact Number
</td>
<td><input name="contactNumber" type="text" size="20" maxlength="20" class="style1"/>
</td>
</tr>
<tr>
<td>Location
</td>
<td><input name="location" type="text" size="20" maxlength="20" class="style1"/>
</td>
</tr>
<tr>
<td><input name="submit" type="submit" value="Add" class="style1"/>
</td>
<td><input name="reset" type="reset" value="Clear" class="style1"/>
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
