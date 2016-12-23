<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="complaint" class="vmh.Complaint" />
<jsp:setProperty name="complaint" property="*"/>

 <% 
    String str = session.getAttribute("id").toString();
    complaint.setSenderId(str);
	complaint.receiverId();
	complaint.insertRecord();
	session.setAttribute("message",complaint.getMessage());
	response.sendRedirect("DoctorMakeComplaint.jsp");
 %>