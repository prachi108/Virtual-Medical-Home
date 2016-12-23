<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="complaint" class="vmh.Complaint" />
<jsp:setProperty name="complaint" property="*"/>

 <% 
    complaint.senderId();
	complaint.receiverId();
	complaint.insertRecord();
	session.setAttribute("message",complaint.getMessage());
	response.sendRedirect("KioskMakeComplaint.jsp");
 %>