<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="appointment" class="vmh.Appointment" />
<jsp:setProperty name="appointment" property="*"/>

 <% 
    String str = session.getAttribute("id").toString();
    appointment.setPatientId(str);
	appointment.patientInsertRecord();
	session.setAttribute("message",appointment.getMessage());
	response.sendRedirect("PatientTakeAppointment.jsp");
 
 %>