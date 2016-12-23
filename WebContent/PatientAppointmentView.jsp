<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="ErrorPage.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="appointment" class="vmh.Appointment"/>
<jsp:setProperty name="appointment" property="appointmentId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Patient View Appointment</title>

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
	
	appointment.getAppointmentRecord();
	
%>
</head>

<body>

<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
<%  if(session.getAttribute("userType").equals("patient")){   %>
    <td><jsp:include page="PatientMenu.jsp"/></td>
<%   }else{   %>
    <td><jsp:include page="KioskMenu.jsp"/></td>
<%   }   %>	
  </tr>
  
<tr height="475px"><td>
<center><div style="overflow:auto; height:450px; ">
 <table width="70%">
  <tr>
    <td colspan="2"><center><h1><span class="lblHeading">Patient View Appointment</span></h1></center></td>
    </tr>
  <tr>
    <td colspan="2"><center>
      <strong>View Appointment</strong>
    </center></td>
    </tr>
  <tr>
    <td width="31%">Patient</td>
    <td><%= appointment.getPatientName() %></td>
    </tr>
  <tr>
    <td>Doctor</td>
    <td><%= appointment.getDoctorName() %></td>
    </tr>
  <tr>
    <td>Appointment Date </td>
    <td><%= appointment.getAppointmentDate() %></td>
    </tr>
  <tr>
    <td>Allotment Date </td>
    <td><%= appointment.getAllotmentDate() %></td>
    </tr>
  <tr>
    <td>Appointment Requested Date </td>
    <td><%= appointment.getAppointmentRequestedDate() %></td>
    </tr>
  <tr>
    <td>Request Date </td>
    <td><%= appointment.getRequestDate() %></td>
    </tr>
  <tr>
    <td>Description</td>
    <td><%= appointment.getDescription() %></td>
    </tr>
  <tr>
    <td>Remark</td>
    <td><%= appointment.getRemark() %></td>
    </tr>
  <tr>
    <td>Appointment Status </td>
    <td><%= appointment.getAppointmentStatus() %></td>
  </tr>
  <tr>
    <td colspan="2"><center>
	<%  if(session.getAttribute("userType").equals("patient")){   %>
      <input name="OK" type="button" id="OK" value="OK" onClick="window.location.href='PatientAppointmentList.jsp?patientId=<%=session.getAttribute("id")%>'">
	 <%  }else{     %>
	 <input name="OK" type="button" id="OK" value="OK" onClick="window.location.href='KioskAppointmentList.jsp?kioskId=<%=session.getAttribute("id")%>'">
	 <%  }   %>
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
