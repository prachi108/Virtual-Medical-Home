<%@ page import = "java.util.*,java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1" errorPage="ErrorPage.jsp"  pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="specialization" class="vmh.Specialization"/>
	<jsp:setProperty name="specialization" property="specializationName"/>
	
<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>		
	
	<%
	
	specialization.getRecord();
	
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>

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

<script src="js/Validation.js" type="text/javascript"></script>
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
    <td><jsp:include page="AdminMenu.jsp"/></td>
  </tr>
  <tr height="475px">
    <td><form name="form1" method="post" action="SpecializationEditHandler.jsp"  onSubmit="return validateForm();">
      <table width="50%"  height="200px" align="center">
        <tr>
          <td colspan="3" align="center">Specialization Form</td>
        </tr>
        
       <% if(session.getAttribute("message")!=null){ %> 
		<tr>
          <td colspan="3" align="center" style="color:#F00; font:Verdana, Geneva, sans-serif"><%=session.getAttribute("message")%></td>
        </tr>
		<% 
		session.removeAttribute("message");
       }
		%>  
        <tr >
		
          <td colspan="3" align="center">You can edit specialization for doctor from here</td>
          </tr>
        <tr >
          <td><label>Specialization Name</label>&nbsp;</td>
          <td colspan="2"><label>
            <input name="specializationName" type="text" id="specializationName" value="<%= specialization.getSpecializationName()%>" readonly="readonly">
          </label></td>
          </tr>
        <tr >
          <td><label>Description</label>&nbsp;</td>
          <td colspan="2"><label>
            <textarea name="description" id="description" ><%= specialization.getDescription()%></textarea>
          </label></td>
          </tr>
        
        <tr >
          <td>&nbsp;</td>
          <td><label>
            <input name="Update" type="submit" id="Update" value="Update">
          </label></td>
          <td><label>
            <input name="Cancel" type="button" id="Cancel" value="Cancel"  onClick="window.location.href='SpecializationList.jsp'" >
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