<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory"/>
<jsp:setProperty name="patientHistory" property="patientId"/>	

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>	


<head>
<title>Patient Prescription List</title>

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
    <td><jsp:include page="PatientMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="6"><center>
          <h1><strong><span class="lblHeading">Patient Prescription List</span></strong></h1>
        </center></td>
        </tr>
	 
		
      <tr>
        <td height="30" style="color:#CC0000">Sno</td>
        <td>Doctor Name</td>
        <td>Symptoms</td>
		<td>Prescription</td>
		<td>Date</td>
		<td>Action</td>
      </tr>
	  <%
	     
	  ArrayList list = patientHistory.getPatientHistoryList();
	  if(list!=null && list.size()>0){
	  	ArrayList doctorNameList=(ArrayList)list.get(0);
		ArrayList createDateList =(ArrayList)list.get(1);
		ArrayList transactionIdList =(ArrayList)list.get(2);
		ArrayList prescriptionList =(ArrayList)list.get(3);
		ArrayList symptomsList =(ArrayList)list.get(4);
		for(int i=0;i<doctorNameList.size();i++){
		
	  %>
      <tr bgcolor='<%=i%2==0?"#FFFBF0":"#CCCCFF"%>'>
        <td><%=i+1%></td>
        <td><%=doctorNameList.get(i)%></td>
        <td><%=symptomsList.get(i)%></td>
		<td><%=prescriptionList.get(i)%></td>
		<td><%=createDateList.get(i)%></td>
        <td><a href="PatientViewPrescription.jsp?transactionId=<%=transactionIdList.get(i)%>">View Prescription</a></td>
      </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="6">Record Not Found</td>
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
