<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>
	
<jsp:useBean id="appointment" class="vmh.Appointment"/>
<jsp:setProperty name="appointment" property="appointmentId"/>
<jsp:setProperty name="appointment" property="appointmentRequestedDate"/>
<html>

<head>
<link type="text/css" href="css/humanity/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script src="js/Validation.js" type="text/javascript"></script>


<script type="text/javascript">
$(function(){
	$('#appointmentDate').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: "dd-mm-yy"
	});
	
});
</script>
<script>
function validateForm()
 { 
    if(document.form1.remark.value == "")
	 {
	   alert("Fill Remark!");
	   document.form1.remark.focus();
	   return false;
	 }  
	 
	 return true;   
   
 }
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Reply Form</title>

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
<body>
<table width="100%" height="625px" border="1">
  <tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td><jsp:include page="DoctorMenu.jsp"/></td>
  </tr>
  	

  <tr height="475px">
    <td align="center"><form method="post" name="form1" onSubmit="return validateForm();" action="DoctorGiveAppointmentHandler.jsp?appointmentId=<%= appointment.getAppointmentId() %>">
	  <table width="70%">
	  
        <tr>
          <td colspan="4"><div align="center"><strong><span style="color: #0000ff">Patient Appointment Reply </span></strong></div></td>
          </tr>
        <tr>
          <td colspan="4"><center>(Reply by Doctor as Response of Patient) </center></td>
        </tr>
        <tr>
          <td colspan="4">Fill Details to give an Appointment to Patient </td>
          </tr>
        <tr>
          <td height="28" class="style5">Appointment Requested Date </td>
          <td class="style2"><label>
            <input type="text" name="appointmentRequestedDate" value="<%= appointment.getAppointmentRequestedDate() %>" readonly>
          </label></td>
          <td width="43%" colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td height="28" class="style5">Appointment Date* </td>
          <td class="style2"><label>
		  <%  appointment.getAppointmentRecord();
		      if(appointment.getAppointmentStatus().equals("confirm")){	 %>
            <input type="text" name="appointmentDate" id="appointmentDate" value="<%= appointment.getAppointmentDate() %>">
			<% }else{  %>
			<input type="text" name="appointmentDate" id="appointmentDate">
			<%  }  %>
          </label></td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td height="28" class="style5">Remark</td>
          <td class="style2"><label>
		  <%  if(appointment.getAppointmentStatus().equals("confirm")){  %>
            <textarea name="remark" id="remark"><%= appointment.getRemark() %></textarea>
			<% }else{  %>
			<textarea name="remark" id="remark"></textarea>
			<%  }  %>
			 <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator17" style="color:Red;display:none;">*</span> <span id="ctl00_ContentPlaceHolder1_CompareValidator3" style="color:Red;display:none;">*</span></td>
          </label></td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td width="25%" height="28">&nbsp;</td>
          <td width="32%"><label>
		  <%  if(appointment.getAppointmentStatus().equals("confirm")){  %>
            <input name="Give Appointment" type="submit" id="Give Appointment" style="width:150px;" value="Change Appointment">
			<% }else{  %>
			 <input name="Give Appointment" type="submit" id="Give Appointment" style="width:150px;" value="Give Appointment">
			<%  }  %>
          </label></td>
          <td colspan="2">&nbsp;</td>
          </tr>
        <tr>        </tr>
      </table>
    </form>    </td>
  </tr>
  
  
  
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>