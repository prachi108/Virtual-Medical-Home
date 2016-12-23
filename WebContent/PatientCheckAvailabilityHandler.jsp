<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="patient" class="vmh.Patient" />
<jsp:setProperty name="patient" property="id"/>

 <%  
 
   String idvalue=request.getParameter("id");
   boolean yes=patient.checkAvailability(idvalue);
   if(yes){
   response.getWriter().write("true");
   
   }else{
   response.getWriter().write("false");
   
   }
   
 %>