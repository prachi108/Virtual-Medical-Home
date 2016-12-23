<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="ErrorPage.jsp" import="java.sql.*"%>

 <% 
	 session.invalidate();
	 response.sendRedirect("Index.jsp");
 %>