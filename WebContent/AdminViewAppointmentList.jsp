<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="appointment" class="vmh.Appointment"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Admin View Appointment List</title>

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
    <td><jsp:include page="AdminMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td><div style="overflow:auto; height:450px; "><table width="1300" align="center">
      <tr>
        <td colspan="11"><center><h1><strong>Admin View Appointment List</strong></h1></center></td>
        </tr>
	 
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td height="30">Appointment Id</td>
		<td>Doctor</td>
        <td>Appointment Date</td>
        <td>Allotment Date</td>
		<td>Patient</td>
		<td>Kiosk</td>
		<td>Requested Appointment Date</td>
		<td>Request Date</td>
		<td>Status</td>
		<td>Description</td>
		<td>Remark</td>
      </tr>
	  <%
	     
	  ArrayList list = appointment.getAdminAppointmentList();
	  if(list!=null && list.size()>0){
	  	ArrayList doctorNameList=(ArrayList)list.get(0);
		ArrayList patientNameList=(ArrayList)list.get(1);
		ArrayList kioskNameList=(ArrayList)list.get(2);
		ArrayList appointmentDateList =(ArrayList)list.get(3);
		ArrayList allotmentDateList =(ArrayList)list.get(4);
		ArrayList appointmentRequestedDateList =(ArrayList)list.get(5);
		ArrayList requestDateList =(ArrayList)list.get(6);
		ArrayList appointmentIdList =(ArrayList)list.get(7);
		ArrayList descriptionList =(ArrayList)list.get(8);
		ArrayList remarkList =(ArrayList)list.get(9);
		ArrayList appointmentStatusList =(ArrayList)list.get(10);
		for(int i=0;i<doctorNameList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        <td><%=appointmentIdList.get(i)%></td>
        <td><%=doctorNameList.get(i)%></td>
        <td><%=appointmentDateList.get(i)%></td>
		<td><%=allotmentDateList.get(i)%></td>
		<td><%=patientNameList.get(i)%></td>
		<td><%=kioskNameList.get(i)%></td>
		<td><%=appointmentRequestedDateList.get(i)%></td>
		<td><%=requestDateList.get(i)%></td>
		<td><%=appointmentStatusList.get(i)%></td>
		<td><%=descriptionList.get(i)%></td>
		<td><%=remarkList.get(i)%></td>
	  </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="11">Record Not Found</td>
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
