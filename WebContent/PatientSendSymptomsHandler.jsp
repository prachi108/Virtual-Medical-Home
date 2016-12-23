<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="patientHistory" class="vmh.PatientHistory" />
<jsp:setProperty name="patientHistory" property="*"/>

 <% 
    String str = session.getAttribute("id").toString();
    patientHistory.setPatientId(str);
	patientHistory.patientInsertRecord();
	session.setAttribute("message",patientHistory.getMessage());
	response.sendRedirect("PatientSendSymptomsList.jsp?patientId="+session.getAttribute("id"));
 
 %>