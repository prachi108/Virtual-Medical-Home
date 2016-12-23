<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="complaintReply" class="vmh.ComplaintReply" />
<jsp:setProperty name="complaintReply" property="*"/>

 <% 
    
	complaintReply.insertRecord();
	session.setAttribute("message",complaintReply.getMessage());
	response.sendRedirect("DoctorViewComplaint.jsp?complaintId="+complaintReply.getComplaintId());
 %>