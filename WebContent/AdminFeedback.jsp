<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="feedback" class="vmh.Feedback"/>

<%  if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
    <jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Feedback List</title>

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
    <td><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="4" class="style4"><center><h1><strong>View  Feedback</strong></h1></center></td>
        </tr>
		
      <tr style="color:#330066; background-color:#999999;">
        <td height="30">Id</td>
        <td>Feedback</td>
		<td>Feedback Date</td>
        <td>Patient Name</td>
      </tr>
	  <%
	     
	  ArrayList list = feedback.getPatientFeedbackList();
	  if(list!=null && list.size()>0){
	  	ArrayList idList=(ArrayList)list.get(0);
		ArrayList patientNameList=(ArrayList)list.get(1);
		ArrayList feedbackList =(ArrayList)list.get(2);
		ArrayList feedbackDateList =(ArrayList)list.get(3);
		for(int i=0;i<idList.size();i++){
		
	  %>
      <tr bgcolor='<%=i%2==0?"#FFFBF0":"#CCCCFF"%>'>
        <td><%=idList.get(i)%></td>
		 <td><%=feedbackList.get(i)%></td>
        <td><%=feedbackDateList.get(i)%></td>
		<td><%=patientNameList.get(i)%></td>
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
