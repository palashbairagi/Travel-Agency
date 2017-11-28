<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%} %>

<%
String id=(String)session.getAttribute("adminId");
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

PreparedStatement preparedStatement=con.prepareStatement("update user set password=? where id=?");
preparedStatement.setString(1, password);
preparedStatement.setString(2, id);
preparedStatement.executeUpdate();
%>
<script language="javaScript">
alert("Password Updated Successfully");
</script>
<jsp:forward page="viewBus.jsp"></jsp:forward>