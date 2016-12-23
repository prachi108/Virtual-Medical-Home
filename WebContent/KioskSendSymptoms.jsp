<%@ page import = "java.util.*,java.sql.*" errorPage="ErrorPage.jsp" language="java" contentType="text/html; charset=ISO-8859-1"
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

<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="KioskMenu.jsp"/></td>
  </tr>
  
 

  <tr height="475px">
    <td align="center"><form name="form1" method="post" action="KioskSendSymptomsHandler.jsp" onSubmit="return validateForm();">
	  <table width="70%">
	  
        <tr>
          <td width="73%" colspan="4"><div align="center"><strong><span style="color: #0000ff">Patient Symptoms Form</span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4"><span style="color:#CC0000">(A patient can send his symptoms on or after the appointment date as given by their required doctor) </span></td>
        </tr>
        <tr>
          <td colspan="4"><span style="color:#CC0000">Fill Details to get an Appointment </span></td>
          </tr>
		  
		   <tr>
		    <td class="style5">Patient Name*  </td>
			<td><input name="patientName" id="patientName" type="text" value="<%= patientHistory.getPatientName()%>" readonly="readonly">  </td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>	
		  
		  <tr>
		    <td class="style2">Doctor Name*  </td>
			<td><input name="doctorName" id="doctorName" type="text" value="<%= patientHistory.getDoctorName()%>" readonly="readonly">  </td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>	
		  
		   <tr>
		    <td class="style5">Symptoms*   </td>
			<%  if(flag == true){   %>
			<td class="style2"><textarea name="symptoms" cols="" rows="" id="symptoms"></textarea></td>
			<%   }else{   %>
			<td class="style2"><textarea name="symptoms" cols="" rows="" id="symptoms" disabled="disabled"></textarea></td>
			<%   }   %>
			<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span>
			<td class="style5">Appointment Date*</td>
			<td class="style2"><input name="appointmentDate" id="appointmentDate" type="text" value="<%= patientHistory.getAppointmentDate()%>" readonly="readonly"></td>
		  </tr>	
		  <input name="appointmentId" type="hidden" value="<%= patientHistory.getAppointmentId() %>" id="appointmentId">
		  
		  <tr>
		    <td>&nbsp;</td>
			<%   if(flag == true){  %>
			<td><input name="sendSymptoms" type="submit" style="width:150px;" id="sendSymptoms" value="Send Symptoms"></td>
			<%  }else{   %>
			<td><input name="sendSymptoms" type="submit" style="width:150px;" id="sendSymptoms" value="Send Symptoms" disabled="disabled"></td>
			<%   }  %>
			<td><input name="close" type="button" id="close" style="width:150px;" value="Close" onClick="window.location.href='KioskHome.jsp'"></td>
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