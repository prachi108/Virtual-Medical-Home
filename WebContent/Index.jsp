<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="index" class="vmh.Index"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>

<link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
<style type="text/css">
<!--
.style6 {font-size: 36px}
-->
</style>

</head>
<body>
<table width="100%" height="600px" border="1">
  <tr height="75px">
    <td><img src="Image/two.jpg" width="100%" height="75px" align="middle" /></td>
  </tr>
  <tr height="500px">
  <div>
    <td><form method="post" action="IndexHandler.jsp">
      <table width="50%"  height="200px" align="center">
        <tr>
          <td colspan="3" align="center"><h4><strong>Login Form</strong></h4></td>
        </tr>
        
       <% if(session.getAttribute("message")!=null){ %> 
		<tr>
          <td colspan="3" align="center"><%=session.getAttribute("message")%></td>
        </tr>
		<% 
		session.removeAttribute("message");
       }
		%>
		
		 <tr >
          <td width="37%"><label>Id</label>&nbsp;</td>
          <td colspan="2"><label>
            <input name="id" type="text" id="id">
          </label></td>
          </tr>
        <tr >
          <td><label>Password</label>&nbsp;</td>
          <td colspan="2"><label>
          <input type="password" name="password" id="password">
          </label></td>
          </tr>
        
        <tr >
          <td>&nbsp;</td>
          <td width="31%"><label>
            <input name="Save" type="submit" id="Save" value="Submit">
          </label></td>
          <td width="32%"><label>
            <input name="Reset" type="reset" id="Reset" value="Reset">
          </label></td>
        </tr>
		
		<tr>
		   <td colspan="3"><a href="PatientAdd.jsp?flag=patient">Patient Register Here</a></td>
		</tr>   
		
      </table>
        </form>    </td>
		</div>
  </tr>
  
  <tr  height="25px">
       <td  colspan="2" valign="top" style="background-color:#66CCFF"><marquee >
        <strong>Tomorrow's Technology for Today's Medical Challenges</strong>
       </marquee></td>
         </tr>
  
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>