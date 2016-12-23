package vmh;

import java.sql.*;  
import java.text.SimpleDateFormat;
import java.util.*;

public class PatientHistory {
	
	
private int transactionId;
private String patientId;
private String patientName;
private String doctorId;
private String doctorName;
private String symptoms;
private String tests;
private String observation;
private String prescription;
private int appointmentId;
private String appointmentDate;
private java.util.Date createDate;
private String status;
private String message;



public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public int getAppointmentId() {
	return appointmentId;
}
public void setAppointmentId(int appointmentId) {
	this.appointmentId = appointmentId;
}
public String getAppointmentDate() {
	return appointmentDate;
}
public void setAppointmentDate(String appointmentDate) {
	this.appointmentDate = appointmentDate;
}
public int getTransactionId() {
	return transactionId;
}
public void setTransactionId(int transactionId) {
	this.transactionId = transactionId;
}
public String getPatientId() {
	return patientId;
}
public void setPatientId(String patientId) {
	this.patientId = patientId;
}
public String getPatientName() {
	return patientName;
}
public void setPatientName(String patientName) {
	this.patientName = patientName;
}
public String getDoctorId() {
	return doctorId;
}
public void setDoctorId(String doctorId) {
	this.doctorId = doctorId;
}
public String getDoctorName() {
	return doctorName;
}
public void setDoctorName(String doctorName) {
	this.doctorName = doctorName;
}
public String getSymptoms() {
	return symptoms;
}
public void setSymptoms(String symptoms) {
	this.symptoms = symptoms;
}
public String getTests() {
	return tests;
}
public void setTests(String tests) {
	this.tests = tests;
}
public String getObservation() {
	return observation;
}
public void setObservation(String observation) {
	this.observation = observation;
}
public String getPrescription() {
	return prescription;
}
public void setPrescription(String prescription) {
	this.prescription = prescription;
}
public java.util.Date getCreateDate() {
	return createDate;
}
public void setCreateDate(java.util.Date createDate) {
	this.createDate = createDate;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
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



public void doctorName(String id){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT name FROM doctor_profile where id=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,id);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.doctorName = rset1.getString("name");
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



public void doctorId(String doctorName){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT id FROM doctor_profile where name=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,doctorName);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.doctorId = rset1.getString("id");
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


	
public ArrayList getPatientAppointmentList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList doctorNameList=new ArrayList();
	ArrayList appointmentDateList =new ArrayList();
	ArrayList appointmentIdList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT appointmentId,doctorId,appointmentDate FROM appointment where patientId=? " +
		 		"AND appointmentStatus=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.patientId);
		pstmt1.setString(2,"confirm");
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.doctorName(rset1.getString("doctorId"));
			doctorNameList.add(this.doctorName);
			appointmentDateList.add(rset1.getString("appointmentDate"));
			appointmentIdList.add(rset1.getString("appointmentId"));
		}
		if(doctorNameList!=null && doctorNameList.size()>0){
			list.add(doctorNameList);
			list.add(appointmentDateList);
			list.add(appointmentIdList);
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
	


public ArrayList getDoctorAppointmentList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList patientNameList=new ArrayList();
	ArrayList symptomsList =new ArrayList();
	ArrayList transactionIdList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT transactionId,patientId,symptoms FROM patientHistory where doctorId=? AND status=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.doctorId);
		pstmt1.setString(2,"open");
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.patientName(rset1.getString("patientId"));
			patientNameList.add(this.patientName);
			symptomsList.add(rset1.getString("symptoms"));
			transactionIdList.add(rset1.getString("transactionId"));
		}
		if(patientNameList!=null && patientNameList.size()>0){
			list.add(patientNameList);
			list.add(symptomsList);
			list.add(transactionIdList);
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




public ArrayList getPatientHistoryList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList doctorNameList=new ArrayList();
	ArrayList symptomsList=new ArrayList();
	ArrayList prescriptionList=new ArrayList();
	ArrayList createDateList =new ArrayList();
	ArrayList transactionIdList=new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT transactionId,doctorId,createDate,prescription,symptoms FROM patientHistory" +
		 		" where patientId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.patientId);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.doctorName(rset1.getString("doctorId"));
			doctorNameList.add(this.doctorName);
			createDateList.add(rset1.getString("createDate"));
			transactionIdList.add(rset1.getInt("transactionId"));
		    prescriptionList.add(rset1.getString("prescription"));
			symptomsList.add(rset1.getString("symptoms"));
		}
		if(doctorNameList!=null && doctorNameList.size()>0){
			list.add(doctorNameList);
			list.add(createDateList);
			list.add(transactionIdList);
			list.add(prescriptionList);
			list.add(symptomsList);
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


public ArrayList getDoctorHistoryList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList patientNameList=new ArrayList();
	ArrayList symptomsList=new ArrayList();
	ArrayList prescriptionList=new ArrayList();
	ArrayList createDateList =new ArrayList();
	ArrayList transactionIdList=new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT transactionId,patientId,createDate,prescription,symptoms FROM patientHistory" +
		 		" where doctorId=? AND status=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.doctorId);
		pstmt1.setString(2,"close");
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.patientName(rset1.getString("patientId"));
			patientNameList.add(this.patientName);
			createDateList.add(rset1.getString("createDate"));
			transactionIdList.add(rset1.getInt("transactionId"));
		    prescriptionList.add(rset1.getString("prescription"));
			symptomsList.add(rset1.getString("symptoms"));
		}
		if(patientNameList!=null && patientNameList.size()>0){
			list.add(patientNameList);
			list.add(createDateList);
			list.add(transactionIdList);
			list.add(prescriptionList);
			list.add(symptomsList);
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


	
public void patientInsertRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	ResultSet rset1 = null;
	int id;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected2 = -1;
		 int rowAffected3 = -1;
		 
		 String sql="SELECT MAX(transactionId) FROM patientHistory";
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
		    this.doctorId(this.doctorName);
		    this.patientId(this.patientName);
		    pstmt2=conn.prepareStatement("insert into patientHistory(transactionId,patientId,doctorId," +
		    		"symptoms,createDate,status) values(?,?,?,?,?,?)");
		    
		    pstmt2.setInt(1,id);
		    pstmt2.setString(2,this.patientId);
		    pstmt2.setString(3,this.doctorId);
		    pstmt2.setString(4,this.symptoms);
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt2.setDate(5,regdate);
		    pstmt2.setString(6,"open");
		    rowAffected2 = pstmt2.executeUpdate();
		    
		    
		    pstmt3=conn.prepareStatement("update appointment set appointmentStatus = ? where appointmentId = ?");
		    
		    pstmt3.setString(1,"close");
		    pstmt3.setInt(2,this.appointmentId);
		    
		    rowAffected3 = pstmt3.executeUpdate();
		    
		    
		    if(rowAffected2>0 && rowAffected3>0){
			    message="Symptoms sent Successfully !";
		    }
		    else{
		    	message="Sorry!Symptoms not sent";
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
	
	

public void doctorInsertRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	int id;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected1 = -1;
		 
		    pstmt1=conn.prepareStatement("update patientHistory set tests = ?,observation = ?,prescription = ?," +
		    		"status = ? where transactionId = ?");
		    
		    pstmt1.setString(1,this.tests);
		    pstmt1.setString(2,this.observation);
		    pstmt1.setString(3,this.prescription);
		    pstmt1.setString(4,"close");
		    pstmt1.setInt(5,this.transactionId);
		    rowAffected1 = pstmt1.executeUpdate();
		    
		    if(rowAffected1 != -1){
			    message="Prescription sent Successfully !";
		    }
		    else{
		    	message="Sorry!Prescription not sent";
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


public boolean getPatientRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	Boolean flag = false;
	
	
	
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT patientId,doctorId,appointmentDate FROM appointment where appointmentId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setInt(1,this.appointmentId);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.setPatientId(rset1.getString("patientId"));
			this.patientName(this.patientId);
			this.setDoctorId(rset1.getString("doctorId"));
			this.doctorName(this.doctorId);
			this.setAppointmentDate(rset1.getString("appointmentDate"));
			
			java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
			
		    if(regdate.compareTo(java.sql.Date.valueOf(this.getAppointmentDate())) >= 0){
		    	
		    	flag = true;		    	
		    	
		    }
			
			
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
	
	return flag;
	
}



public void getRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT doctorId,patientId,symptoms,observation,tests," +
		 		"prescription,createDate,status FROM patientHistory where transactionId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setInt(1,this.transactionId);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.setDoctorId(rset1.getString("doctorId"));
			this.doctorName(this.doctorId);
			this.setPatientId(rset1.getString("patientId"));
			this.patientName(this.patientId);
			this.setSymptoms(rset1.getString("symptoms"));
			this.setObservation(rset1.getString("observation"));
			this.setTests(rset1.getString("tests"));
			this.setPrescription(rset1.getString("prescription"));
			this.setCreateDate(rset1.getDate("createDate"));
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




public ArrayList getPatientList(){
	
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


	
	








}
