<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="doctor" class="vmh.Doctor" />
<jsp:setProperty name="doctor" property="id"/>

 <%  
 
   String idvalue=request.getParameter("id");
   boolean yes=doctor.checkAvailability(idvalue);
   if(yes){
   response.getWriter().write("true");
   
   }else{
   response.getWriter().write("false");
   
   }
   
 %>