<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="admin" class="vmh.Admin" />
<jsp:setProperty name="admin" property="*"/>

 <%  
	admin.updateRecord();
    session.setAttribute("message",admin.getMessage());
	response.sendRedirect("AdminList.jsp");
 %>