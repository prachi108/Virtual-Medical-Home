<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="doctor" class="vmh.Doctor" />
<jsp:setProperty name="doctor" property="*"/>

 <%  
	doctor.resetPassword();
    session.setAttribute("message",doctor.getMessage());
	response.sendRedirect("DoctorList.jsp");
 %>