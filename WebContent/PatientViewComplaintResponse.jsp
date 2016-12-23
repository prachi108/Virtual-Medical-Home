<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="complaintReply" class="vmh.ComplaintReply"/>
<jsp:setProperty name="complaintReply" property="receiverId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Patient Complaint Response</title>

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
    <td><div style="overflow:auto; height:450px; "><table width="1200"  align="center">
      <tr>
       <td colspan="7" style="color:#6600CC"><h1 align="center">Patient Complaint Response </h1></td>
	   </tr>
	   
	   <tr>
       <td colspan="7" style="color:#CC0000">Patient can get the complaint through the administrator or doctor </td>
	   </tr>
	   
	   <tr style="color:#CC0000">
       <td width="130">&nbsp;</td>
	   <td width="130">&nbsp;</td>
	   <td width="185">Complaint Id </td>
	   <td width="185">Reply Date </td>
	   <td width="185">Doctor/Admin Id </td>
	   <td width="185">Reply Details </td>
	   <td width="154">&nbsp;</td>
       </tr>
	   
	    <%
	     
	  ArrayList list = complaintReply.getComplaintReplyList();
	  if(list!=null && list.size()>0){
	  	ArrayList complaintIdList=(ArrayList)list.get(0);
		ArrayList replyDateList =(ArrayList)list.get(1);
		ArrayList senderIdList =(ArrayList)list.get(2);
		ArrayList replyDetailList =(ArrayList)list.get(3);
		for(int i=0;i<complaintIdList.size();i++){
		
	  %>
	   
	   <tr bgcolor='<%=i%2==0?"#FFFBF0":"#CCCCFF"%>'>
        <td width="130">&nbsp;</td>
	   <td width="130">&nbsp;</td>
	   <td width="185"><%=complaintIdList.get(i)%></td>
	   <td width="185"><%=replyDateList.get(i)%></td>
	   <td width="185"><%=senderIdList.get(i)%></td>
	   <td width="185"><%=replyDetailList.get(i)%></td>
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
