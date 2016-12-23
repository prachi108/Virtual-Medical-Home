<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="ErrorPage.jsp" import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="transactionId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>View Prescription Record</title>

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

<%
	
	patientHistory.getRecord();
	
%>
</head>

<body  style="height:100%">

<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">

    <td><jsp:include page="DoctorMenu.jsp"/></td>
	
  </tr>
  
<tr height="475px"><td>
<center><div style="overflow:auto; height:450px; ">
 <table width="70%">
  <tr>
    <td colspan="4"><center><h1><span class="lblHeading">View Prescription Record</span></h1></center></td>
    </tr>
  
  <tr>
    <td class="style5">Patient Name</td>
    <td colspan="3" class="style2"><%= patientHistory.getPatientName() %></td>
    </tr>
	
	<tr>
    <td class="style5">Doctor Name</td>
    <td colspan="3" class="style2"><%= patientHistory.getDoctorName() %></td>
    </tr>
	
    <tr>
    <td class="style5">Symptoms</td>
    <td colspan="3" class="style2"><%= patientHistory.getSymptoms() %></td>
    </tr>
	
	<tr>
    <td class="style5">Observation</td>
    <td colspan="3" class="style2"><%= patientHistory.getObservation() %></td>
    </tr>
	
	<tr>
    <td class="style5">Tests</td>
    <td colspan="3" class="style2"><%= patientHistory.getTests() %></td>
    </tr>
	
	<tr>
    <td class="style5">Prescription</td>
    <td colspan="3" class="style2"><%= patientHistory.getPrescription() %></td>
    </tr>
  <tr>
    <td colspan="4"><center>
      <input name="OK" type="button" id="OK" value="OK" onClick="window.location.href='DoctorViewLastPrescriptionList.jsp?doctorId=<%=session.getAttribute("id")%>'">
    </center></td>
    </tr>
</table></div>
</center>
 
  </td></tr>
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
  
  </table>


</body>
</html>
