<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="ErrorPage.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="patient" class="vmh.Patient"/>
<jsp:setProperty name="patient" property="id"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}  %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Patient Detail Form</title>
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

<%
	
	patient.getRecord();
	
%>
	

</head>

<body>

<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
    <td>
	
	<%  
	   if(session.getAttribute("userType").toString().equals("admin")){
	%>
      <jsp:include page="AdminMenu.jsp"/>
	  <%  
	  }else{
	  %>
	  <jsp:include page="PatientMenu.jsp"/>
	  <%
	  }	  
	   %>
	
	
	</td>
  </tr>
  
<tr height="475px">
    <td><center>
	<%  
	   if(session.getAttribute("userType").toString().equals("admin")){
	%>
      <form name="form1" method="post" onSubmit="return validateForm();" action="PatientList.jsp">
	  <%  
	  }else{
	  %>
	  <form name="form1" method="post" onSubmit="return validateForm();" action="PatientHome.jsp">
	  <%
	  }	  
	   %>
	  
        <table width="80%">
          <tr>
            <td colspan="5"><div align="center">
              <h2><strong><span style="color: #0000ff">PATIENT  DETAIL FORM </span></strong></h2>
            </div></td>
          </tr>
		  <input name="id" type="hidden" value="<%= patient.getId()%>">
          <tr>
            <td colspan="5" class="style4"><h4><strong>Personal Information </strong></h4>
              <p></p></td>
          </tr>
          
          <tr>
            <td width="17%" class="style5">Name*</td>
            <td width="24%" class="style2"><label>
              <%= patient.getName()%>
            </label></td>
            <td width="17%" class="style6">Fathers Name* </td>
            <td width="24%"><label>
              <%= patient.getFname()%>
            </label></td>
            <td width="18%">&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Date of Birth* </td>
            <td class="style2"><label>
              <%= patient.getDob()%>
            </label></td>
            <td class="style6">Gender*</td>
			
            <td>
			<label>
			<%= patient.getGender() %>
			  </label>
			  </td>
			 
			  	  
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Nationality*</td>
			
            <td class="style2"><label>
              <%= patient.getNationality() %>
			</label>
			  </td>
			 
            <td class="style6">Qualification*</td>
            <td><label>
             <%= patient.getQualification() %>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Occupation*</td>
            <td class="style2"><label>
              <%= patient.getOccupation() %>
            </label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" class="style4"><h4>Contact Information </h4></td>
          </tr>
          <tr>
            <td class="style5" style="color: #339966"><strong>Present</strong></td>
            <td><label></label></td>
            <td class="style6" style="color: #339966"><strong>Permanent</strong></td>
            
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Address*</td>
            <td class="style2"><label>
              <%= patient.getAddress1()%>
            </label></td>
            <td class="style6">Address</td>
            <td><label>
              <%= patient.getAddress2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="23" class="style5">City*</td>
            <td class="style2"><label>
              <%= patient.getCity1()%>
            </label></td>
            <td class="style6">City</td>
            <td><label>
              <%= patient.getCity2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">State*</td>
            <td class="style2"><label>
              <%= patient.getState1()%>
            </label></td>
            <td class="style6">State</td>
            <td><label>
              <%= patient.getState2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Country*</td>
            <td class="style2"><label>
              <%= patient.getCountry1()%>
            </label></td>
            <td class="style6">Country</td>
            <td><label>
              <%= patient.getCountry2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Zip*</td>
            <td class="style2"><label>
             <%= patient.getZip1()%>
            </label></td>
            <td class="style6">Zip</td>
            <td><label>
              <%= patient.getZip2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Phone*</td>
            <td class="style2"><label>
              <%= patient.getLandline1()%>
            </label></td>
            <td class="style6">Phone </td>
            <td><label>
              <%= patient.getLandline2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style7">Mobile*</td>
            <td class="style8"><label>
              <%= patient.getMobile1()%>
            </label></td>
            <td class="style9">Mobile</td>
            <td class="style10"><label>
              <%= patient.getMobile2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
         
          <tr>
            <td colspan="5" class="style4"><h4><strong>Login Information </strong></h4></td>
            </tr>
          <tr>
            <td class="style5">UserName*</td>
            <td class="style2"><label>
              <%= patient.getId()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style6">Password*</td>
            <td><label>
              <%= patient.getPassword()%>
            </label></td>
            
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5" class="style4"><h4><strong>Others</strong></h4></td>
            </tr>
          <tr>
            <td class="style5">Email*</td>
            <td class="style2"><label>
              <%= patient.getEmail()%>
            </label></td>
            <td class="style6">Alternate Email </td>
            <td><label>
              <%= patient.getAlternateEmail()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Blood Group* </td>
            <td class="style2"><label>
              <%= patient.getBloodGroup()%>
            </label></td>
            <td colspan="3">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5"><center><label>
              <input name="OK" type="submit" style="width:150px;" id="OK" value="OK">
            </label></center></td>
            </tr>
			
			
        </table>
            </form>
    </center>    </td>
  </tr>
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
  
  </table>






</body>
</html>
