<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory" />
<jsp:setProperty name="patientHistory" property="*"/>

 <% 
	patientHistory.doctorInsertRecord();
	session.setAttribute("message",patientHistory.getMessage());
	response.sendRedirect("DoctorViewSymptomsList.jsp?doctorId="+session.getAttribute("id"));
 
 %>