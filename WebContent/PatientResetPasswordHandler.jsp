<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="patient" class="vmh.Patient" />
<jsp:setProperty name="patient" property="*"/>

 <%  
	patient.resetPassword();
    session.setAttribute("message",patient.getMessage());
	response.sendRedirect("PatientList.jsp");
 %>