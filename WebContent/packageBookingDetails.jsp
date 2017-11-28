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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

PreparedStatement preparedStatement=con.prepareStatement("select max(id) as id from package_booking");
ResultSet resultSet=preparedStatement.executeQuery();
if(resultSet.next())
{
	String id=resultSet.getString("id");
	PreparedStatement stmt=con.prepareStatement("select * from package_booking where id=?");
	stmt.setString(1, id);
	ResultSet r=stmt.executeQuery();
	if(r.next())
	{
		int packageId=Integer.parseInt(r.getString("package_id"));
		int passengerId=Integer.parseInt(r.getString("passenger_id"));
		String bookingDate=r.getString("booking_date");
		int fare=r.getInt("fare");
		int person=r.getInt("person");
	
		PreparedStatement preparedStatement2=con.prepareStatement("select * from passenger where id="+passengerId);
		ResultSet resultSet2=preparedStatement2.executeQuery();
		if(resultSet2.next())
		{
			String name=resultSet2.getString("first_name")+" "+resultSet2.getString("last_name");
			String email=resultSet2.getString("email_id");
			
			PreparedStatement preparedStatement3=con.prepareStatement("select * from package where id="+packageId);
			ResultSet resultSet3=preparedStatement3.executeQuery();
			if(resultSet3.next())
			{
				String place=resultSet3.getString("place");
				String from=resultSet3.getString("date_from");
				String to=resultSet3.getString("date_to");
				
				String subject="Tour Package Booking";
				String message="Name "+name+" Booking Date "+bookingDate+" Place "+place+" From "+from+" To "+to+" Person "+person+" Fare "+fare+" Total "+(person*fare)+
						" Booking Id "+id;
				%>
				
				<table class="style1">
				<caption>
				<h3>Booking Details</h3>
				</caption>
				<tr>
				<td width="150">
				Name
				</td>
				<td>
				<%=name%>
				</td>
				</tr>
				<tr>
				<td>
				Booking Date
				</td>
				<td>
				<%=bookingDate%>
				</td>
				</tr>
				<tr>
				<td>
				Place
				</td>
				<td>
				<%=place%>
				</td>
				</tr>
				<tr>
				<td>
				From
				</td>
				<td>
				<%=from%>
				</td>
				</tr>
				<tr>
				<td>
				To
				</td>
				<td>
				<%=to%>
				</td>
				</tr>
				<tr>
				<td>
				Person
				</td>
				<td>
				<%=person%>
				</td>
				</tr>
				<tr>
				<td>
				Fare
				</td>
				<td>
				<%=fare%>
				</td>
				</tr>
				<tr>
				<td>
				Total
				</td>
				<td>
				<%=person*fare%>
				</td>
				</tr>
				<tr>
				<td>
				Booking ID
				</td>
				<td>
				<%=id%>
				</td>
				</tr>
				<tr>
				<td>
				<form action="sendMail" method="post" target="_blank">
				<input type="hidden" name="receiver" value="<%=email%>"/>
				<input type="hidden" name="subject" value="<%=subject%>"/>
				<input type="hidden" name="message" value="<%=message%>"/>
				<input type="submit" value="Send Mail" class="style1"/>
				</form>
				</td>
				</tr>
				</table>
				
				<%
			}
		}
	}
}
%>

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
