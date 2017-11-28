<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Passenger Registration</title>
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
        <li><a href="viewHotel.jsp">Hotel</a></li>
        <li ><a href="viewPackage.jsp">Package</a></li>
        <li><a href="viewUser.jsp">User</a></li>
        <li class="selected"><a href="viewPassenger.jsp">Passenger</a></li>
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
PreparedStatement stmt=con.prepareStatement("select * from passenger where id=?");
stmt.setInt(1,id);
ResultSet r=stmt.executeQuery();
if(r.next())
{
	String firstName=r.getString("first_name");
	String lastName=r.getString("last_name");
	String emailId=r.getString("email_Id");
	String password=r.getString("password");
	String address=r.getString("address");
	String contactNumber=r.getString("contact_Number");
    
    
    %>
<form action="updatePassenger.jsp" method="post" id="passengerForm" name="passengerForm" onsubmit="return validatePassengerForm(this);">
<input type="hidden" name="id" id="id" value="<%=id%>"/>
<table>
<caption>
<h3>
Edit Passenger
</h3>
</caption>
<tr>
<td width="180">First Name</td>
<td><input name="firstName" type="text" size="20" maxlength="20" class="style1" id="firstName" value="<%=firstName %>"/>
</td>
</tr>
<tr>
<td>Last Name
</td>
<td><input name="lastName" type="text" size="20" maxlength="20" class="style1" id="lastName" value="<%=lastName %>"/>
</td>
</tr>
<tr>
<td>Email Id
</td>
<td><input name="emailId" type="email" size="50" maxlength="50" class="style1" id="emailId" value="<%=emailId%>"/>
</td>
</tr>
<tr>
<td>Password
</td>
<td><input name="password" type="password" size="50" maxlength="50" class="style1" id="password" value="<%=password %>"/>
</td>
</tr>
<tr>
<td>Address
</td>
<td><textarea name="address" cols="25" rows="4" maxlength="100" class="style1" id="address" ><%=address %></textarea>
</td>
</tr>
<tr>
<td>Contact Number
</td>
<td><input name="contactNumber" type="text" size="20" maxlength="20" class="style1" id="contactNumber" value="<%=contactNumber %>"/>
</td>
</tr>
<tr>
<td><input name="Update" type="submit" value="Update" class="style1"/>
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
