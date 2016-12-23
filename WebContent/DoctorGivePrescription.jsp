<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="transactionId"/>
<html>
<head>

<script src="js/Validation.js" type="text/javascript"></script>
<script>

function validateForm()
 { 
    if(document.form1.observation.value == "")
	 {
	   alert("Fill Observation!");
	   document.form1.observation.focus();
	   return false;
	 }  
	 
	 if(document.form1.tests.value == "")
	 {
	   alert("Fill Tests!");
	   document.form1.tests.focus();
	   return false;
	 }  
	 
	  if(document.form1.prescription.value == "")
	 {
	   alert("Fill Prescription!");
	   document.form1.prescription.focus();
	   return false;
	 }  
	 
	 return true;   
   
 }
 </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Prescription Form</title>

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
<body style="height:100%">

<% patientHistory.getRecord();   %>

<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="DoctorMenu.jsp"/></td>
  </tr>
  
 

  <tr height="475px">
    <td align="center"><div style="overflow:auto; height:450px; "><form name="form1" method="post" action="DoctorGivePrescriptionHandler.jsp" onSubmit="return validateForm();">
	  <table width="70%">
	  
        <tr>
          <td width="73%" colspan="4"><div align="center"><h2><strong>Doctor Prescription Form</strong></h2></div></td>
          </tr>
        <tr>
          <td colspan="4">(This form is filled by doctor to give prescription to the patient) </td>
        </tr>
        <tr>
          <td colspan="4">Fill Details to give prescription to the patient</td>
          </tr>
		  <tr>
		    <td style="color:#CC0000">Patient Name*   </td>
			<td colspan="3" style="color:#CC0000"><input name="patientName" type="text" id="patientName" value="<%= patientHistory.getPatientName()%>" readonly="readonly"> </td>
			
		  </tr>	
		  
		  <tr>
		    <td style="color:#CC0000">Symptoms*   </td>
			<td colspan="3" style="color:#CC0000"><textarea name="symptoms" id="symptoms" readonly="readonly" cols="60" rows="3"><%= patientHistory.getSymptoms()%></textarea></td>
			
		  </tr>	
		  
		   <tr>
		    <td style="color:#CC0000">Observation*   </td>
			<td colspan="3" style="color:#CC0000"><textarea name="observation" id="observation" cols="60" rows="3"></textarea></td>
		  </tr>	
		  
		  <tr>
		    <td style="color:#CC0000">Tests*   </td>
			<td colspan="3" style="color:#CC0000"><textarea name="tests" id="tests" cols="60" rows="3"></textarea></td>
		  </tr>	
		  
		  <tr>
		    <td style="color:#CC0000">Prescription*   </td>
			<td colspan="3" style="color:#CC0000"><textarea name="prescription" id="prescription" cols="60" rows="3"></textarea></td>
		  </tr>	
		  
		  <tr>
		  <td colspan="4"><center>
		  <input name="Give Prescription" style="color:#CC0000" value="Give Prescription" type="submit">
		  </center></td>
		  </tr>
		  
		  <input name="transactionId" type="hidden" value="<%= patientHistory.getTransactionId()%>" id="transactionId">
			  
      </table>
    </form> </div>   </td>
  </tr>
  
  
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>