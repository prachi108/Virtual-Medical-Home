package vmh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import java.sql.ResultSet;
public class Specialization {
	
	private String specializationName;
	private String 	description ;
	private String message;
	
	public String getMessage() {
		return message;
	}
	public String getSpecializationName() {
		return specializationName;
	}
	public void setSpecializationName(String specializationName) {
		this.specializationName = specializationName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void insertRecord(){
		Connection conn=null;
		PreparedStatement pstmt = null;
		boolean check;
		
		try{
			 conn=DBConnection.getConnection();
			 int rowAffected = -1;
			 check = this.isDuplicate();
			 if(!check)
			 {		 
			    pstmt=conn.prepareStatement("insert into specialization(specializationName,description)values(?,?)");
			    pstmt.setString(1,this.specializationName);
			    pstmt.setString(2,this.description);
				
			    rowAffected = pstmt.executeUpdate();
			
			    if(rowAffected>0){
				    message="Record Added Successfully !";
			    }else{
				    message="Record not added !";
			    }
			  }else
			    message = "Sorry! This Specialization name already exists";
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While adding Record !";
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}
	
	
	public void updateRecord(){
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try{
			 conn=DBConnection.getConnection();
			int rowAffected = -1;
			
			pstmt=conn.prepareStatement("update specialization set description = ? where specializationName = ?");
			pstmt.setString(1,this.description);
			pstmt.setString(2,this.specializationName);
			
			
			
			rowAffected = pstmt.executeUpdate();
			
			if(rowAffected>0){
				message="Record Updated Successfully !";
			}else{
				message="Record not Updated !";
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While Updating Record !";
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}
	
	public boolean isDuplicate(){
	
		Connection conn=null;
		PreparedStatement pstmt = null;
		boolean flag=false;
		ResultSet rset=null;
		try{
			 conn=DBConnection.getConnection();
			
			
			pstmt=conn.prepareStatement("select * from specialization where specializationName = ?");
			pstmt.setString(1,this.specializationName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				 flag=true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While Inserting Record !";
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
								
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return flag;
		
	}
	
	public void deleteRecord(){
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try{
			 conn=DBConnection.getConnection();
			int rowAffected = -1;
			
			pstmt=conn.prepareStatement("delete from specialization where specializationName = ?");
			pstmt.setString(1,this.specializationName);
			
			
			rowAffected = pstmt.executeUpdate();
			
			if(rowAffected>0){
				message="Record Deleted Successfully !";
			}else{
				message="Record not Deleted !";
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While deleting Record !";
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}
	
	public ArrayList getSpecializationList(){

		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		ArrayList list=new ArrayList();
		ArrayList specializationNameList=new ArrayList();
		ArrayList descriptionList =new ArrayList();
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT specializationName,description FROM specialization order by specializationName";
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			while(rset.next()){
				specializationNameList.add(rset.getString("specializationName"));
				descriptionList.add(rset.getString("description"));
			}
			if(specializationNameList!=null && specializationNameList.size()>0){
				list.add(specializationNameList);
				list.add(descriptionList);
			}
			
			
			
			
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
	return list;
	}

	public void getRecord(){


		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT specializationName,description FROM specialization where specializationName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,this.specializationName);
			rset=pstmt.executeQuery();
			if(rset.next()){
				this.specializationName=rset.getString("specializationName");
				this.description=rset.getString("description");
			}
					
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
	
		
	}
	
	
	public void deleteDoctorSpecialization(String id){
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try{
			 conn=DBConnection.getConnection();
			int rowAffected = -1;
			
			pstmt=conn.prepareStatement("delete from doctor_spacility where id = ? AND specialization = ?");
			pstmt.setString(1,id);
			pstmt.setString(2,this.specializationName);
			
			rowAffected = pstmt.executeUpdate();
			
			if(rowAffected>0){
				message="Record Deleted Successfully !";
			}else{
				message="Record not Deleted !";
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While deleting Record !";
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}
		
	
public void addDoctorSpecialization(String id){
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rset1=null;
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected2 = -1;
		 
		 
		 String sql="SELECT specialization FROM doctor_spacility where id=? AND specialization=?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,id);
			pstmt1.setString(2,this.specializationName);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				message = "Sorry! This Specialization name already exists";
			}
			else{
		    pstmt2=conn.prepareStatement("insert into doctor_spacility(id,specialization)values(?,?)");
		    pstmt2.setString(1,id);
		    pstmt2.setString(2,this.specializationName);
			
		    rowAffected2 = pstmt2.executeUpdate();
		    
		    if(rowAffected2>0){
			    message="Record Added Successfully !";
		    }else{
			    message="Record not added !";
		    }
		  
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
	
	
	
	

	
	
	
}
