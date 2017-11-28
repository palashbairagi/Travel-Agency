<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int id=Integer.parseInt((String)request.getParameter("id"));
String busId=request.getParameter("busId");
String busNumber=request.getParameter("busNumber");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");
PreparedStatement stmt=con.prepareStatement("delete from bus_booking where id=?");
stmt.setInt(1,id);
stmt.executeUpdate();

if(session.getAttribute("adminId")!=null)
{
%>
<jsp:forward page="viewBusBooking.jsp">
<jsp:param value="<%=busId %>" name="id"/>
<jsp:param value="<%=busNumber%>" name="busNumber"/>
</jsp:forward>
<%}
else
{%>
<jsp:forward page="myBookingPage.jsp"></jsp:forward>
<%}%>