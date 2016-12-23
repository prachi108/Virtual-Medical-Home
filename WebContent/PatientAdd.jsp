<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="ErrorPage.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="patient" class="vmh.Patient"/>

<% if(request.getParameter("flag")==null){
   if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}}   %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Patient Registration Form</title>

<style type="text/css">
.style4 {            color: #990033;
            font-size: 14px;
            width: 173px;
}
#innertable tr{  text-align:left;
   
   }
</style>


 <%
   String userType=(String)session.getAttribute("userType");
 if(userType!=null)
 {
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
 }
  %>
<link type="text/css" href="css/humanity/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<script src="js/Validation.js" type="text/javascript"></script>
<script>

function writeOn(name){
  if(document.form1.checkbox.checked == true)
	 {
	   document.getElementById(name.substring(0,name.length-1)+"2").value=document.getElementById(name).value;
   
	 }else{
	 document.getElementById(name.substring(0,name.length-1)+"2").value="";
	 } 
}
function check()
 {
    
	    writeOn("address1");
		 writeOn("city1");
		  writeOn("state1");
		   writeOn("country1");
		    writeOn("zip1");
			 writeOn("landline1");
			  writeOn("mobile1");
	
  }
</script>

<script>

function validateForm()
 { 
      
	var yes=checkLoginId('NO');
	 if(yes == "true")
		 return false;
	
	 
	 var abc;
	 
    if(document.form1.name.value == "")
	 {
	   alert("Fill Name!");
	   document.form1.name.focus();
	   return false;
	 }  
	 
	 abc = checkOnlyAlphabets(document.form1.name.value);
	 if(abc == false)
	 {
	   alert("Fill valid name!");
	   document.form1.name.focus();
	   return false;
	 } 


    if(document.form1.fname.value == "")
	 {
	   alert("Fill Father's Name!");
	   document.form1.fname.focus();
	   return false;
	 }  
	 
	  abc = checkOnlyAlphabets(document.form1.fname.value);
	 if(abc == false)
	 {
	   alert("Fill valid father name!");
	   document.form1.fname.focus();
	   return false;
	 } 
	 
	if(document.form1.dob.value == "")
	 {
	   alert("Fill Date of Birth!");
	   document.form1.dob.focus();
	   return false;
	 }  
	 
	 abc = checkDate(document.form1.dob.value);
	 if(abc == false)
	 {
	   alert("Fill valid date of birth in dd-mm-yyy format!");
	   document.form1.dob.focus();
	   return false;
	 } 
	 
	 if(document.form1.qualification.value == "null")
	 {
	   alert("Fill Qualification!");
	   document.form1.qualification.focus();
	   return false;
	 }  
	 
	if(document.form1.occupation.value == "null")
	 {
	   alert("Fill Occupation!");
	   document.form1.occupation.focus();
	   return false;
	 }   
	 
	if(document.form1.address1.value == "")
	 {
	   alert("Fill Address!");
	   document.form1.address1.focus();
	   return false;
	 }  
	 
	if(document.form1.city1.value == "")
	 {
	   alert("Fill City!");
	   document.form1.city1.focus();
	   return false;
	 }  
	 
	 abc = checkOnlyAlphabets(document.form1.city1.value);
	 if(abc == false)
	 {
	   alert("Fill valid city!");
	   document.form1.city1.focus();
	   return false;
	 } 
	 
	if(document.form1.state1.value == "")
	 {
	   alert("Fill State!");
	   document.form1.state1.focus();
	   return false;
	 }      

     abc = checkOnlyAlphabets(document.form1.state1.value);
	 if(abc == false)
	 {
	   alert("Fill valid state!");
	   document.form1.state1.focus();
	   return false;
	 } 

    if(document.form1.country1.value == "")
	 {
	   alert("Fill Country!");
	   document.form1.country1.focus();
	   return false;
	 }  
	 
	 abc = checkOnlyAlphabets(document.form1.country1.value);
	 if(abc == false)
	 {
	   alert("Fill valid country!");
	   document.form1.country1.focus();
	   return false;
	 } 
	 
	if(document.form1.zip1.value == "")
	 {
	   alert("Fill Zip Code!");
	   document.form1.zip1.focus();
	   return false;
	 }  
	 
	if(document.form1.landline1.value == "")
	 {
	   alert("Fill Phone Number!");
	   document.form1.landline1.focus();
	   return false;
	 }  
	 
	if(document.form1.mobile1.value == "")
	 {
	   alert("Fill Mobile Number!");
	   document.form1.mobile1.focus();
	   return false;
	 }  
	 
	if(document.form1.id.value == "")
	 {
	   alert("Fill User Name!");
	   document.form1.id.focus();
	   return false;
	 }      

    if(document.form1.password.value == "")
	 {
	   alert("Fill Password!");
	   document.form1.password.focus();
	   return false;
	 } 
	 
	if(document.form1.password1.value == "")
	 {
	   alert("Fill Confirm Password!");
	   document.form1.password1.focus();
	   return false;
	 } 
	 
	if(document.form1.password1.value != document.form1.password.value)
	 {
	   alert("Please Check your Password !");
	   document.form1.password.focus();
	   return false;
	 }  
	 
	 
	 
	if(document.form1.email.value == "")
	 {
	   alert("Fill E-mail address!");
	   document.form1.email.focus();
	   return false;
	 } 
	 
	 abc = emailValidator(document.form1.email.value);
	 if(abc == false)
	 {
	   alert("Fill valid E-mail address!");
	   document.form1.email.focus();
	   return false;
	 } 
	 
	if(document.form1.bloodGroup.value == "null")
	 {
	   alert("Fill Blood Group!");
	   document.form1.bloodGroup.focus();
	   return false;
	 }
	 
	 if(document.form1.city2.value != ""){
	  abc = checkOnlyAlphabets(document.form1.city2.value);
	 if(abc == false)
	 {
	   alert("Fill valid city!");
	   document.form1.city2.focus();
	   return false;
	 } }
	 
	 if(document.form1.state2.value != ""){
	  abc = checkOnlyAlphabets(document.form1.state2.value);
	 if(abc == false)
	 {
	   alert("Fill valid state!");
	   document.form1.state2.focus();
	   return false;
	 } }
	 
	 if(document.form1.country2.value != ""){
	  abc = checkOnlyAlphabets(document.form1.country2.value);
	 if(abc == false)
	 {
	   alert("Fill valid country!");
	   document.form1.country2.focus();
	   return false;
	 } }
	 
	 if(document.form1.alternateEmail.value != ""){
	 abc = emailValidator(document.form1.alternateEmail.value);
	 if(abc == false)
	 {
	   alert("Fill valid email address!");
	   document.form1.alternateEmail.focus();
	   return false;
	 } }
	 
	 
	 return true;
	} 
	</script>
	<script>
	
	var xmlHttp;	
	function GetXmlHttpObject()
	{
		var xmlHttp=null;
		try
		{
			//Firefox,Opara 8.0+,Safari
			xmlHttp=new XMLHttpRequest();
		}
		catch(e)
		{
		  //Internet Explorer
				try
				{
					xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch(e)
				{
					xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
		}
		return xmlHttp;
	}
	var myflag="false";
	var display="NO";
	function checkLoginId(dis)
	{  
	  
	    display=dis;
	  var idvalue=document.getElementById('id').value;
	   xmlHttp = GetXmlHttpObject();
		if(xmlHttp==null)
		{
			alert("Your Browser does not support AJAX");
			return;
		}
	   
		var url="PatientCheckAvailabilityHandler.jsp";
		url=url+"?id="+idvalue;
		xmlHttp.onreadystatechange = idStateChanged;
		xmlHttp.open("GET",url,false);
		xmlHttp.send(null);
		return myflag;
		
	  
	}
	
function idStateChanged()
{
   if(xmlHttp.readyState==3)
	{
		return;
	}
	if(xmlHttp.readyState==4)
	{  
	    myflag =Trim(xmlHttp.responseText);
	    
	    
		if(myflag == "true"){
		  alert("Sorry! This userName is not available");
		 }else{ 
			 if(display == "YES"){
		 
		   alert("This userName is available"); 
		 }
		 }
		return;
	}
}  

	
	
	
 
  <% if(session.getAttribute("message")!=null){ %> 
     alert('<%=session.getAttribute("message")%>');
		<% 
		session.removeAttribute("message");
       }
		%>  
 
 
 
 
</script>
 	

</head>

<body>

<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
<% if(request.getParameter("flag")==null){
    if(session.getAttribute("userType").toString().equals("kiosk")){   %>
    <td><jsp:include page="KioskMenu.jsp"/></td>
	<%  }else if(session.getAttribute("userType").toString().equals("admin")){    %>
	<td><jsp:include page="AdminMenu.jsp"/></td>
	<%  }}  %>
	
  </tr>
  
<tr height="475px">
    
    <td><center>
      <form name="form1" method="post" onSubmit="return validateForm();" action="PatientHandler.jsp">
        <table width="80%" id="innertable">
          <tr>
            <td colspan="5"><div align="center">
              <h2><strong><span style="color: #0000ff">PATIENT REGISTRATION FORM </span></strong></h2>
            </div></td>
          </tr>
          <tr>
            <td colspan="5"><h3><strong><span class="style1" style="height: 21px">Fill All Information to add a patient </span></strong></h3></td>
          </tr>
          <tr>
            <td colspan="5"><h4><strong><span class="style4">Personal Information </span></strong></h4>
              <p></p></td>
          </tr>
          
          <tr>
            <td width="17%" class="style5">Name*</td>
            <td width="20%" class="style2"><label>
              <input name="name" type="text" id="name" maxlength="50">
            </label></td>
            <td width="17%" class="style6">Fathers Name* </td>
            <td width="26%"><label>
              <input name="fname" type="text" id="fname" maxlength="50">
            </label></td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Date of Birth* </td>
            <td class="style2"><label>
              <input name="dob" type="text" id="dob">
            </label></td>
            <td class="style5">Gender*</td>
            <td><table id="ctl00_ContentPlaceHolder1_rdoGender" cellspacing="0" cellpadding="3" border="0" style="border-collapse:collapse;">
            <tr>
              <td><input id="ctl00_ContentPlaceHolder1_rdoGender_0" type="radio" name="gender" value="Male" checked="checked" />
                <label for="ctl00_ContentPlaceHolder1_rdoGender_0">Male</label></td>
              <td><input id="ctl00_ContentPlaceHolder1_rdoGender_1" type="radio" name="gender" value="Female" />
                <label for="ctl00_ContentPlaceHolder1_rdoGender_1">Female</label></td>
            </tr>
          </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Nationality*</td>
            <td class="style2"><table id="ctl00_ContentPlaceHolder1_rdoNationality" cellpadding="3" border="0">
            <tr>
              <td><input id="nationality" type="radio" name="nationality" value="Indian" checked="checked" />
                <label for="nationality">Indian</label></td>
              <td><input id="nationality1" type="radio" name="nationality" value="Other" />
                <label for="nationality1">Other</label></td>
            </tr>
          </table></td>
            <td class="style6">Qualification*</td>
            <td><label>
              <select name="qualification" id="qualification">
                <option value="null" selected>--Select one--</option>
                <option value="Illiterate">Illiterate</option>
                <option value="Literate">Literate</option>
                <option value="Graduate">Graduate</option>
                <option value="Post Graduate">Post Graduate</option>
                </select>
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Occupation*</td>
            <td class="style2"><label>
              <select name="occupation" id="occupation">
                <option value="null" selected>--Select one--</option>
                <option value="Buisness">Buisness</option>
                <option value="Government Servent">Government Servent</option>
                <option value="Service">Service</option>
                <option value="Student">Student</option>
                <option value="Other">Other</option>
              </select>
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
            <td><label>
                  <input name="checkbox" type="checkbox" value="checkbox" onClick="check();" >
              Check if Permanent address is same </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Address*</td>
            <td class="style2"><label>
              <input name="address1" type="text" id="address1" onKeyUp="writeOn('address1');" maxlength="300">
            </label></td>
            <td class="style6">Address</td>
            <td><label>
              <input name="address2" type="text" id="address2" maxlength="300">
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="23" class="style5">City*</td>
            <td class="style2"><label>
              <input name="city1" type="text" id="city1" onKeyUp="writeOn('city1');" maxlength="30">
            </label></td>
            <td class="style6">City</td>
            <td><label>
              <input name="city2" type="text" id="city2" maxlength="30">
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">State*</td>
            <td class="style2"><label>
              <input name="state1" type="text" id="state1" onKeyUp="writeOn('state1')" maxlength="30">
            </label></td>
            <td class="style6">State</td>
            <td><label>
              <input name="state2" type="text" id="state2" maxlength="30">
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Country*</td>
            <td class="style2"><label>
              <input name="country1" type="text" id="country1" onKeyUp="writeOn('country1')" maxlength="30">
            </label></td>
            <td class="style6">Country</td>
            <td><label>
              <input name="country2" type="text" id="country2" maxlength="30">
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Zip*</td>
            <td class="style2"><label>
            <input name="zip1" type="text" id="zip1" onKeyUp="writeOn('zip1')" maxlength="6" onKeyPress="allowIntegerValueNonNegative(event, this);" />
            </label></td>
            <td class="style6">Zip</td>
            <td><label>
              <input name="zip2" type="text" id="zip2" maxlength="6" onKeyPress="allowIntegerValueNonNegative(event, this);" />
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Phone*</td>
            <td class="style2"><label>
              <input name="landline1" type="text" id="landline1" maxlength="20" onKeyUp="writeOn('landline1')" onKeyPress="allowIntegerValueNonNegative(event, this);" />
            </label></td>
            <td class="style6">Phone </td>
            <td><label>
              <input name="landline2" type="text" id="landline2" maxlength="20" onKeyPress="allowIntegerValueNonNegative(event, this);" />
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style7">Mobile*</td>
            <td class="style8"><label>
              <input name="mobile1" type="text" id="mobile1" onKeyUp="writeOn('mobile1')" maxlength="15" onKeyPress="allowIntegerValueNonNegative(event, this);" />
            </label></td>
            <td class="style9">Mobile</td>
            <td class="style10"><label>
              <input name="mobile2" type="text" id="mobile2" maxlength="15" onKeyPress="allowIntegerValueNonNegative(event, this);" />
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
              <input name="id" type="text" id="id" maxlength="30">
            </label></td>
            <td class="style6"><label>
              <input type="button" name="Check Availability" value="Check Availability" onClick="checkLoginId('YES');" />
            </label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Password*</td>
            <td class="style2"><label>
              <input name="password" type="password" id="password" maxlength="30">
            </label></td>
            <td class="style6">Confirm Password* </td>
            <td><label>
              <input name="password1" type="password" id="password1" maxlength="30">
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
              <input name="email" type="text" id="email" maxlength="30">
            </label></td>
            <td class="style6">Alternate Email </td>
            <td><label>
              <input name="alternateEmail" type="text" id="alternateEmail" maxlength="30">
            </label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style5">Blood Group* </td>
            <td class="style2"><label>
              <select name="bloodGroup" id="bloodGroup">
                <option value="null">--Select one--</option>
                <option value="AB+">AB+</option>
                <option value="O+">O+</option>
                <option value="B+">B+</option>
                <option value="A+">A+</option>
                </select>
            </label></td>
            <td colspan="3">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="5" class="style5"><center><label>
              <input type="submit" name="Submit" style="width:150px;" value="Save">
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
