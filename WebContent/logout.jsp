
<%
session.removeAttribute("adminId");
session.removeAttribute("passengerId");
session.removeAttribute("passengerName");
session.invalidate();
%>
<script type="text/javascript">
<!--
alert('Successfully logged out');
//-->
</script>
<jsp:forward page="index.jsp"></jsp:forward>