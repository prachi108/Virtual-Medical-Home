package vmh;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class Doctor {
	
	private String message;
	private String status;

	private String id;
	private String name;
	private String fname;
	private String nationality;
	private String dob;
	private String gender;
	
	private String address1;
	private String city1;
	private String state1;
	private String country1;
	private int zip1;
	private String landline1;
	private String mobile1;
	
	private String address2;
	private String city2;
	private String state2;
	private String country2;
	private int zip2;
	private String landline2;
	private String mobile2;
	
	private String bloodGroup;
	private String qualification;
	private String experience;
	private String specialization[];
	private String email;
	private String alternateEmail;
	private java.util.Date registrationDate;
	private String createdBy = "Prachi";
	
	private String password;
	private String password1;	
	
	
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status = status;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getCity1() {
		return city1;
	}
	public void setCity1(String city1) {
		this.city1 = city1;
	}
	public String getState1() {
		return state1;
	}
	public void setState1(String state1) {
		this.state1 = state1;
	}
	public String getCountry1() {
		return country1;
	}
	public void setCountry1(String country1) {
		this.country1 = country1;
	}
	public int getZip1() {
		return zip1;
	}
	public void setZip1(int zip1) {
		this.zip1 = zip1;
	}
	public String getLandline1() {
		return landline1;
	}
	public void setLandline1(String landline1) {
		this.landline1 = landline1;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity2() {
		return city2;
	}
	public void setCity2(String city2) {
		this.city2 = city2;
	}
	public String getState2() {
		return state2;
	}
	public void setState2(String state2) {
		this.state2 = state2;
	}
	public String getCountry2() {
		return country2;
	}
	public void setCountry2(String country2) {
		this.country2 = country2;
	}
	public int getZip2() {
		return zip2;
	}
	public void setZip2(int zip2) {
		this.zip2 = zip2;
	}
	public String getLandline2() {
		return landline2;
	}
	public void setLandline2(String landline2) {
		this.landline2 = landline2;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getEmail() {
		return email;
	}
	public String[] getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String[] array) {
		
		specialization = array;
		
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAlternateEmail() {
		return alternateEmail;
	}
	public void setAlternateEmail(String alternateEmail) {
		this.alternateEmail = alternateEmail;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	public java.util.Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(java.util.Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword() {
		return this.password;
	}
	public String getPassword1() {
		return this.password1;
	}
	
	
	public void insertRecord(){
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
		
		try{
			 conn=DBConnection.getConnection();
			 int rowAffected1 = -1;
			 int rowAffected2 = -1;
			 int rowAffected3 = -1;
			 
			    pstmt1=conn.prepareStatement("insert into doctor_profile(id,name,fname,nationality,dob,gender," +
			    		"address1,city1,state1,country1,zip1,landline1,mobile1,address2,city2,state2,country2,zip2," +
			    		"landline2,mobile2,bloodGroup,qualification,experience,email,alternateEmail," +
			    		"registrationDate,createdBy)" +"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			    
			    pstmt1.setString(1,this.id);
			    pstmt1.setString(2,this.name);
			    pstmt1.setString(3,this.fname);
			    pstmt1.setString(4,this.nationality);
			    SimpleDateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
			    
			    java.util.Date d = dateformat.parse(dob);
			    
			    long t = d.getTime();
			    java.sql.Date temp = new java.sql.Date(t);
			     
			    pstmt1.setDate(5,temp);
			    pstmt1.setString(6,this.gender);
			    pstmt1.setString(7,this.address1);
			    pstmt1.setString(8,this.city1);
			    pstmt1.setString(9,this.state1);
			    pstmt1.setString(10,this.country1);
			    pstmt1.setInt(11,this.zip1);
			    pstmt1.setString(12,this.landline1);
			    pstmt1.setString(13,this.mobile1);
			    pstmt1.setString(14,this.address2);
			    pstmt1.setString(15,this.city2);
			    pstmt1.setString(16,this.state2);
			    pstmt1.setString(17,this.country2);
			    pstmt1.setInt(18,this.zip2);
			    pstmt1.setString(19,this.landline2);
			    pstmt1.setString(20,this.mobile2);
			    pstmt1.setString(21,this.bloodGroup);
			    pstmt1.setString(22,this.qualification);
			    pstmt1.setString(23,this.experience);
			    pstmt1.setString(24,this.email);
			    pstmt1.setString(25,this.alternateEmail);
			    
			    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
			    pstmt1.setDate(26,regdate);
			    pstmt1.setString(27,this.createdBy);
			    
			    rowAffected1 = pstmt1.executeUpdate();
			    
			    
			    pstmt2=conn.prepareStatement("insert into login(id,password,userType,status,lastLoginDate)" +
			    		"values(?,?,?,?,?)");
			    pstmt2.setString(1,this.id);
			    pstmt2.setString(2,this.password);
			    pstmt2.setString(3,"doctor");
			    pstmt2.setString(4,"disable");
			    pstmt2.setDate(5,regdate);
			    rowAffected2 = pstmt2.executeUpdate();
			    
			    for(int i=0;i<this.specialization.length;i++)
			    {
			    	pstmt3=conn.prepareStatement("insert into doctor_spacility(id,specialization)" +
				    		"values(?,?)");
				    pstmt3.setString(1,this.id);
				    pstmt3.setString(2,this.specialization[i]);
				    rowAffected3 = pstmt3.executeUpdate();
			    }
			    
			    
			
			    if(rowAffected1>0 && rowAffected2>0 && rowAffected3>0){
				    message="Record Added Successfully !";
				    
			    
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While adding Record !";
		}finally{
			try{
				if(pstmt1!=null)pstmt1.close();
				if(pstmt2!=null)pstmt2.close();
				if(pstmt3!=null)pstmt3.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
	}
	
		
	
	public boolean checkAvailability(String idvalue){
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		boolean flag=false;
		try{
			 conn=DBConnection.getConnection();
			
			
			pstmt=conn.prepareStatement("select * from login where id = ?");
			pstmt.setString(1,idvalue);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				 flag = true;
				
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
	
	public void getRecord(){

		Connection conn=null;
		PreparedStatement pstmt1 = null;
		ResultSet rset1=null;
		PreparedStatement pstmt2 = null;
		ResultSet rset2=null;
		PreparedStatement pstmt3 = null;
		ResultSet rset3=null;
		String arr[] = new String[20];
		
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT id,name,fname,nationality,dob,gender,address1,city1,state1,country1,zip1,landline1,mobile1," +
			 		"address2,city2,state2,country2,zip2,landline2,mobile2,bloodGroup,qualification,experience," +
			 		"email,alternateEmail,registrationDate,createdBy FROM doctor_profile where id=?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,this.id);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.id=rset1.getString("id");
				this.name=rset1.getString("name");
				
				this.fname=rset1.getString("fname");
				this.nationality=rset1.getString("nationality");
				this.dob=rset1.getString("dob");
				this.gender=rset1.getString("gender");
				this.address1=rset1.getString("address1");
				this.city1=rset1.getString("city1");
				this.state1=rset1.getString("state1");
				this.country1=rset1.getString("country1");
				this.zip1=rset1.getInt("zip1");
				this.landline1=rset1.getString("landline1");
				this.mobile1=rset1.getString("mobile1");
				this.address2=rset1.getString("address2");
				this.city2=rset1.getString("city2");
				this.state2=rset1.getString("state2");
				this.country2=rset1.getString("country2");
				this.zip2=rset1.getInt("zip2");
				
				this.landline2=rset1.getString("landline2");
				this.mobile2=rset1.getString("mobile2");
				this.bloodGroup=rset1.getString("bloodGroup");
				this.qualification=rset1.getString("qualification");
				this.experience=rset1.getString("experience");
				this.email=rset1.getString("email");
				this.alternateEmail=rset1.getString("alternateEmail");
				this.registrationDate=rset1.getDate("registrationDate");
				this.email=rset1.getString("email");
				this.createdBy=rset1.getString("createdBy");
				
			}
				sql="SELECT password FROM login where id=?";
				pstmt2=conn.prepareStatement(sql);
				pstmt2.setString(1,this.id);
				rset2=pstmt2.executeQuery();
				if(rset2.next())
					this.password=rset2.getString("password");	
				
				
				sql="SELECT specialization FROM doctor_spacility where id=?";
				pstmt3=conn.prepareStatement(sql);
				pstmt3.setString(1,this.id);
				rset3=pstmt3.executeQuery();
				int i = 0;
				for(i=0;rset3.next();i++){
					arr[i] = rset3.getString("specialization");
				} 
				
				this.specialization = new String[i];
				
				
				for(int j=0;j<i;j++){
					this.specialization[j] = arr[j];					
				}
				
					
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While fetching Record !";
		}finally{
			try{
				if(rset1!=null)rset1.close();
				if(pstmt1!=null)pstmt1.close();
				if(rset2!=null)rset2.close();
				if(pstmt2!=null)pstmt2.close();
				if(rset3!=null)rset3.close();
				if(pstmt3!=null)pstmt3.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
	}		
	
public ArrayList getDoctorList(){
		
		
		Connection conn=null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset1=null;
		ResultSet rset2=null;
		ArrayList list=new ArrayList();
		ArrayList userNameList=new ArrayList();
		ArrayList nameList =new ArrayList();
		ArrayList genderList =new ArrayList();
		ArrayList cityList =new ArrayList();
		ArrayList bloodGroupList =new ArrayList();
		ArrayList statusList =new ArrayList();
		try{
			 conn=DBConnection.getConnection();
			 String sql="SELECT id,name,gender,city1,bloodGroup FROM doctor_profile order by id";
			pstmt1=conn.prepareStatement(sql);
			rset1=pstmt1.executeQuery();
			while(rset1.next()){
				userNameList.add(rset1.getString("id"));
				nameList.add(rset1.getString("name"));
				genderList.add(rset1.getString("gender"));
				cityList.add(rset1.getString("city1"));
				bloodGroupList.add(rset1.getString("bloodGroup"));
			}
			if(userNameList!=null && userNameList.size()>0){
				list.add(userNameList);
				list.add(nameList);
				list.add(genderList);
				list.add(cityList);
				list.add(bloodGroupList);
				
			}
			
			sql="SELECT status FROM login where userType = 'doctor' order by id";
			pstmt2=conn.prepareStatement(sql);
			rset2=pstmt2.executeQuery();
			while(rset2.next()){
				statusList.add(rset2.getString("status"));
			}
			
			
			if(statusList!=null && statusList.size()>0){
				list.add(statusList);				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			message="Error ! While displaying Record !";
		}finally{
			try{
				if(rset1!=null)rset1.close();
				if(pstmt1!=null)pstmt1.close();
				if(rset2!=null)rset2.close();
				if(pstmt2!=null)pstmt2.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
	


public void updateRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	
	try{
		 conn=DBConnection.getConnection();
		int rowAffected1 = -1;
		
		pstmt1=conn.prepareStatement("update doctor_profile set name = ?,fname = ?,nationality = ?,dob = ?," +
				"gender = ?,address1 = ?,city1 = ?,state1 = ?,country1 = ?,zip1 = ?,landline1 = ?,mobile1 = ?," +
		 		"address2 = ?,city2 = ?,state2 = ?,country2 = ?,zip2 = ?,landline2 = ?,mobile2 = ?," +
		 		"bloodGroup = ?,qualification = ?,experience = ?,email = ?,alternateEmail = ?," +
		 		"registrationDate = ?,createdBy = ? where id = ?");
		pstmt1.setString(1,this.name);
		pstmt1.setString(2,this.fname);
		pstmt1.setString(3,this.nationality);
SimpleDateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
	    
	    java.util.Date d = dateformat.parse(this.dob);
	    
	    long t = d.getTime();
	    java.sql.Date temp = new java.sql.Date(t);
		pstmt1.setDate(4,temp);
		pstmt1.setString(5,this.gender);
		pstmt1.setString(6,this.address1);
		pstmt1.setString(7,this.city1);
		pstmt1.setString(8,this.state1);
		pstmt1.setString(9,this.country1);
		pstmt1.setInt(10,this.zip1);
		pstmt1.setString(11,this.landline1);
		pstmt1.setString(12,this.mobile1);
		pstmt1.setString(13,this.address2);
		pstmt1.setString(14,this.city2);
		pstmt1.setString(15,this.state2);
		pstmt1.setString(16,this.country2);
		pstmt1.setInt(17,this.zip2);
		pstmt1.setString(18,this.landline2);
		pstmt1.setString(19,this.mobile2);
		pstmt1.setString(20,this.bloodGroup);
		pstmt1.setString(21,this.qualification);
		pstmt1.setString(22,this.experience);
		pstmt1.setString(23,this.email);
		pstmt1.setString(24,this.alternateEmail);
		java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
	    pstmt1.setDate(25,regdate);
		pstmt1.setString(26,this.createdBy);
		pstmt1.setString(27,this.id);
		
		rowAffected1 = pstmt1.executeUpdate();
		
		if(rowAffected1>0){
			message="Record Updated Successfully !";
		}else{
			message="Record not Updated !";
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While Updating Record !";
	}finally{
		try{
			if(pstmt1!=null)pstmt1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
	

public void changeStatus(){

	Connection conn=null;
	PreparedStatement pstmt = null;
	
	try{
		 conn=DBConnection.getConnection();
		int rowAffected = -1;
		String str;
				
		if(this.status.equals("disable"))
			str = "enable";
		else
			str = "disable";
		
		pstmt=conn.prepareStatement("update login set status = ? where id = ?");
		pstmt.setString(1,str);
		pstmt.setString(2,this.id);
		
		rowAffected = pstmt.executeUpdate();
		
		str = str+"d";
		if(rowAffected>0){
			message="Record has been "+str+" !" ;
		}else{
			message="Sorry! Record's status has not been changed";
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While Changing status !";
	}finally{
		try{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}


public void resetPassword()
{
	
	Connection conn=null;
	PreparedStatement pstmt = null;
	
	try{
		 conn=DBConnection.getConnection();
		int rowAffected = -1;
		
		pstmt=conn.prepareStatement("update login set password = ? where id = ?");
		pstmt.setString(1,this.password);
		pstmt.setString(2,this.id);
		
		rowAffected = pstmt.executeUpdate();
		
		if(rowAffected>0){
			message="Password Updated Successfully !";
		}else{
			message="Password not Updated !";
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While Updating Password !";
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
	
	ArrayList list = new ArrayList();
	String sql;
	try{
		conn=DBConnection.getConnection();	
	sql="SELECT specialization FROM doctor_spacility where id = ?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,this.id);
	rset=pstmt.executeQuery();
	while(rset.next()){
		list.add(rset.getString("specialization"));
	}
		
	
}catch(Exception e){
	e.printStackTrace();
	message="Error ! While displaying Record !";
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




	
	
	







}
