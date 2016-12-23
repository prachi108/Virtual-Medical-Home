<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory" />
<jsp:setProperty name="patientHistory" property="*"/>

 <% 
 
	patientHistory.patientInsertRecord();
	session.setAttribute("message",patientHistory.getMessage());
	response.sendRedirect("KioskSendSymptomsList.jsp?patientName="+patientHistory.getPatientName());
 
 %>