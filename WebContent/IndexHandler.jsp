<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="index" class="vmh.Index" />
<jsp:setProperty name="index" property="*"/>

 
<%!	 boolean flag = false;   %>
<% 	 
	 flag = index.checkRecord();
	 if(flag == false)
	  {	 
	     session.setAttribute("message",index.getMessage());
	     response.sendRedirect("Index.jsp");
	  }
	 else
	  {
		 session.setAttribute("id",index.getId());
		 session.setAttribute("userType",index.getUserType());
		 session.setAttribute("lastLoginDate",index.getLastLoginDate());
		 index.lastLoginDate();
	    String str = index.getUserType().substring(0,1).toUpperCase()+index.getUserType().substring(1,index.getUserType().length()).toLowerCase()+"Home.jsp";
		response.sendRedirect(str);
	  }	 	 
 
 %>