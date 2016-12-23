<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="doctorId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>View Symptoms</title>

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
    <td><jsp:include page="DoctorMenu.jsp"/></td>
  </tr>
  
   <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td style="color:#CC0000"><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	

<tr height="475px">
    <td><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="4"><center>
          <h1><strong><span class="lblHeading">View Prescription</span></strong></h1>
        </center></td>
        </tr>
	 
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td height="30">Sno</td>
        <td>Patient Name</td>
		<td>Symptoms</td>
		<td>Action</td>
      </tr>
	  <%
	     
	  ArrayList list = patientHistory.getDoctorAppointmentList();
	  if(list!=null && list.size()>0){
	  	ArrayList patientNameList=(ArrayList)list.get(0);
		ArrayList symptomsList =(ArrayList)list.get(1);
		ArrayList transactionIdList =(ArrayList)list.get(2);
		for(int i=0;i<patientNameList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        <td><%=i+1%></td>
        <td><%=patientNameList.get(i)%></td>
        <td><%=symptomsList.get(i)%></td>
        <td><a href="DoctorGivePrescription.jsp?transactionId=<%=transactionIdList.get(i)%>">Send Prescription</a></td>
      </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="4">Record Not Found</td>
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
