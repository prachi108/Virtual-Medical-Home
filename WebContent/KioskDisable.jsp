<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="kiosk" class="vmh.Kiosk"/>
<jsp:setProperty name="kiosk" property="id"/>
<jsp:setProperty name="kiosk" property="status"/>

<%  
	kiosk.changeStatus();
    session.setAttribute("message",kiosk.getMessage());
	response.sendRedirect("KioskList.jsp");
 %>