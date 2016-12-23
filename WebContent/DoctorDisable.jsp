<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="doctor" class="vmh.Doctor"/>
<jsp:setProperty name="doctor" property="id"/>
<jsp:setProperty name="doctor" property="status"/>

<%  
	doctor.changeStatus();
    session.setAttribute("message",doctor.getMessage());
	response.sendRedirect("DoctorList.jsp");
 %>