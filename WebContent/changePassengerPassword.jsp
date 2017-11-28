<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("passengerId")==null)
{
	session.setAttribute("error","Please Login to Continue");	
%>
<jsp:forward page="error.jsp" />
<%}
int id=Integer.parseInt((String)session.getAttribute("passengerId"));
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agency","agency","agency");

PreparedStatement preparedStatement=con.prepareStatement("update passenger set password=? where id=?");
preparedStatement.setString(1, password);
preparedStatement.setInt(2, id);
preparedStatement.executeUpdate();
%>
<script language="javaScript">
alert("Password Updated Successfully");
</script>
<jsp:forward page="index.jsp"></jsp:forward>