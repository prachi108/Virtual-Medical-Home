<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="feedback" class="vmh.Feedback" />
<jsp:setProperty name="feedback" property="*"/>

 <% 
    String str = session.getAttribute("id").toString();
    feedback.setPatientId(str);
	feedback.patientInsertRecord();
	session.setAttribute("message",feedback.getMessage());
	response.sendRedirect("PatientFeedback.jsp");
 %>