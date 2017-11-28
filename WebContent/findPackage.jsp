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

<table class="style1">


<%
String passenger=request.getParameter("passenger");
String location=request.getParameter("location");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("select * from package where place='"+location+"' or description like '%"+location+"%'");
ResultSet r=stmt.executeQuery();
if(r.next())
{%>
	<tr><th>Place</th><th>Description</th><th>From</th><th>To</th><th>Fare</th></tr>
<% 	int id=r.getInt("id");
	String place=r.getString("place");
	String description=r.getString("description");
	String from=r.getString("date_from");
	String to=r.getString("date_to");
	String fare=r.getString("fare");
	
	%>
	
	<tr><td><%=place%></td><td><%=description%></td><td><%=from%></td><td><%=to %></td><td><%=fare %></td>
	<td>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Tour Package">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=passenger%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book Now">
</form>
	</td>
	<td><a href="addPackageBooking.jsp?packageId=<%=id%>&fare=<%=fare %>&person=<%=passenger%>">After Booking</a></td></tr>

<% 	
}else
{%>
	
<h3>No Package Found</h3>	
<%}

while(r.next())
{
	int id=r.getInt("id");
	String place=r.getString("place");
	String description=r.getString("description");
	String from=r.getString("date_from");
	String to=r.getString("date_to");
	String fare=r.getString("fare");
	
	%>
	
	<tr><td><%=place%></td><td><%=description%></td><td><%=from%></td><td><%=to %></td><td><%=fare %></td>
	<td>
	<form name="_xclick" action="https://www.paypal.com/in/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="4G8S45BHYKXV2">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="Tour Package">
<input type="hidden" name="amount" value="<%=fare%>">
<input type="hidden" name="quantity" value="<%=passenger%>">
<input type="image" src="http://www.paypal.com/en_GB/i/btn/x-click-but01.gif" border="0" name="submit" alt="Book Now">
</form>
	</td>
	<td><a href="addPackageBooking.jsp?packageId=<%=id%>&fare=<%=fare %>&person=<%=passenger%>">After Booking</a></td></tr>
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
