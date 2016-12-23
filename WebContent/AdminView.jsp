<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="ErrorPage.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="admin" class="vmh.Admin"/>
<jsp:setProperty name="admin" property="id"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}  %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Administor Detail Form</title>

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
	
	admin.getRecord();
	
%>
	

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
    <td><center>
      <form name="form1" method="post" onSubmit="return validateForm();" action="AdminList.jsp">
        <table width="80%">
          <tr>
            <td colspan="5"><div align="center">
              <h2><strong><span style="color: #0000ff">ADMINISTOR  DETAIL FORM </span></strong></h2>
            </div></td>
          </tr>
		  <input name="id" type="hidden" value="<%= admin.getId()%>">
          <tr>
            <td colspan="5"><h4><strong><span class="style4">Personal Information </span></strong></h4>
              <p></p></td>
          </tr>
          
          <tr>
            <td width="17%" class="style5">Name*</td>
            <td width="24%" class="style2"><label>
              <%= admin.getName()%>
            </label></td>
            <td width="17%" class="style6">Fathers Name* </td>
            <td width="24%"><label>
              <%= admin.getFname()%>
            </label></td>
            <td width="18%">&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Date of Birth* </td>
            <td class="style2"><label>
              <%= admin.getDob()%>
            </label></td>
            <td class="style5">Gender*</td>
			
            <td class="style2">
			<label>
			<%= admin.getGender() %>
			  </label>
			  </td>
			 
			  	  
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Nationality*</td>
			
            <td class="style2"><label>
              <%= admin.getNationality() %>
			</label>
			  </td>
			 
            <td class="style5">Qualification*</td>
            <td class="style2"><label>
             <%= admin.getQualification() %>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Occupation*</td>
            <td class="style2"><label>
              <%= admin.getOccupation() %>
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
              <%= admin.getAddress1()%>
            </label></td>
            <td class="style5">Address</td>
            <td class="style2"><label>
              <%= admin.getAddress2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="23" class="style5">City*</td>
            <td class="style2"><label>
              <%= admin.getCity1()%>
            </label></td>
            <td class="style5">City</td>
            <td class="style2"><label>
              <%= admin.getCity2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">State*</td>
            <td class="style2"><label>
              <%= admin.getState1()%>
            </label></td>
            <td class="style5">State</td>
            <td class="style2"><label>
              <%= admin.getState2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Country*</td>
            <td class="style2"><label>
              <%= admin.getCountry1()%>
            </label></td>
            <td class="style5">Country</td>
            <td class="style2"><label>
              <%= admin.getCountry2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Zip*</td>
            <td class="style2"><label>
             <%= admin.getZip1()%>
            </label></td>
            <td class="style5">Zip</td>
            <td class="style2"><label>
              <%= admin.getZip2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Phone*</td>
            <td class="style2"><label>
              <%= admin.getLandline1()%>
            </label></td>
            <td class="style5">Phone </td>
            <td class="style2"><label>
              <%= admin.getLandline2()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Mobile*</td>
            <td class="style2"><label>
              <%= admin.getMobile1()%>
            </label></td>
            <td class="style5">Mobile</td>
            <td class="style2"><label>
              <%= admin.getMobile2()%>
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
              <%= admin.getId()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Password*</td>
            <td class="style2"><label>
              <%= admin.getPassword()%>
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
              <%= admin.getEmail()%>
            </label></td>
            <td class="style5">Alternate Email </td>
            <td class="style2"><label>
              <%= admin.getAlternateEmail()%>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Blood Group* </td>
            <td class="style2"><label>
              <%= admin.getBloodGroup()%>
            </label></td>
            <td colspan="3">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5" class="style6"><center><label>
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
