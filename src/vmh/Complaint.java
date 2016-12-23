package vmh;

import java.sql.*;  
import java.text.SimpleDateFormat;
import java.util.*;

public class Complaint {

	private int complaintId;
	private String senderId;
	private String receiverId;
	private java.util.Date complaintDate;
	private String subject;
	private String description;
	private String status;
	private String result;
	private String userType = "0";
	private String userType1 = "0";
    private String message;
	private String receiverName;
	private String senderName;
	
	
	
	
	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
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

	public java.util.Date getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(java.util.Date complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserType1() {
		return userType1;
	}

	public void setUserType1(String userType1) {
		this.userType1 = userType1;
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

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
	public ArrayList getRecieverList(){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		ArrayList list=new ArrayList();
		String sql;
		
		if(this.userType.equals("0")){
			list = null;
			return list;
		}
		
		try{
			 conn=DBConnection.getConnection();
			 if(this.userType.equals("doctor"))
			   sql="SELECT name FROM doctor_profile order by name";
			 else 
			   sql="SELECT name FROM admin_profile order by name"; 
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
			 if(this.getUserType().equals("doctor")){
			 sql="SELECT id FROM doctor_profile where name=?";
			 }else if(this.getUserType().equals("admin")){
				 sql="SELECT id FROM admin_profile where name=?";
			 }
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
	
	
	
public void senderId(){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		String sql=null;
		try{
			 conn=DBConnection.getConnection();
			 sql="SELECT id FROM patient_profile where name=?";
			
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,this.senderName);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.senderId = rset1.getString("id");
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
	ResultSet rset1 = null;
	int id;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected2 = -1;
		 
		 String sql="SELECT MAX(complaintId) FROM complaint";
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
		    
		    pstmt2=conn.prepareStatement("insert into complaint(complaintId,senderId,receiverId," +
		    		"complaintDate," +
		    		"subject,description,status) values(?,?,?,?,?,?,?)");
		    
		    pstmt2.setInt(1,id);
		    pstmt2.setString(2,this.senderId);
		    pstmt2.setString(3,this.receiverId);
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt2.setDate(4,regdate);
		    pstmt2.setString(5,this.subject);
		    pstmt2.setString(6,this.description);
		    pstmt2.setString(7,"pending");
		    
		    rowAffected2 = pstmt2.executeUpdate();
		    
		    if(rowAffected2>0){
			    message="Request sent Successfully !";
		    }
		    else{
		    	message="Sorry! Request not sent";
		    }
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While adding Record !";
	}finally{
		try{
			if(pstmt1!=null)pstmt1.close();
			if(pstmt2!=null)pstmt2.close();
			if(rset1!=null)rset1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
	
	
	
 public ArrayList getAdminComplaintList(){
	 
	 Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		ArrayList list=new ArrayList();
		ArrayList complaintIdList=new ArrayList();
		ArrayList senderIdList=new ArrayList();
		ArrayList receiverIdList=new ArrayList();
		ArrayList subjectList =new ArrayList();
		ArrayList descriptionList =new ArrayList();
		ArrayList complaintDateList =new ArrayList();
		ArrayList statusList =new ArrayList();
		try{
			 String sql;
			 conn=DBConnection.getConnection();
			 if(this.getStatus().equals("all")){
			 sql="SELECT complaintId,senderId,receiverId,subject,description,complaintDate,status" +
			 		" FROM complaint";
			 pstmt1=conn.prepareStatement(sql);
			 }else{
			 sql="SELECT complaintId,senderId,receiverId,subject,description,complaintDate,status" +
					 		" FROM complaint where status=?";
			 pstmt1=conn.prepareStatement(sql);
				pstmt1.setString(1,this.status);
			 }	 
			
			rset1=pstmt1.executeQuery();
			while(rset1.next()){
				complaintIdList.add(rset1.getString("complaintId"));
				senderIdList.add(rset1.getString("senderId"));
				receiverIdList.add(rset1.getString("receiverId"));
				subjectList.add(rset1.getString("subject"));
				descriptionList.add(rset1.getString("description"));
				complaintDateList.add(rset1.getString("complaintDate"));
				statusList.add(rset1.getString("status"));
				
			}
			if(complaintIdList!=null && complaintIdList.size()>0){
				list.add(complaintIdList);
				list.add(senderIdList);
				list.add(receiverIdList);
				list.add(subjectList);
				list.add(descriptionList);
				list.add(complaintDateList);
				list.add(statusList);
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
	

 
 
public ArrayList getDoctorComplaintList(){
	 
	 Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		ArrayList list=new ArrayList();
		ArrayList complaintIdList=new ArrayList();
		ArrayList senderIdList=new ArrayList();
		ArrayList receiverIdList=new ArrayList();
		ArrayList subjectList =new ArrayList();
		ArrayList descriptionList =new ArrayList();
		ArrayList complaintDateList =new ArrayList();
		ArrayList statusList =new ArrayList();
		try{
			 String sql;
			 conn=DBConnection.getConnection();
			 if(this.getStatus().equals("all")){
			 sql="SELECT complaintId,senderId,receiverId,subject,description,complaintDate,status" +
			 		" FROM complaint where receiverId=?";
			 pstmt1=conn.prepareStatement(sql);
			 pstmt1.setString(1,this.receiverId);
			 }else{
			 sql="SELECT complaintId,senderId,receiverId,subject,description,complaintDate,status" +
					 		" FROM complaint where status=? AND receiverId=?";
			 pstmt1=conn.prepareStatement(sql);
				pstmt1.setString(1,this.status);
				pstmt1.setString(2,this.receiverId);
			 }	 
			
			rset1=pstmt1.executeQuery();
			while(rset1.next()){
				complaintIdList.add(rset1.getString("complaintId"));
				senderIdList.add(rset1.getString("senderId"));
				receiverIdList.add(rset1.getString("receiverId"));
				subjectList.add(rset1.getString("subject"));
				descriptionList.add(rset1.getString("description"));
				complaintDateList.add(rset1.getString("complaintDate"));
				statusList.add(rset1.getString("status"));
				
			}
			if(complaintIdList!=null && complaintIdList.size()>0){
				list.add(complaintIdList);
				list.add(senderIdList);
				list.add(receiverIdList);
				list.add(subjectList);
				list.add(descriptionList);
				list.add(complaintDateList);
				list.add(statusList);
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
	
	
	public void viewComplaintDetail(){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT senderId,receiverId,subject,description,complaintDate,status" +
				 		" FROM complaint where complaintId=?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setInt(1,this.complaintId);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.setSenderId(rset1.getString("senderId"));
				this.setReceiverId(rset1.getString("receiverId"));
				this.setSubject(rset1.getString("subject"));
				this.setDescription(rset1.getString("description"));
				this.setComplaintDate(rset1.getDate("complaintDate"));
				this.setStatus(rset1.getString("status"));
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
	
	
	
	
  public void insertResult(){
	  
	  Connection conn=null;
		PreparedStatement pstmt1 = null;
		try{
			 conn=DBConnection.getConnection();
			 int rowAffected1 = -1;
			 				
				
			    pstmt1=conn.prepareStatement("update complaint set status = ?,result = ? where complaintId = ?");
			    
			    pstmt1.setString(1,"close");
			    pstmt1.setString(2,this.result);
			    pstmt1.setInt(3,this.complaintId);
			    
			    rowAffected1 = pstmt1.executeUpdate();
			    
			    if(rowAffected1>0){
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
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	  
	  
	  
  }
	
	
	
	
	
}
