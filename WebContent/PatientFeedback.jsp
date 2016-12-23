<%@ page import = "java.util.*,java.sql.*" errorPage="ErrorPage.jsp" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="feedback" class="vmh.Feedback"/>
	
<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>	
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Feedback Form</title>

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
<link type="text/css" href="css/humanity/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<script src="js/Validation.js" type="text/javascript"></script>
<script>

function validateForm()
 { 
	 var abc;
	 
    if(document.form1.feedback.value == "")
	 {
	   alert("Fill Feedback!");
	   document.form1.feedback.focus();
	   return false;
	 }  
	 
	 return true;
 }	 
  
</script>  
	 
</head>
<body>
<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
  	<td><jsp:include page="PatientMenu.jsp"/></td>
  </tr>
  
  <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td style="color:#CC0000">><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	

  <tr height="475px">
    <td align="center"><form name="form1" method="post" action="PatientFeedbackHandler.jsp" onSubmit="return validateForm();">
	  <table width="70%">
	  
        <tr>
          <td colspan="4"><div align="center"><strong><span style="color: #0000ff">Patient Feedback Form </span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4"><center>(If you have any suggestions and any difficulties during using our services, you should inform us!) </center></td>
        </tr>
        <tr>
          <td colspan="4">Fill All Details to give your Feedback </td>
         </tr>
        <tr>
		<td width="25%" colspan="1">Your Feedback* </td>
		<td width="75%" colspan="3"><textarea name="feedback" id="feedback" cols="140" rows="4"></textarea>
		<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
		</tr>
		<tr>
		<td width="50%" colspan="2"><center><input name="Send Feedback" style="width:150px;" id="Send Feedback" value="Send Feedback" type="submit"></center></td>
		<td width="50%" colspan="2"><center><input name="Close" id="Close" style="width:150px;" value="Close" type="button" onClick="window.location.href='PatientHome.jsp'"></center></td>
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