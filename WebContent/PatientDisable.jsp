<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="patient" class="vmh.Patient"/>
<jsp:setProperty name="patient" property="id"/>
<jsp:setProperty name="patient" property="status"/>

<%  
	patient.changeStatus();
    session.setAttribute("message",patient.getMessage());
	response.sendRedirect("PatientList.jsp");
 %>
 