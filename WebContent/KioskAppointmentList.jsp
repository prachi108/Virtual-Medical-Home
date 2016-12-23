<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="appointment" class="vmh.Appointment"/>
<jsp:setProperty name="appointment" property="kioskId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Kiosk Appointment List</title>

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
<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
    <td><jsp:include page="KioskMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="12"><center>
          <h1><strong><span class="lblHeading">Kiosk Appointment List</span></strong></h1>
        </center></td>
        </tr>
	 
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td height="30">Sno</td>
        <td>Doctor</td>
		<td>Patient</td>
        <td>Appointment Date</td>
        <td>Allotment Date</td>
		<td>Requested Appointment Date</td>
		<td>Request Date</td>
		<td>Appointment Id</td>
		<td>Description</td>
		<td>Remark</td>
		<td>Status</td>
		<td>Action</td>
      </tr>
	  <%
	     
	  ArrayList list = appointment.getKioskAppointmentList();
	  if(list!=null && list.size()>0){
	  	ArrayList doctorNameList=(ArrayList)list.get(0);
		ArrayList patientNameList=(ArrayList)list.get(1);
		ArrayList appointmentDateList =(ArrayList)list.get(2);
		ArrayList allotmentDateList =(ArrayList)list.get(3);
		ArrayList appointmentRequestedDateList =(ArrayList)list.get(4);
		ArrayList requestDateList =(ArrayList)list.get(5);
		ArrayList appointmentIdList =(ArrayList)list.get(6);
		ArrayList descriptionList =(ArrayList)list.get(7);
		ArrayList remarkList =(ArrayList)list.get(8);
		ArrayList appointmentStatusList =(ArrayList)list.get(9);
		for(int i=0;i<doctorNameList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        <td><%=i+1%></td>
        <td><%=doctorNameList.get(i)%></td>
		 <td><%=patientNameList.get(i)%></td>
        <td><%=appointmentDateList.get(i)%></td>
		<td><%=allotmentDateList.get(i)%></td>
		<td><%=appointmentRequestedDateList.get(i)%></td>
		<td><%=requestDateList.get(i)%></td>
		<td><%=appointmentIdList.get(i)%></td>
		<td><%=descriptionList.get(i)%></td>
		<td><%=remarkList.get(i)%></td>
		<td><%=appointmentStatusList.get(i)%></td>
        <td style="width:300px;"><a href="PatientAppointmentView.jsp?appointmentId=<%=appointmentIdList.get(i)%>">View</a></td>
      </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="12">Record Not Found</td>
      </tr>
	  <%
	  }
	  %>
    </table></div></td>
  </tr>
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
  
  </table>

</body>
</html>
