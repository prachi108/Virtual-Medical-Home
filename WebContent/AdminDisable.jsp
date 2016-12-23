<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="admin" class="vmh.Admin"/>
<jsp:setProperty name="admin" property="id"/>
<jsp:setProperty name="admin" property="status"/>

<%  
	admin.changeStatus();
    session.setAttribute("message",admin.getMessage());
	response.sendRedirect("AdminList.jsp");
 %>