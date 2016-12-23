<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="ErrorPage.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="kiosk" class="vmh.Kiosk"/>
<jsp:setProperty name="kiosk" property="id"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}  %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Kiosk Detail Form</title>
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
	
	kiosk.getRecord();
	
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
	  <jsp:include page="KioskMenu.jsp"/>
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
      <form name="form1" method="post" onSubmit="return validateForm();" action="KioskList.jsp">
	  <%  
	  }else{
	  %>
	  <form name="form1" method="post" onSubmit="return validateForm();" action="KioskHome.jsp">
	  <%
	  }	  
	   %>
        <table width="80%">
          <tr>
            <td colspan="5"><div align="center">
              <h2><strong><span style="color: #0000ff">KIOSK  DETAIL FORM </span></strong></h2>
            </div></td>
          </tr>
		  <input name="id" type="hidden" value="<%= kiosk.getId()%>">
          <tr>
            <td colspan="5"><h4><strong><span class="style4">Personal Information </span></strong></h4>
              <p></p></td>
          </tr>
          
          <tr>
            <td width="17%" class="style5">Name*</td>
            <td width="24%" class="style2"><label>
              <%= kiosk.getName()%>
            </label></td>
            <td width="17%" class="style6">Fathers Name* </td>
            <td width="24%"><label>
              <%= kiosk.getFname()%>
            </label></td>
            <td width="18%">&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Date of Birth* </td>
            <td class="style2"><label>
              <%= kiosk.getDob()%>
            </label></td>
            <td class="style6">Gender*</td>
			
            <td>
			<label>
			<%= kiosk.getGender() %>
			  </label>
			  </td>
			 
			  	  
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Nationality*</td>
			
            <td class="style2"><label>
              <%= kiosk.getNationality() %>
			</label>
			  </td>
			 
            <td class="style6">Qualification*</td>
            <td><label>
             <%= kiosk.getQualification() %>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Occupation*</td>
            <td class="style2"><label>
              <%= kiosk.getOccupation() %>
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
            <td class="style5" style="color: #339966"><strong>Permanent</strong></td>
            
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Address*</td>
            <td class="style2"><label>
              <%= kiosk.getAddress1()%>
            </label></td>
            <td class="style6">Address</td>
            <td><label>
              <%= kiosk.getAddress2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="23" class="style5">City*</td>
            <td class="style2"><label>
              <%= kiosk.getCity1()%>
            </label></td>
            <td class="style6">City</td>
            <td><label>
              <%= kiosk.getCity2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">State*</td>
            <td class="style2"><label>
              <%= kiosk.getState1()%>
            </label></td>
            <td class="style6">State</td>
            <td><label>
              <%= kiosk.getState2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Country*</td>
            <td class="style2"><label>
              <%= kiosk.getCountry1()%>
            </label></td>
            <td class="style6">Country</td>
            <td><label>
              <%= kiosk.getCountry2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Zip*</td>
            <td class="style2"><label>
             <%= kiosk.getZip1()%>
            </label></td>
            <td class="style6">Zip</td>
            <td><label>
              <%= kiosk.getZip2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Phone*</td>
            <td class="style2"><label>
              <%= kiosk.getLandline1()%>
            </label></td>
            <td class="style6">Phone </td>
            <td><label>
              <%= kiosk.getLandline2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style7">Mobile*</td>
            <td class="style8"><label>
              <%= kiosk.getMobile1()%>
            </label></td>
            <td class="style9">Mobile</td>
            <td class="style10"><label>
              <%= kiosk.getMobile2()%>
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
              <%= kiosk.getId()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style6">Password*</td>
            <td><label>
              <%= kiosk.getPassword()%>
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
              <%= kiosk.getEmail()%>
            </label></td>
            <td class="style6">Alternate Email </td>
            <td><label>
              <%= kiosk.getAlternateEmail()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Blood Group* </td>
            <td class="style2"><label>
              <%= kiosk.getBloodGroup()%>
            </label></td>
            <td colspan="3">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5"><center><label>
              <input name="OK" type="submit" id="OK" style="width:150px;" value="OK">
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
