package vmh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
public class Index {
	
	private String id;
	private String 	password ;
	private String message;
	private String userType;
	private java.util.Date lastLoginDate;
	
	public void setLastLoginDate(java.util.Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public java.util.Date getLastLoginDate() {
		return lastLoginDate;
	}
	
	public String getMessage() {
		return message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserType() {
		return userType;
	}
	
	
	public boolean checkRecord(){
		Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rset=null;
	
	
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT id,password,userType,lastLoginDate FROM login where id=? AND password=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,this.id);
		pstmt.setString(2,this.password);
		rset=pstmt.executeQuery();
		if(rset.next()){
			
			if(	this.id.equals(rset.getString("id")) && this.password.equals(rset.getString("password")))
			{
			   this.userType = rset.getString("userType");
			   this.lastLoginDate  =rset.getDate("lastLoginDate");
			   return true;
			}	   
		}		
		
	    this.message = "Sorry! Given Password or Id is INVALID";
	    return false;
				
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While adding Record !";
	}finally{
		try{
			if(rset!=null)rset.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	return false;
	
}
	
	
	
public void lastLoginDate(){
	

	Connection conn=null;
	PreparedStatement pstmt1 = null;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected1 = -1;
		 
		    
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		   
		    
		    pstmt1=conn.prepareStatement("update login set lastLoginDate = ? where id = ?");
		    pstmt1.setDate(1,regdate); 
		    pstmt1.setString(2,this.id);
		    rowAffected1 = pstmt1.executeUpdate();
		    
		
		
		
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
