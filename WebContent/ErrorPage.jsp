<%@ page contentType="text/html" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Virtual Medical Home</title>
<link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
<style type="text/css">
<!--
.style6 {font-size: 36px}
-->
</style>
</head>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}  %>

  <body>
	<table width="100%" height="625px" border="1">
  <tr height="75px">
    <td><img src="Image/eight.jpg" width="100%" height="75px" align="middle" /></td>
  </tr>
  <tr height="500px">
		 <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFFFFF">
			 <tr>
			   <td height="350" align="center">
<%
	if(exception instanceof java.sql.SQLException)
	{
%>
           <font color="#FF0000">Database Server might be down ! Please try after some time.</font>
           <%
	}
	else 
	{
%>
           <span class="SubSection"><font color="#FF0000">Site is facing some technical difficulty ! Please try after some time.</font></span>
<%         
	}
%></td>
			 </tr>
		 </table></td>
	   </tr>
	  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
	 </table>
   
  </body>
</html>
