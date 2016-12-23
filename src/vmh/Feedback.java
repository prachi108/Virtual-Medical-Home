package vmh;

import java.sql.*; 
import java.text.SimpleDateFormat;
import java.util.*;

public class Feedback {

	private int id;
	private String patientId;
	private String patientName;
	private String feedback;
	private java.util.Date feedbackDate;
	private String message;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public java.util.Date getFeedbackDate() {
		return feedbackDate;
	}
	public void setFeedbackDate(java.util.Date feedbackDate) {
		this.feedbackDate = feedbackDate;
	}	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	
	
	public void patientInsertRecord(){
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset1 = null;
		int id;
		
		try{
			 conn=DBConnection.getConnection();
			 int rowAffected2 = -1;
			 
			 String sql="SELECT MAX(id) FROM feedback";
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
			    
			    pstmt2=conn.prepareStatement("insert into feedback(id,patientId,feedback," +
			    		"feedbackDate) values(?,?,?,?)");
			    
			    pstmt2.setInt(1,id);
			    pstmt2.setString(2,this.patientId);
			    pstmt2.setString(3,this.feedback);
			    java.sql.Date curdate=new java.sql.Date(new java.util.Date().getTime());
			    pstmt2.setDate(4,curdate);
			    
			    rowAffected2 = pstmt2.executeUpdate();
			    
			    if(rowAffected2>0){
				    message="Feedback sent Successfully !";
			    }
			    else{
			    	message="Sorry! Feedback not sent";
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
	
	
	
	public void patientId(String patientName){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT id FROM patient_profile where name=?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,patientName);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.patientId = rset1.getString("id");
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
	
	
	
	
	public void patientName(String id){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT name FROM patient_profile where id=?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,id);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.patientName = rset1.getString("name");
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
	

	
	public ArrayList getPatientList(){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		ArrayList list=new ArrayList();
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT name FROM patient_profile order by name";
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
	
	
	
	
	public ArrayList getPatientFeedbackList(){
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		ArrayList list=new ArrayList();
		ArrayList idList=new ArrayList();
		ArrayList patientNameList =new ArrayList();
		ArrayList feedbackList =new ArrayList();
		ArrayList feedbackDateList =new ArrayList();
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT id,patientId,feedback,feedbackDate FROM feedback order by id";
			pstmt1=conn.prepareStatement(sql);
			rset1=pstmt1.executeQuery();
			while(rset1.next()){
				idList.add(rset1.getInt("id"));
				this.patientName(rset1.getString("patientId"));
				patientNameList.add(this.patientName);
				feedbackList.add(rset1.getString("feedback"));
				feedbackDateList.add(rset1.getDate("feedbackDate"));
			}
			if(idList!=null && idList.size()>0){
				list.add(idList);
				list.add(patientNameList);
				list.add(feedbackList);
				list.add(feedbackDateList);
				
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
	
	
	
}
