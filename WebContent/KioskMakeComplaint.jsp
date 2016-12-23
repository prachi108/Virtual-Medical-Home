<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="complaint" class="vmh.Complaint"/>
    <jsp:setProperty name="complaint" property="userType"/>
<html>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Complaint Form</title>

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
<link type="text/css" href="css/humanity/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<script src="js/Validation.js" type="text/javascript"></script>
<script>

function validateForm()
 { 
	 var abc;
	 
    if(document.form1.userType.value == "0")
	 {
	   alert("Fill UserType!");
	   document.form1.userType.focus();
	   return false;
	 }  
	 
	 if(document.form1.receiverName.value == "0")
	 {
	   alert("Fill ReceiverName!");
	   document.form1.receiverName.focus();
	   return false;
	 }  
	 
	 if(document.form1.senderName.value == "0")
	 {
	   alert("Fill SenderName!");
	   document.form1.senderName.focus();
	   return false;
	 }  
	 
	 if(document.form1.subject.value == "")
	 {
	   alert("Fill Subject!");
	   document.form1.subject.focus();
	   return false;
	 }  
	 
	 if(document.form1.description.value == "")
	 {
	   alert("Fill Description!");
	   document.form1.description.focus();
	   return false;
	 }  
	 
	 return true;
  }	 
  </script>
<script>
function getValueByType(type)
{
   window.location.href="KioskMakeComplaint.jsp?userType="+type;   
}
</script>
</head>
<body>
<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
  	<td><jsp:include page="KioskMenu.jsp"/></td>
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
    <td align="center"><form method="post" onSubmit="return validateForm();" action="KioskMakeComplaintHandler.jsp" name="form1">
	  <table width="70%">
	  
	     <input name="userType1" type="hidden" value="patient" id="userType1">
	  
        <tr>
          <td colspan="4"><div align="center"><strong><span style="color: #0000ff">Patient Complaint Form</span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4"><center>The Complaints can be of following types :- </center></td>
        </tr>
		<tr>
          <td colspan="4"><center>*If you are not getting the responses timely</center></td>
        </tr>
		<tr>
          <td colspan="4"><center>*In the case of wrong medication</center></td>
        </tr>
		<tr>
          <td colspan="4"><center>Your Complaint will be fully confidential</center></td>
        </tr>
        <tr>
          <td colspan="4"><center>Fill All Details to make a Complaint</center></td>
         </tr>
        <tr>
		<td width="50%" colspan="2">With Whome* </td>
		<td width="50%" colspan="2"><span class="style2">
		<select name="userType" id="userType" onChange="getValueByType(this.value)">
		  <option value="0">--Select One--</option>
		  <option value="doctor">Doctor</option>
		  <option value="admin">Admin</option>
		</select></span></td>
		<script>document.getElementById('userType').value='<%=complaint.getUserType()%>';</script>
		</tr>
		<tr>
		<td width="50%" colspan="2" class="style5">Select User* </td>
		<td width="50%" colspan="2" class="style6"><span class="style2"><select name="receiverName" id="receiverName">
		  <option value="0">--Select One--</option>
		 <%
	  ArrayList list=complaint.getRecieverList();
	  if(list!=null && list.size()>0){
		for(int i=0;i<list.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=list.get(i)%>"><%=list.get(i)%></option>
		
	
	   <%}
	  } %>
		</select></span></td>
		</tr>
		<tr>
		<td width="50%" colspan="2" class="style5">Patient* </td>
		<td width="50%" colspan="2" class="style6"><span class="style2">
		<select name="senderName" id="senderName">
		  <option value="0">--Select One--</option>
		   <%
	  ArrayList list1=complaint.getSenderList();
	  if(list1!=null && list1.size()>0){
		for(int i=0;i<list1.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
		
	   <%}
	  } %>
		</select></span></td>
		</tr>
		<tr>
		<td width="50%" colspan="2" class="style5">Subject* </td>
		<td width="50%" colspan="2" class="style6"><span class="style2"><input name="subject" type="text" id="subject" maxlength="100"></span></td>
		</tr>
		<tr>
		<td width="50%" height="95" colspan="2" class="style5">Description* 
		<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
		<td width="50%" colspan="2"><textarea name="description" cols="50" rows="5" id="description"></textarea></td>
		</tr>
		<tr>
		<td width="50%" colspan="2"><center><input name="Make Complaint" style="width:150px;" id="Make Complaint" value="Make Complaint" type="submit"></center></td>
		<td width="50%" colspan="2"><center><input name="Close" id="Close" value="Close" style="width:150px;" type="button" onClick="window.location.href='KioskHome.jsp'"></center></td>
		</tr>
      </table>
    </form>    </td>
  </tr>
  
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>