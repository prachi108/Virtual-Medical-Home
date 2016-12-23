package vmh;

import java.sql.*; 
import java.text.SimpleDateFormat;
import java.util.*;

public class ComplaintReply {

 private int replyId;
 private String senderId;
 private String receiverId;
 private int complaintId;
 private String replyDetail;
 private java.util.Date replyDate;
 private String message;
 private String receiverName;

 
 
 public int getReplyId() {
	return replyId;
}
public void setReplyId(int replyId) {
	this.replyId = replyId;
}
public String getSenderId() {
	return senderId;
}
public void setSenderId(String senderId) {
	this.senderId = senderId;
}
public String getReceiverId() {
	return receiverId;
}
public void setReceiverId(String receiverId) {
	this.receiverId = receiverId;
}
public int getComplaintId() {
	return complaintId;
}
public void setComplaintId(int complaintId) {
	this.complaintId = complaintId;
}
public String getReplyDetail() {
	return replyDetail;
}
public void setReplyDetail(String replyDetail) {
	this.replyDetail = replyDetail;
}
public java.util.Date getReplyDate() {
	return replyDate;
}
public void setReplyDate(java.util.Date replyDate) {
	this.replyDate = replyDate;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getReceiverName() {
	return receiverName;
}
public void setReceiverName(String receiverName) {
	this.receiverName = receiverName;
}
 
 
public ArrayList getComplaintReplyList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList complaintIdList=new ArrayList();
	ArrayList replyDateList =new ArrayList();
	ArrayList senderIdList =new ArrayList();
	ArrayList replyDetailList =new ArrayList();
		
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT complaintId,replyDate,senderId," +
		 		"replyDetail FROM complaintReply where receiverId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.receiverId);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			complaintIdList.add(rset1.getString("complaintId"));
			replyDateList.add(rset1.getString("replyDate"));
			senderIdList.add(rset1.getString("senderId"));
			replyDetailList.add(rset1.getString("replyDetail"));
		}
		if(complaintIdList!=null && complaintIdList.size()>0){
			list.add(complaintIdList);
			list.add(replyDateList);
			list.add(senderIdList);
			list.add(replyDetailList);
			
		}
				
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While displaying Record !";
	}finally{
		try{
			if(rset1!=null)rset1.close();
			if(pstmt1!=null)pstmt1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	return list;	
	
	
}
	
	
	
public ArrayList getSenderList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	String sql;
	
	
	try{
		 conn=DBConnection.getConnection();
		   sql="SELECT name FROM patient_profile order by name";
		pstmt1=conn.prepareStatement(sql);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			list.add(rset1.getString("name"));
		}
				
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While displaying Record !";
	}finally{
		try{
			if(rset1!=null)rset1.close();
			if(pstmt1!=null)pstmt1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	return list;	
	
}	
	
	
	
	
public void receiverId(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	String sql=null;
	try{
		 conn=DBConnection.getConnection();
		 sql="SELECT id FROM patient_profile where name=?";
		 
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.receiverName);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.receiverId = rset1.getString("id");
		}
				
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While displaying Record !";
	}finally{
		try{
			if(rset1!=null)rset1.close();
			if(pstmt1!=null)pstmt1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}	
	
	

public void insertRecord(){
	
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	ResultSet rset1 = null;
	int id;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected1 = -1;
		 
		 String sql="SELECT MAX(complaintId) FROM complaintReply";
			pstmt1=conn.prepareStatement(sql);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				id = rset1.getInt(1);
			}
			else{
				message = "Sorry! Request not sent";
				return;
			}
			
			
		    id++;
		    
		    pstmt2=conn.prepareStatement("insert into complaintReply(replyId,complaintId,senderId,receiverId," +
		    		"replyDate,replyDetail) values(?,?,?,?,?,?)");
		    
		    pstmt2.setInt(1,id);
		    pstmt2.setInt(2,this.complaintId);
		    pstmt2.setString(3,this.senderId);
		    pstmt2.setString(4,this.receiverId);
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt2.setDate(5,regdate);
		    pstmt2.setString(6,this.replyDetail);
		    
		    int rowAffected2 = pstmt2.executeUpdate();
		    
		    pstmt3=conn.prepareStatement("update complaint set status = ? where complaintId = ?");
		    
		    pstmt3.setString(1,"open");
		    pstmt3.setInt(2,this.complaintId);
		    int rowAffected3 = pstmt3.executeUpdate();
		    
		    if(rowAffected2>0 && rowAffected3>0){
			    message="Reply sent Successfully !";
		    }
		    else{
		    	message="Sorry! Reply not sent";
		    }
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While adding Record !";
	}finally{
		try{
			if(pstmt1!=null)pstmt1.close();
			if(pstmt2!=null)pstmt2.close();
			if(pstmt3!=null)pstmt3.close();
			if(rset1!=null)rset1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}




public ArrayList viewAllReply(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rset1=null;
	ResultSet rset2=null;
	ArrayList list=new ArrayList();
	ArrayList senderIdList =new ArrayList();
	ArrayList receiverIdList=new ArrayList();
	ArrayList replyDetailList =new ArrayList();
	ArrayList replyDateList =new ArrayList();	
		
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT senderId,receiverId,replyDetail,replyDate FROM complaintReply where complaintId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setInt(1,this.complaintId);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			senderIdList.add(rset1.getString("senderId"));
			receiverIdList.add(rset1.getString("receiverId"));
			replyDetailList.add(rset1.getString("replyDetail"));
			replyDateList.add(rset1.getString("replyDate"));
		}
		
		sql="SELECT senderId,receiverId,result,status,complaintDate FROM complaint where complaintId=?";
		pstmt2=conn.prepareStatement(sql);
		pstmt2.setInt(1,this.complaintId);
		rset2=pstmt2.executeQuery();
		if(rset2.next() && rset2.getString("status").equals("close")){
			senderIdList.add(rset2.getString("receiverId"));
			receiverIdList.add(rset2.getString("senderId"));
			replyDetailList.add(rset2.getString("result"));
			replyDateList.add(rset2.getString("complaintDate"));
		}
		
		if(receiverIdList!=null && receiverIdList.size()>0){
			list.add(receiverIdList);
			list.add(replyDetailList);
			list.add(replyDateList);
			list.add(senderIdList);
			
		}
		
		
		
		
				
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While displaying Record !";
	}finally{
		try{
			if(rset1!=null)rset1.close();
			if(rset2!=null)rset1.close();
			if(pstmt1!=null)pstmt1.close();
			if(pstmt2!=null)pstmt1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	return list;	
	
}







	
}
