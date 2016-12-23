<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="feedback" class="vmh.Feedback" />
<jsp:setProperty name="feedback" property="*"/>

 <% 
    feedback.patientId(feedback.getPatientName());
	feedback.patientInsertRecord();
	session.setAttribute("message",feedback.getMessage());
	response.sendRedirect("KioskFeedback.jsp");
 %>