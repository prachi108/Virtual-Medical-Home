<%@ page import = "java.util.*,java.sql.*" language="java" contentType="text/html; charset=UTF-8" errorPage="ErrorPage.jsp" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="specialization" class="vmh.Specialization"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>		

<head>
<title>Specialization List</title>

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
    <td><jsp:include page="AdminMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td align="center">  <div  style="overflow:auto; height:300px; width:800px; background-color:#FFC;"><table width="400" align="center">
      <tr>
        <td colspan="4" style="color:#660033"><center>Specialization List</center></td>
        </tr>
	  <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td colspan="4" align="center" style="color:#F00; font:Verdana, Geneva, sans-serif"><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	
		
      <tr>
        <td height="30" style="color:#990000">Sno</td>
        <td style="color:#990000">Name</td>
        <td style="color:#990000">Descp</td>
        <td style="color:#990000">Action</td>
      </tr>
	  <%
	  ArrayList list=specialization.getSpecializationList();
	  if(list!=null && list.size()>0){
	  	ArrayList specializationNameList=(ArrayList)list.get(0);
		ArrayList descriptionList =(ArrayList)list.get(1);
		for(int i=0;i<specializationNameList.size();i++){
		
	  %>
      <tr>
        <td><%=i+1%></td>
        <td><%=specializationNameList.get(i)%></td>
        <td><%=descriptionList.get(i)%></td>
        <td><a href="SpecializationEdit.jsp?specializationName=<%=specializationNameList.get(i)%>">Edit </a>| 
        <a href="SpecializationDeleteHandler.jsp?specializationName=<%=specializationNameList.get(i)%>">Delete</a></td>
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
    </table></div></td>
  </tr>
  
  <tr height="50px">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
  
  </table>

</body>
</html>
