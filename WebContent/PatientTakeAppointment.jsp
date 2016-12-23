<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="appointment" class="vmh.Appointment"/>
	
<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>	
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/humanity/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script src="js/Validation.js" type="text/javascript"></script>


<script type="text/javascript">
$(function(){
	$('#appointmentRequestedDate').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: "dd-mm-yy"
	});
	
});
</script>
<title>Appointment Request Form</title>

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
function validateForm()
 { 
	 var abc;
	 
    if(document.form1.description.value == "")
	 {
	   alert("Fill Description!");
	   document.form1.description.focus();
	   return false;
	 }  
	 
	 if(document.form1.appointmentRequestedDate.value == "")
	 {
	   alert("Fill Appointment Requested Date!");
	   document.form1.appointmentRequestedDate.focus();
	   return false;
	 }  
	 
	 abc = checkDate(document.form1.appointmentRequestedDate.value);
	 if(abc == false)
	 {
	   alert("Fill valid Appointment Requested Date in dd-mm-yyy format!");
	   document.form1.appointmentRequestedDate.focus();
	   return false;
	 } 
	 
	 return true;
  }	 
	 
</script>
</head>
<body>
<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="PatientMenu.jsp"/></td>
  </tr>
  
  <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	

  <tr height="475px">
    <td align="center"><form method="post" name="form1" action="PatientTakeAppointmentHandler.jsp" onSubmit="return validateForm();">
	  <table width="70%">
	  
        <tr>
          <td colspan="4"><div align="center"><strong><span style="color: #0000ff">Appointment Request Form </span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4">(A patient can make his request for getting the appointment by their require doctor) </td>
        </tr>
        <tr>
          <td colspan="4">Fill Details to get an Appointment </td>
          </tr>
        <tr>
          <td width="18%" height="28">Doctor Name* </td>
          <td width="27%"><label>
            <select name="doctorName" id="doctorName">
	<%
	  ArrayList list1=appointment.getDoctorList();
	  if(list1!=null && list1.size()>0){
		for(int i=0;i<list1.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
		
	
	   <%}
	  } %>
	
	</select>
          </label></td>
          <td colspan="2">&nbsp;</td>
          </tr>
        <tr>
          <td height="29">Description*</td>
          <td rowspan="2"><label>
            <textarea name="description" id="description"></textarea>
          </label>
		  <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
          <td width="26%">Appointment Request Date* </td>
          <td width="29%"><label>
            <input type="text" name="appointmentRequestedDate" id="appointmentRequestedDate">
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" rowspan="2">&nbsp;</td>
          </tr>
        <tr>
          <td colspan="2" align="center"><label>
		  <%   if(list1 == null){  %>  
            <input name="Get Appointment" type="submit" style="width:150px;" id="Get Appointment" value="Get Appointment" disabled="disabled">
		  <%  }else{  %>
		    <input name="Get Appointment" type="submit" style="width:150px;" id="Get Appointment" value="Get Appointment">
		  <%  }  %>	
          </label></td>
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