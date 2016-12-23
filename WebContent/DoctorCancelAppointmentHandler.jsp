<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="appointment" class="vmh.Appointment" />
<jsp:setProperty name="appointment" property="*"/>

 <% 
  
	appointment.doctorCancelRecord();
	session.setAttribute("message",appointment.getMessage());
	String str = "DoctorAppointmentList.jsp?doctorId="+session.getAttribute("id")+"&appointmentStatus="+appointment.getAppointmentStatus();
	response.sendRedirect(str);
     
 %>