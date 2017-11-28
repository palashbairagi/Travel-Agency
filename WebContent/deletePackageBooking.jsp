<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int packageId=Integer.parseInt((String)request.getParameter("id"));
String bookingId=request.getParameter("bookingId");
String place=request.getParameter("place");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("delete from package_booking where id=?");
stmt.setString(1,bookingId);
stmt.executeUpdate();

if(session.getAttribute("adminId")!=null)
{
%>
<jsp:forward page="viewPackageBooking.jsp">
<jsp:param value="<%=packageId %>" name="id"/>
<jsp:param value="<%=place%>" name="place"/>
</jsp:forward>
<%}
else
{%>
<jsp:forward page="myBookingPage.jsp"></jsp:forward>
<%}%>