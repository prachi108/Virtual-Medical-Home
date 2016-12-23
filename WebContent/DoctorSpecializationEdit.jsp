<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>
	
<jsp:useBean id="doctor" class="vmh.Doctor"/>
<jsp:useBean id="specialization" class="vmh.Specialization"/>
<jsp:setProperty name="doctor" property="id"/>
<head>
<title>Doctor Specialization Edit</title>

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

</head>
<body>
<table width="100%" height="625px">
  <tr height="50px">
    <td colspan="2"><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr height="50px">
    <td colspan="2"><jsp:include page="AdminMenu.jsp"/></td>
  </tr>
  
  <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td colspan="3" align="center" style="color:#CC0000"><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	
  
  <tr>
    <td width="60%" style=" height:400px;">
	<div  style="overflow:auto; height:100px; width:500px; background-color:#FFC; " align="center">
	  <table align="center" width="80%">
        <tr>
          <td>Sno.</td>
          <td>Specialization</td>
          <td>Action</td>
        </tr>
		 <%
	  ArrayList list = doctor.getSpecializationList();
	  if(list!=null && list.size()>0){
		for(int i=0;i<list.size();i++){
	  %>
        <tr>
          <td><%=i+1%></td>
          <td><%=list.get(i)%></td>
          <td><a href="DoctorSpecializationDeleteHandler.jsp?id=<%=doctor.getId()%>&specializationName=<%=list.get(i)%>">Delete </a></td>
        </tr>
		 <%}
	  }else{
	  %>
	  <tr>
        <td colspan="4">Record Not Found</td>
      </tr>
	  <%
	  }
	  %>
      </table></div>	</td>
	
	
    <td width="40%"><form action="DoctorSpecializationAddHandler.jsp?id=<%=doctor.getId()%>" method="post">
	  <table align="center" width="80%">
        <tr height="150px" align="center">
          <td>
		  <select name="specializationName" id="specializationName">
	<%
	  ArrayList list1=specialization.getSpecializationList();
	  if(list1!=null && list1.size()>0){
	  	ArrayList specializationNameList=(ArrayList)list1.get(0);
		for(int i=0;i<specializationNameList.size();i++){
		
	  %>
      
        <%=i+1%>
        <option value="<%=specializationNameList.get(i)%>"><%=specializationNameList.get(i)%></option>
	
	   <%}
	  } %>
	
	</select>
		  </td>
        </tr>
        
        <tr height="50px" align="center">
		<% if(list1 == null){  %>
          <td><input name="Add" type="submit" id="Add" value="Add" disabled="disabled"></td>
		<%  }else{   %>
		  <td><input name="Add" type="submit" id="Add" value="Add"></td>
		<%  }  %>    
        </tr>
      </table>
	</form></td>
  </tr>
  <tr>
    <td colspan="2" height="50px" align="center"><input name="Close" type="button" id="Close" value="Close"  onClick="window.location.href='DoctorList.jsp'" ></td>
  </tr>
  <tr>
    <td colspan="2" height="50px"><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>
