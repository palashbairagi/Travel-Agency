<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Passenger</title>
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
        <li><a href="viewBus.jsp">Bus</a></li>
        <li><a href="viewDriver.jsp">Driver</a></li>
        <li><a href="viewHotel.jsp">Hotel</a></li>
        <li><a href="viewPackage.jsp">Package</a></li>
        <li><a href="viewUser.jsp">User</a></li>
        <li  class="selected"><a href="viewPassenger.jsp">Passenger</a></li>
        <li><a href="changeAdminPasswordPage.jsp">Change Password</a></li>
        <li class="last"><a href="logout.jsp">Logout</a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">
 
 		<table class="style1">
<tr><th>First Name</th><th>Last Name</th><th>Email Id</th><th>Password</th><th>Address</th><th>Contact Number</th></tr>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from passenger");
ResultSet r=stmt.executeQuery();
while(r.next())
{
	int id=Integer.parseInt(r.getString("id"));
	String firstName=r.getString("first_name");
	String lastName=r.getString("last_name");
	String emailId=r.getString("email_id");
	String password=r.getString("password");
	String address=r.getString("address");
	String contactNumber=r.getString("contact_number");
	%>
	
	<tr><td><%=firstName%></td><td><%=lastName%></td><td><%=emailId %></td><td><%=password %></td><td><%=address %></td><td><%=contactNumber %></td>
	<td><a href="editPassenger.jsp?id=<%=id %>">Edit</a></td><td><a href="deletePassenger.jsp?id=<%=id %>">Delete</a></td></tr>
<%}%> 
</table>
 		
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
