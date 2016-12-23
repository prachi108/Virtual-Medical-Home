<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="complaint" class="vmh.Complaint" />
<jsp:setProperty name="complaint" property="*"/>

 <% 
    
	complaint.insertResult();
	session.setAttribute("message",complaint.getMessage());
	response.sendRedirect("AdminViewComplaint.jsp?complaintId="+complaint.getComplaintId());
 %>