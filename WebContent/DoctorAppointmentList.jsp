<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="appointment" class="vmh.Appointment"/>
<jsp:setProperty name="appointment" property="doctorId"/>
<jsp:setProperty name="appointment" property="appointmentStatus"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Doctor Appointment List</title>

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

<script>
function getValueByStatus(status)
{
  window.location.href="DoctorAppointmentList.jsp?doctorId=<%=session.getAttribute("id")%>&appointmentStatus="+status;
}
</script>



</head>

<body style="height:100%">
<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
    <td><jsp:include page="DoctorMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="10"><center>
          <h1><strong>Appointment List          </strong></h1>
        </center></td>
        </tr>
	 
		
      <tr>
        <td height="30" style="color:#CC0000">Status</td>
		<td height="30"><select name="appointmentStatus" id="appointmentStatus" onChange="getValueByStatus(this.value)">
          <option value="pending">Pending</option>
          <option value="confirm">Confirm</option>
          <option value="cancel">Cancel</option>
        </select></td>
		<script>document.getElementById('appointmentStatus').value='<%=appointment.getAppointmentStatus()%>';</script>
		
        <td colspan="8"><label></label></td>
        </tr>
		
		
		
		<% if(session.getAttribute("message")!=null){ %> 
		<tr>
          <td colspan="3" align="center"><%=session.getAttribute("message")%></td>
        </tr>
		<% 
		session.removeAttribute("message");
       }
		%>  
		
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td width="120" height="30">Patient</td>
        <td width="120">Kiosk</td>
		 <td width="120">Appointment Id</td>
        <td width="120">Appointment Requested Date</td>
        <td width="120">Request Date</td>
		<td width="275">Description</td>
		<td width="274">Action</td>
      </tr>
	  <%
	     
	  ArrayList list = appointment.getDoctorAppointmentList();
	  if(list!=null && list.size()>0){
	  	ArrayList patientNameList=(ArrayList)list.get(0);
		ArrayList kioskNameList=(ArrayList)list.get(1);
		ArrayList appointmentRequestedDateList =(ArrayList)list.get(2);
		ArrayList requestDateList =(ArrayList)list.get(3);
		ArrayList appointmentIdList =(ArrayList)list.get(4);
		ArrayList descriptionList =(ArrayList)list.get(5);
		for(int i=0;i<patientNameList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        
        <td><%=patientNameList.get(i)%></td>
		<td><%=kioskNameList.get(i)%></td>
        <td><%=appointmentRequestedDateList.get(i)%></td>
		<td><%=requestDateList.get(i)%></td>
		<td><%=appointmentIdList.get(i)%></td>
		<td><%=descriptionList.get(i)%></td>
		<td style="width:300px;"><a href="DoctorGiveAppointment.jsp?appointmentId=<%=appointmentIdList.get(i)%>&appointmentRequestedDate=<%=appointmentRequestedDateList.get(i)%>">
		Give Appointment</a>||<a href="DoctorCancelAppointmentHandler.jsp?appointmentId=<%=appointmentIdList.get(i)%>">Cancel Appointment</a>
		</td>
      </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="10">Record Not Found</td>
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
