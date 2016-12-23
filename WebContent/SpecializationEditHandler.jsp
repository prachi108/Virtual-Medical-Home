<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="specialization" class="vmh.Specialization" />
<jsp:setProperty name="specialization" property="*"/>

 <%  
	specialization.updateRecord();
    session.setAttribute("message",specialization.getMessage());
	response.sendRedirect("SpecializationList.jsp");
 
 %>