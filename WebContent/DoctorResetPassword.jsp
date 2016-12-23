<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="doctor" class="vmh.Doctor"/>
	<jsp:setProperty name="doctor" property="id"/>
	
<%  if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
    <jsp:forward page="Index.jsp" />
<%	}   %>
<script src="js/Validation.js" type="text/javascript"></script>
<script>
function validateForm()
 { 
    var abc;
	 if(document.form1.password.value == "")
	 {
	   alert("Fill Password!");
	   document.form1.password.focus();
	   return false;
	 } 
	 
	if(document.form1.password1.value == "")
	 {
	   alert("Fill Confirm Password!");
	   document.form1.password1.focus();
	   return false;
	 } 
	 
	if(document.form1.password1.value != document.form1.password.value)
	 {
	   alert("Please Check your Password !");
	   document.form1.password.focus();
	   return false;
	 }  
	 
	 return true;
	 
 }
</script>		
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Reset Password</title>

<style type="text/css">
.style4 {            color: #990033;
            font-size: 14px;
            width: 173px;
}
</style>
 <%
   String userType=(String)session.getAttribute("userType");
   if(userType.equals("admin"))
   {
  %>
 <link rel="stylesheet" type="text/css" href="css/admin.css" />
  <%
  }else if(userType.equals("kiosk"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/kiosk.css" />
  <%
  }else if(userType.equals("patient"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
  <%
  }else if(userType.equals("doctor"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/doctor.css" />
  <%
  }
  %>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />

</head>
<body>
<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="AdminMenu.jsp"/></td>
  </tr>
  <tr height="475px">
    <td><form name="form1" method="post" action="DoctorResetPasswordHandler.jsp" onSubmit="return validateForm();">
      <table width="50%"  height="200px" align="center" style="border:dashed">
        <tr>
          <td colspan="3" align="center">RESETTING PASSWORD </td>
        </tr>
       
        <tr >
		
          <td colspan="3" align="center">You can reset doctor's password from here </td>
          </tr>
		  
		<tr>
		 <td><label>Id </label></td>
          <td colspan="2"><label>
            <input name="id" type="text" id="id" value="<%= doctor.getId()%>" readonly="readonly">
          </label></td> 
		</tr>  
        <tr >
          <td><label>New Password </label></td>
          <td colspan="2"><label>
            <input name="password" type="password" id="password" maxlength="30">
          </label></td>
          </tr>
        <tr >
          <td><label>Confirm Password </label></td>
          <td colspan="2"><label>
          <input type="password" name="password1" id="password1" maxlength="30">
          </label></td>
          </tr>
        
        <tr >
          <td>&nbsp;</td>
          <td><label>
            <input name="Submit" type="submit" id="Submit" value="Submit">
          </label></td>
          <td><label>
            <input name="Cancel" type="button" id="Cancel" value="Cancel"  onClick="window.location.href='DoctorList.jsp'" >
          </label></td>
        </tr>
      </table>
        </form>    </td>
  </tr>
  
  
  
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>