<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="kiosk" class="vmh.Kiosk" />
<jsp:setProperty name="kiosk" property="*"/>

 <% 
	 kiosk.insertRecord();
	 session.setAttribute("message",kiosk.getMessage());
	 response.sendRedirect("KioskAdd.jsp");
 %>