<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="complaintReply" class="vmh.ComplaintReply"/>
<jsp:setProperty name="complaintReply" property="receiverName"/>

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

<script>
function getValueByName(name)
{
   window.location.href="KioskViewComplaintResponse.jsp?receiverName="+name;   
}
</script>
</head>

<% complaintReply.receiverId();  %>

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
       <td colspan="7"><h1 align="center"><span class="lblHeading">Patient Complaint Response </span></h1></td>
	   </tr>
	   
	   <tr>
       <td colspan="7" style="color:#CC0000">Patient can get the complaint through the administrator or doctor </td>
	   </tr>
	   
	   <tr>
	     <td style="color:#CC0000">Patient</td>
	     <td><label>
	       <select name="receiverName" id="receiverName" onChange="getValueByName(this.value)">
		    <option value="0">--Select One--</option>
		   <%
	  ArrayList list1=complaintReply.getSenderList();
	  if(list1!=null && list1.size()>0){
		for(int i=0;i<list1.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
		
	   <%}
	  } %>
            </select>
	     </label></td>
		 <script>document.getElementById('receiverName').value='<%=complaintReply.getReceiverName()%>';</script>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
	     <td>&nbsp;</td>
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
	   <td width="185"><div style="width:300px; height:50px; overflow:auto;word-wrap: break-word; "><%=replyDetailList.get(i)%></div></td>
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
