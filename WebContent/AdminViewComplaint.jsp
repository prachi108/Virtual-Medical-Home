<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="ErrorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="complaint" class="vmh.Complaint"/>
<jsp:useBean id="complaintReply" class="vmh.ComplaintReply"/>
<jsp:setProperty name="complaint" property="complaintId"/>
<jsp:setProperty name="complaintReply" property="complaintId"/>

<% if(session.getAttribute("userType")==null || session.getAttribute("id")==null){    %>
<jsp:forward page="Index.jsp" />
<%	}   %>

<%
complaint.viewComplaintDetail();
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Complaint</title>
<style type="text/css">
.style4 {            color: #990033;
            font-size: 14px;
            width: 173px;
}
</style>
 <%
   String userType=(String)session.getAttribute("userType");
   if(userType.equals("admin"))
   {
  %>
 <link rel="stylesheet" type="text/css" href="css/admin.css" />
  <%
  }else if(userType.equals("kiosk"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/kiosk.css" />
  <%
  }else if(userType.equals("patient"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
  <%
  }else if(userType.equals("doctor"))
  {
  %>
  <link rel="stylesheet" type="text/css" href="css/doctor.css" />
  <%
  }
  %>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />

<script>
 function showReplyTable()
 {
 	if(document.getElementById('replyTable').style.display=='none')
	{
	  document.getElementById('replyTable').style.display='block';
	}
 }
  function hideReplyTable()
 {
 	if(document.getElementById('replyTable').style.display=='block')
	{
	  document.getElementById('replyTable').style.display='none';
	}
	
 }

 function showFinalReplyTable()
 {
 	if(document.getElementById('finalReplyTable').style.display=='none')
	{
	  document.getElementById('finalReplyTable').style.display='block';
	}
 }
  function hideFinalReplyTable()
 {
 	if(document.getElementById('finalReplyTable').style.display=='block')
	{
	  document.getElementById('finalReplyTable').style.display='none';
	}
	
 }
 function showAllReplyTable()
 {

 	if(document.getElementById('viewAllReplyTable').style.display=='none')
	{  document.getElementById('ViewAllReply').value="Hide All Reply";
	  document.getElementById('viewAllReplyTable').style.display='block';
	}else{
	document.getElementById('ViewAllReply').value="View All Reply";
 	  document.getElementById('viewAllReplyTable').style.display='none';
	}
	
	
	
 }
 
</script>
</head>

<body style="height:100%">
<table width="100%" align="center" border="1">
  <tr>
    <td><jsp:include page="Header.jsp"></jsp:include></td>
  </tr>
  
  <tr>
    <td><jsp:include page="AdminMenu.jsp"></jsp:include></td>
  </tr>
  
  <tr align="center"  height="450px">
    <td><div style="overflow:auto; height:450px; "><table width="95%" height="215">
      <tr>
        <th width="951" scope="col">View Complaints</th>
        </tr>
		<%
		if(session.getAttribute("message")!=null)
		{
		%>
        <tr align="center">
          <td style="color:#CC0000"><%=session.getAttribute("message")%></td>
        </tr>
        <%
		  session.removeAttribute("message");
		}
		 %>
		 
	<tr align="left">
          <td ><table width="100%" >
            <tr>
              <td width="24%" style="color:#CC0000">ComplaintId</td>
              <td width="17%"><%=complaint.getComplaintId()%></td>
              <td width="17%" style="color:#CC0000">Date</td>
              <td width="42%"><%=complaint.getComplaintDate()%></td>
            </tr>
            <tr>
              <td style="color:#CC0000">ComplaintBy</td>
              <td><%=complaint.getSenderId()%></td>
              <td style="color:#CC0000">To</td>
              <td><%=complaint.getReceiverId()%></td>
            </tr>
            <tr>
              <td style="color:#CC0000">Status</td>
              <td><%=complaint.getStatus()%></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td style="color:#CC0000">Subject</td>
              <td><%=complaint.getSubject()%></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td style="color:#CC0000">Description</td>
              <td><%=complaint.getDescription()%></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>
			   <%  if(complaint.getStatus().equals("close")){    %>
                <input type="button" name="ViewAllReply"  id="ViewAllReply"value="View All Reply"  onclick="showAllReplyTable();"/>  
				<%  }else if(!(complaint.getReceiverId().equals(session.getAttribute("id")))) {    %> 
                <input type="button" name="ViewAllReply"  id="ViewAllReply"value="View All Reply"  onclick="showAllReplyTable();"/>
				<%   }else{     %>
				<input type="button" name="Reply" value="Reply"  onclick="showReplyTable();"/>
                <input type="button" name="ViewAllReply"  id="ViewAllReply"value="View All Reply"  onclick="showAllReplyTable();"/>
                <input type="button" name="ViewAllReply2"  id="ViewAllReply2"value="Final Reply"  onclick="showFinalReplyTable();"/>     
				<%       }      %>       
			  </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4"><form id="form1" name="form1" method="post" action="AdminViewComplaintHandler.jsp">
                <table  id="replyTable" width="100%" style="display:none">
                  <tr>
                    <td width="15%">Reply Detail 
                      <input name="complaintId" type="hidden" id="complaintId"  value="<%=complaint.getComplaintId()%>"/>
                      <input name="receiverId" type="hidden" id="receiverId"  value="<%=complaint.getSenderId()%>"/>
                      <input name="senderId" type="hidden" id="senderId"  value="<%=session.getAttribute("id")%>"/></td>
                    <td width="85%"><label>
                      <textarea name="replyDetail" cols="100" rows="3" id="replyDetail"></textarea>
                    </label></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>
                      <input type="submit" name="Submit3" value="Send" />
                      <input type="button" name="Close" value="Close" onclick="hideReplyTable();" />                  
					 </td>
                  </tr>
                </table>
                            </form>              </td>
              </tr>
			  <tr align="center">
		  <td colspan="4" style="color:#CC0000"><form id="form2" name="form2" method="post" action="AdminViewComplaintFinalReplyHandler.jsp">
                <table  id="finalReplyTable" width="100%" style="display:none">
                  <tr>
                    <td width="15%">Final Reply Detail 
                      <input name="complaintId" type="hidden" id="complaintId"  value="<%=complaint.getComplaintId()%>"/>
                     </td>
                    <td width="85%"><label>
                      <textarea name="result" cols="100" rows="3" id="result"></textarea>
                    </label></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>
                      <input type="submit" name="Submit3" value="Send" />
                      <input type="button" name="Close" value="Close" onclick="hideFinalReplyTable();" />                   </td>
                  </tr>
                </table>
                            </form>    </td>
		  </tr>
            <tr>
              <td colspan="4">
			   <div  id="viewAllReplyTable" style="height:200px;width:900px; overflow:auto;background-color:#FFC;display:none;">
			  <table   width="100%">
                <tr>
                  <td>SendBy</td>
                  <td>ReceivedBy</td>
                  <td>ReplyDetail</td>
                  <td>ReplyDate</td>
                </tr>
				
				<%
				  ArrayList list=complaintReply.viewAllReply();
				  if(list!=null && list.size()>0)
				  {
				    ArrayList receiverList=(ArrayList)list.get(0);
					ArrayList replyDetailList=(ArrayList)list.get(1);
					ArrayList replyDateList=(ArrayList)list.get(2);
					ArrayList senderList=(ArrayList)list.get(3);
					for(int i=0;i<receiverList.size();i++)
					{
				
				%>
                <tr>
                  <td><%=senderList.get(i)%></td>
                  <td><%=receiverList.get(i)%></td>
                  <td><%=replyDetailList.get(i)%></td>
                  <td><%=replyDateList.get(i)%></td>
                </tr>
				<%
					}
				}else{	   %>
				
		<tr>
        <td>No Reply found</td>
        </tr>
	    <%     }          %>
              </table></div></td>
              </tr>
          </table></td>
        </tr>
		
		<tr align="center">
          <td height="71" style="color:#CC0000">&nbsp;</td>
		</tr>
	  
    </table>
    </div></td>
  </tr>
  <tr>
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>