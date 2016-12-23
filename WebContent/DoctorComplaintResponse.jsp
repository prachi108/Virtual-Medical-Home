<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="complaint" class="vmh.Complaint"/>
<jsp:setProperty name="complaint" property="status"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Complaint List</title>

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
  window.location.href="DoctorComplaintResponse.jsp?status="+status;
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
    <td style="color:#CC0000"><div style="overflow:auto; height:450px; "><table width="1200" align="center">
      <tr>
        <td colspan="10"><center>
          <h1><strong> Complaint List </strong></h1>
        </center></td>
        </tr>
	 
		
      <tr>
        <td height="30">Status</td>
		<td height="30"><select name="status" id="status" onChange="getValueByStatus(this.value)">
		  <option value="all" selected>All</option>
          <option value="pending">Pending</option>
          <option value="open">Open</option>
          <option value="close">Close</option>
        </select></td>
		<script>document.getElementById('status').value='<%=complaint.getStatus()%>';</script>
		
        <td colspan="8"><label></label></td>
        </tr>
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td width="150" height="30">Complaint Id</td>
        <td width="150">Complaint By(id)</td>
		 <td width="150">Complaint To(id)</td>
        <td width="150">Subject</td>
        <td width="150">Description</td>
		<td width="150">Complaint Date</td>
		<td width="150">Status</td>
		<td width="150">Action</td>
      </tr>
	  <%
	   complaint.setReceiverId(session.getAttribute("id").toString());  
	  ArrayList list = complaint.getDoctorComplaintList();
	  if(list!=null && list.size()>0){
	  	ArrayList complaintIdList=(ArrayList)list.get(0);
		ArrayList senderIdList=(ArrayList)list.get(1);
		ArrayList receiverIdList =(ArrayList)list.get(2);
		ArrayList subjectList =(ArrayList)list.get(3);
		ArrayList descriptionList =(ArrayList)list.get(4);
		ArrayList complaintDateList =(ArrayList)list.get(5);
		ArrayList statusList =(ArrayList)list.get(6);
		for(int i=0;i<complaintIdList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        
        <td><%=complaintIdList.get(i)%></td>
		<td><%=senderIdList.get(i)%></td>
        <td><%=receiverIdList.get(i)%></td>
		<td><%=subjectList.get(i)%></td>
		<td><%=descriptionList.get(i)%></td>
		<td><%=complaintDateList.get(i)%></td>
		<td style="width:300px;"><%=statusList.get(i)%></td>
		<td style="width:300px;"><a href="DoctorViewComplaint.jsp?complaintId=<%=complaintIdList.get(i)%>">View</a>
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
