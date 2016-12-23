<%@ page import = "java.util.*,java.sql.*" language="java" errorPage="ErrorPage.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="kiosk" class="vmh.Kiosk"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<head>
<title>Kiosk List</title>

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

<body style="height:100%">
<table width="100%" height="625px" border="1">

<tr height="50px">
    <td><jsp:include page="Header.jsp"/></td>
  </tr>
  
<tr height="50px">
    <td><jsp:include page="AdminMenu.jsp"/></td>
  </tr>

<tr height="475px">
    <td><div style="overflow:auto; height:400px; "><table width="1200" align="center">
      <tr>
        <td colspan="7"><center>
          <h3><strong>Kiosk List          </strong>
            </h3>
        </center></td>
        </tr>
	  <% if(session.getAttribute("message")!= null){ %> 
		<tr>
          <td colspan="7" align="center" style="color:#CC0000"><%=session.getAttribute("message")%></td>
        </tr>
		<%
		session.removeAttribute("message");
       }
		%>  	
		
      <tr style="color:White;background-color:#999999;font-weight:bold;">
        <td height="30">Sno</td>
        <td>User Name</td>
        <td>Name</td>
        <td>Gender</td>
		<td>City</td>
		<td>Blood Group</td>
		<td>Action</td>
      </tr>
	  <%
	     
	  ArrayList list = kiosk.getKioskList();
	  if(list!=null && list.size()>0){
	  	ArrayList userNameList=(ArrayList)list.get(0);
		ArrayList nameList =(ArrayList)list.get(1);
		ArrayList genderList =(ArrayList)list.get(2);
		ArrayList cityList =(ArrayList)list.get(3);
		ArrayList bloodGroupList =(ArrayList)list.get(4);
		ArrayList statusList =(ArrayList)list.get(5);
		for(int i=0;i<userNameList.size();i++){
		
	  %>
      <tr bgcolor=<%=i%2==0?"#FFFBF0":"#CCCCFF"%>>
        <td><%=i+1%></td>
        <td><%=userNameList.get(i)%></td>
        <td><%=nameList.get(i)%></td>
		<td><%=genderList.get(i)%></td>
		<td><%=cityList.get(i)%></td>
		<td><%=bloodGroupList.get(i)%></td>
        <td style="width:300px;"><a href="KioskEdit.jsp?id=<%=userNameList.get(i)%>">Edit </a>| 
        <a href="KioskView.jsp?id=<%=userNameList.get(i)%>">View</a>|
		<a href="KioskDisable.jsp?id=<%=userNameList.get(i)%>&status=<%=statusList.get(i)%>"><%=statusList.get(i)%></a>|
		<a href="KioskResetPassword.jsp?id=<%=userNameList.get(i)%>">Reset Password</a>		
		</td>
      </tr>
	  <%}
	  }else{
	  %>
	  <tr>
        <td colspan="7">Record Not Found</td>
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
