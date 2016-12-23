<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="kiosk" class="vmh.Kiosk" />
<jsp:setProperty name="kiosk" property="id"/>

 <%  
 
   String idvalue=request.getParameter("id");
   boolean yes=kiosk.checkAvailability(idvalue);
   if(yes){
   response.getWriter().write("true");
   
   }else{
   response.getWriter().write("false");
   
   }
   
 %>