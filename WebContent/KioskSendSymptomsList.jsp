<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="patientName"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Patient Appointment List</title>

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
function getValueByName(name)
{
   window.location.href="KioskSendSymptomsList.jsp?patientName="+name; 
}
</script>
<%  patientHistory.patientId(patientHistory.getPatientName());  %> 
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
    <td><div style="overflow:auto; height:450px; "><table width="1200"  align="center">
      <tr>
       <td colspan="7"><h1 align="center"><span class="lblHeading">Patient Appointment List</span></h1></td>
	   </tr>
	   
	   <tr>
	     <td style="color:#CC0000">Patient</td>
	     <td><label>
	       <select name="patientName" id="patientName" onChange="getValueByName(this.value)">
		    <option value="0">--Select One--</option>
		   <%
	  ArrayList list1=patientHistory.getPatientList();
	  if(list1!=null && list1.size()>0){
		for(int i=0;i<list1.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
		
	   <%}
	  } %>
            </select>
	     </label></td>
		 <script>document.getElementById('patientName').value='<%=patientHistory.getPatientName()%>';</script>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
        </tr>
	   <tr style="color:#CC0000">
       <td width="130">&nbsp;</td>
	   <td width="130">&nbsp;</td>
	   <td width="185">Sno </td>
	   <td width="185">Doctor Name</td>
	   <td width="185">Appointment Date</td>
	   <td width="185">Action</td>
	   <td width="154">&nbsp;</td>
       </tr>
	   
	    <%
	     
	  ArrayList list = patientHistory.getPatientAppointmentList();
	  if(list!=null && list.size()>0){
	  	ArrayList doctorNameList=(ArrayList)list.get(0);
		ArrayList appointmentDateList =(ArrayList)list.get(1);
		ArrayList appointmentIdList =(ArrayList)list.get(2);
		for(int i=0;i<doctorNameList.size();i++){
	  %>
	   
	   <tr bgcolor='<%=i%2==0?"#FFFBF0":"#CCCCFF"%>'>
        <td width="130">&nbsp;</td>
	   <td width="130">&nbsp;</td>
	   <td width="185"><%=i+1%></td>
	   <td width="185"><%=doctorNameList.get(i)%></td>
	   <td width="185"><%=appointmentDateList.get(i)%></td>
	   <td width="185"><a href="KioskSendSymptoms.jsp?appointmentId=<%=appointmentIdList.get(i)%>">Send Symptoms</a></td>
	   <td width="154">&nbsp;</td>
       </tr>
	   <%}
	  }else{
	  %>
	  <tr>
	    <td width="130">&nbsp;</td>
	    <td width="130">&nbsp;</td>
        <td colspan="4">Record Not Found</td>
		<td width="154">&nbsp;</td>
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
