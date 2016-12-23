<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="specialization" class="vmh.Specialization" />
<jsp:useBean id="doctor" class="vmh.Doctor" />
<jsp:setProperty name="specialization" property="specializationName"/>
<jsp:setProperty name="doctor" property="id"/>
	
 <%  
	specialization.deleteDoctorSpecialization(doctor.getId());
	session.setAttribute("message",specialization.getMessage());
	String str = "DoctorSpecializationEdit.jsp?id="+doctor.getId();
	response.sendRedirect(str);
 
 %>