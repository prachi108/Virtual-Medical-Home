<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="appointmentId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Symptoms Form</title>

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

<script src="js/Validation.js" type="text/javascript"></script>
<script>
function validateForm()
 { 
	 var abc;
	 
    if(document.form1.symptoms.value == "")
	 {
	   alert("Fill Symptoms!");
	   document.form1.symptoms.focus();
	   return false;
	 }  
	 
	 return true;
  }	 
	 
</script>
</head>
<body>

<% boolean flag = patientHistory.getPatientRecord();   %>

<table width="100%" height="600px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="PatientMenu.jsp"/></td>
  </tr>
  
 

  <tr height="500px">
    <td align="center"><form name="form1" method="post" action="PatientSendSymptomsHandler.jsp" onSubmit="return validateForm();">
	  <table width="70%">
	  
        <tr>
          <td width="73%" colspan="4"><div align="center"><strong><span style="color: #0000ff">Patient Symptoms Form</span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4" class="style4">(A patient can send his symptoms on or after the appointment date as given by their required doctor) </td>
        </tr>
        <tr>
          <td colspan="4" class="style4">Fill Details to get an Appointment </td>
          </tr>
		  <tr>
		    <td>Doctor Name*   </td>
			<td><input name="doctorName" id="doctorName" type="text" value="<%= patientHistory.getDoctorName()%>" readonly="readonly">  </td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>	
		  
		   <tr>
		    <td>Symptoms*   </td>
			<%  if(flag == true){   %>
			<td><textarea name="symptoms" cols="" rows="" id="symptoms"></textarea>
			<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
			<%  }else{   %>
			<td><textarea name="symptoms" cols="" rows="" id="symptoms" disabled="disabled"></textarea>
			<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
			<%  }  %>
			<td>Appointment Date*</td>
			<td><input name="appointmentDate" id="appointmentDate" type="text" value="<%= patientHistory.getAppointmentDate()%>" readonly="readonly"></td>
		  </tr>	
		  <input name="appointmentId" type="hidden" value="<%= patientHistory.getAppointmentId() %>" id="appointmentId">
		  
		  <tr>
		    <td>&nbsp;</td>
			<% if(flag == true){   %>
			<td><input name="sendSymptoms" type="submit" style="width:150px;" id="sendSymptoms" value="Send Symptoms"></td>
			<%  }else{   %>
			<td><input name="sendSymptoms" type="submit" style="width:150px;" id="sendSymptoms" value="Send Symptoms" disabled="disabled"></td>
			<%  }  %>
			<td><input name="close" type="button" id="close" style="width:150px;" value="Close" onClick="window.location.href='PatientHome.jsp'"></td>
			<td>&nbsp;</td>
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