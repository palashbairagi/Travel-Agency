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
<title>Add User</title>
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
        <li class="selected"><a href="viewDriver.jsp">Driver</a></li>
        <li><a href="viewHotel.jsp">Hotel</a></li>
        <li><a href="viewPackage.jsp">Package</a></li>
        <li  class="selected"><a href="viewUser.jsp">User</a></li>
        <li><a href="viewPassenger.jsp">Passenger</a></li>
        <li><a href="changeAdminPasswordPage.jsp">Change Password</a></li>
        <li class="last"><a href="logout.jsp">Logout</a></li>
  </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">

<form action="addUser.jsp" method="get" name="userForm" onsubmit="return validateUserForm(this);">
<table class="style1">
<caption>
<h3>User Registration</h3>
</caption>
<tr>
<td width="213">Username</td>
<td><input name="userName" type="text" size="50" maxlength="50" class="style1"/>
</td>
</tr>
<tr>
<td>Password
</td>
<td><input name="password" type="password" size="50" maxlength="50" class="style1"/>
</td>
</tr>
<tr>
<td>Confirm Password
</td>
<td><input name="confirmPassword" type="password" size="50" maxlength="50" class="style1"/>
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
