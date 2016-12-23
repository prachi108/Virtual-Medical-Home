package vmh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

public class Appointment {
	
	private String appointmentId;
	private String patientId;
	private String doctorId;
	private String kioskId;
	private String appointmentDate;
	private java.util.Date allotmentDate;
	private String appointmentRequestedDate;
	private java.util.Date requestDate;
	private String description;
	private String remark;
	private String appointmentStatus;
	private String message;
	private String doctorName;
	private String patientName;
	private String kioskName;
	
	
	public String getKioskName() {
		return kioskName;
	}
	public void setKioskName(String kioskName) {
		this.kioskName = kioskName;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(String appointmentId) {
		this.appointmentId = appointmentId;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	public String getKioskId() {
		return kioskId;
	}
	public void setKioskId(String kioskId) {
		this.kioskId = kioskId;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public java.util.Date getAllotmentDate() {
		return allotmentDate;
	}
	public void setAllotmentDate(java.util.Date allotmentDate) {
		this.allotmentDate = allotmentDate;
	}
	public String getAppointmentRequestedDate() {
		return appointmentRequestedDate;
	}
	public void setAppointmentRequestedDate(String appointmentRequestedDate) {
		this.appointmentRequestedDate = appointmentRequestedDate;
	}
	public java.util.Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(java.util.Date requestDate) {
		this.requestDate = requestDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAppointmentStatus() {
		return appointmentStatus;
	}
	public void setAppointmentStatus(String appointmentStatus) {
		this.appointmentStatus = appointmentStatus;
	}
	
	
	
public ArrayList getDoctorList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT name FROM doctor_profile order by name";
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

	

public void appointmentStatus(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1 = null;
	
	try{
		 conn=DBConnection.getConnection();
		 
		 String sql="SELECT appointmentStatus FROM appointment where appointmentId = ?";
			pstmt1=conn.prepareStatement(sql);
			pstmt1.setString(1,this.appointmentId);
			rset1=pstmt1.executeQuery();
			if(rset1.next()){
				this.appointmentStatus = rset1.getString(1);
			}
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While adding Record !";
	}finally{
		try{
			if(pstmt1!=null)pstmt1.close();
			if(rset1!=null)rset1.close();
			if(conn!=null)conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
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
		 
		 String sql="SELECT MAX(appointmentId) FROM appointment";
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
		    this.doctorId(doctorName);
		    
		    pstmt2=conn.prepareStatement("insert into appointment(appointmentId,patientId,doctorId," +
		    		"appointmentRequestedDate," +
		    		"requestDate,description,appointmentStatus) values(?,?,?,?,?,?,?)");
		    
		    pstmt2.setInt(1,id);
		    pstmt2.setString(2,this.patientId);
		    pstmt2.setString(3,this.doctorId);
		    
		    SimpleDateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
		    
		    java.util.Date d = dateformat.parse(this.appointmentRequestedDate);
		    
		    long t = d.getTime();
		    java.sql.Date temp = new java.sql.Date(t);
		     
		    pstmt2.setDate(4,temp);
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt2.setDate(5,regdate);
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
	


public void kioskInsertRecord(){
	

	Connection conn=null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rset1 = null;
	int id;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected2 = -1;
		 
		 String sql="SELECT MAX(appointmentId) FROM appointment";
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
		    
		    pstmt2=conn.prepareStatement("insert into appointment(appointmentId,patientId,doctorId,kioskId," +
		    		"appointmentRequestedDate," +
		    		"requestDate,description,appointmentStatus) values(?,?,?,?,?,?,?,?)");
		    
		    pstmt2.setInt(1,id);
		    pstmt2.setString(2,this.patientId);
		    pstmt2.setString(3,this.doctorId);
		    pstmt2.setString(4,this.kioskId);
		    
		    SimpleDateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
		    
		    java.util.Date d = dateformat.parse(this.appointmentRequestedDate);
		    
		    long t = d.getTime();
		    java.sql.Date temp = new java.sql.Date(t);
		     
		    pstmt2.setDate(5,temp);
		    java.sql.Date regdate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt2.setDate(6,regdate);
		    pstmt2.setString(7,this.description);
		    pstmt2.setString(8,"pending");
		    
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




public void doctorInsertRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected1 = -1;
		 
		 this.appointmentStatus();
			
			
		    pstmt1=conn.prepareStatement("update appointment set appointmentDate = ?,allotmentDate = ?,remark = ?," +
		    		"appointmentStatus = ? where appointmentId = ?");
		    
		    
		    SimpleDateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
		    java.util.Date d = dateformat.parse(this.appointmentDate);
		    long t = d.getTime();
		    java.sql.Date temp = new java.sql.Date(t);
		    pstmt1.setDate(1,temp);
		    java.sql.Date allotDate=new java.sql.Date(new java.util.Date().getTime());
		    pstmt1.setDate(2,allotDate);
		    pstmt1.setString(3,this.remark);
		    pstmt1.setString(4,"confirm");
		    pstmt1.setString(5,this.appointmentId);
		    
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



public void doctorCancelRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	
	try{
		 conn=DBConnection.getConnection();
		 int rowAffected1 = -1;
		 
		 this.appointmentStatus();
			
			if(this.getAppointmentStatus().equals("cancel")){
				message="Appointment is already cancelled";
				return;
			}
			
			
		    pstmt1=conn.prepareStatement("update appointment set appointmentStatus = ? where appointmentId = ?");
		    pstmt1.setString(1,"cancel");
		    pstmt1.setString(2,this.appointmentId);
		    
		    rowAffected1 = pstmt1.executeUpdate();
		    
		    if(rowAffected1>0){
			    message="Appointment cancelled Successfully !";
		    }
		    else{
		    	message="Sorry! Appointment not cancelled";
		    }
		
		
	}catch(Exception e){
		e.printStackTrace();
		message="Error ! While updating record!";
	}finally{
		try{
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



public void kioskName(String id){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT name FROM kiosk_profile where id=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,id);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.kioskName = rset1.getString("name");
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
	ArrayList allotmentDateList =new ArrayList();
	ArrayList appointmentRequestedDateList =new ArrayList();
	ArrayList requestDateList =new ArrayList();
	ArrayList appointmentIdList =new ArrayList();
	ArrayList descriptionList =new ArrayList();
	ArrayList remarkList =new ArrayList();
	ArrayList appointmentStatusList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT doctorId,appointmentDate,allotmentDate," +
		 		"appointmentRequestedDate,requestDate,appointmentId,description,remark,appointmentStatus FROM" +
		 		" appointment where patientId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.patientId);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.doctorName(rset1.getString("doctorId"));
			doctorNameList.add(this.doctorName);
			appointmentDateList.add(rset1.getString("appointmentDate"));
			allotmentDateList.add(rset1.getString("allotmentDate"));
			appointmentRequestedDateList.add(rset1.getString("appointmentRequestedDate"));
			requestDateList.add(rset1.getDate("requestDate"));
			appointmentIdList.add(rset1.getString("appointmentId"));
			descriptionList.add(rset1.getString("description"));
			remarkList.add(rset1.getString("remark"));
			appointmentStatusList.add(rset1.getString("appointmentStatus"));
		}
		if(doctorNameList!=null && doctorNameList.size()>0){
			list.add(doctorNameList);
			list.add(appointmentDateList);
			list.add(allotmentDateList);
			list.add(appointmentRequestedDateList);
			list.add(requestDateList);
			list.add(appointmentIdList);
			list.add(descriptionList);
			list.add(remarkList);
			list.add(appointmentStatusList);
			
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
	


public ArrayList getKioskAppointmentList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList doctorNameList=new ArrayList();
	ArrayList patientNameList=new ArrayList();
	ArrayList appointmentDateList =new ArrayList();
	ArrayList allotmentDateList =new ArrayList();
	ArrayList appointmentRequestedDateList =new ArrayList();
	ArrayList requestDateList =new ArrayList();
	ArrayList appointmentIdList =new ArrayList();
	ArrayList descriptionList =new ArrayList();
	ArrayList remarkList =new ArrayList();
	ArrayList appointmentStatusList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT patientId,doctorId,appointmentDate,allotmentDate," +
		 		"appointmentRequestedDate,requestDate,appointmentId,description,remark,appointmentStatus FROM" +
		 		" appointment where kioskId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.kioskId);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.patientName(rset1.getString("patientId"));
			patientNameList.add(this.patientName);
			this.doctorName(rset1.getString("doctorId"));
			doctorNameList.add(this.doctorName);
			appointmentDateList.add(rset1.getString("appointmentDate"));
			allotmentDateList.add(rset1.getString("allotmentDate"));
			appointmentRequestedDateList.add(rset1.getString("appointmentRequestedDate"));
			requestDateList.add(rset1.getDate("requestDate"));
			appointmentIdList.add(rset1.getString("appointmentId"));
			descriptionList.add(rset1.getString("description"));
			remarkList.add(rset1.getString("remark"));
			appointmentStatusList.add(rset1.getString("appointmentStatus"));
		}
		if(doctorNameList!=null && doctorNameList.size()>0){
			list.add(doctorNameList);
			list.add(patientNameList);
			list.add(appointmentDateList);
			list.add(allotmentDateList);
			list.add(appointmentRequestedDateList);
			list.add(requestDateList);
			list.add(appointmentIdList);
			list.add(descriptionList);
			list.add(remarkList);
			list.add(appointmentStatusList);
			
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
	



public void getAppointmentRecord(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT patientId,doctorId,kioskId,appointmentDate,allotmentDate," +
		 		"appointmentRequestedDate,requestDate,description,remark,appointmentStatus FROM" +
		 		" appointment where appointmentId=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.appointmentId);
		rset1=pstmt1.executeQuery();
		if(rset1.next()){
			this.setPatientId(rset1.getString("patientId"));
			this.patientName(this.patientId);
			this.setDoctorId(rset1.getString("doctorId"));
			this.doctorName(this.doctorId);
			this.setKioskId(rset1.getString("kioskId"));
			this.kioskName(this.kioskId);
			this.setAppointmentDate(rset1.getString("appointmentDate"));
			this.setAllotmentDate(rset1.getDate("allotmentDate"));
			this.setAppointmentRequestedDate(rset1.getString("appointmentRequestedDate"));
			this.setRequestDate(rset1.getDate("requestDate"));
			this.setDescription(rset1.getString("description"));
			this.setRemark(rset1.getString("remark"));
			this.setAppointmentStatus(rset1.getString("appointmentStatus"));
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
	


public ArrayList getDoctorAppointmentList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList patientNameList=new ArrayList();
	ArrayList kioskNameList=new ArrayList();
	ArrayList appointmentRequestedDateList =new ArrayList();
	ArrayList requestDateList =new ArrayList();
	ArrayList appointmentIdList =new ArrayList();
	ArrayList descriptionList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT patientId,kioskId,appointmentRequestedDate,requestDate,appointmentId,description" +
		 		" FROM appointment where doctorId=? AND appointmentStatus=?";
		pstmt1=conn.prepareStatement(sql);
		pstmt1.setString(1,this.doctorId);
		pstmt1.setString(2,this.appointmentStatus);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.patientName(rset1.getString("patientId"));
			patientNameList.add(this.patientName);
			this.kioskName(rset1.getString("kioskId"));
			kioskNameList.add(this.kioskName);
			appointmentRequestedDateList.add(rset1.getString("appointmentRequestedDate"));
			requestDateList.add(rset1.getString("requestDate"));
			appointmentIdList.add(rset1.getString("appointmentId"));
			descriptionList.add(rset1.getString("description"));
		}
		if(patientNameList!=null && patientNameList.size()>0){
			list.add(patientNameList);
			list.add(kioskNameList);
			list.add(appointmentRequestedDateList);
			list.add(requestDateList);
			list.add(appointmentIdList);
			list.add(descriptionList);
			
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



public ArrayList getAdminAppointmentList(){
	
	Connection conn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rset1=null;
	ArrayList list=new ArrayList();
	ArrayList doctorNameList=new ArrayList();
	ArrayList patientNameList=new ArrayList();
	ArrayList kioskNameList=new ArrayList();
	ArrayList appointmentDateList =new ArrayList();
	ArrayList allotmentDateList =new ArrayList();
	ArrayList appointmentRequestedDateList =new ArrayList();
	ArrayList requestDateList =new ArrayList();
	ArrayList appointmentIdList =new ArrayList();
	ArrayList descriptionList =new ArrayList();
	ArrayList remarkList =new ArrayList();
	ArrayList appointmentStatusList =new ArrayList();
	try{
		 conn=DBConnection.getConnection();
		 String sql="SELECT patientId,doctorId,kioskId,appointmentDate,allotmentDate," +
		 		"appointmentRequestedDate,requestDate,appointmentId,description,remark,appointmentStatus FROM" +
		 		" appointment";
		pstmt1=conn.prepareStatement(sql);
		rset1=pstmt1.executeQuery();
		while(rset1.next()){
			this.patientName(rset1.getString("patientId"));
			patientNameList.add(this.patientName);
			this.doctorName(rset1.getString("doctorId"));
			doctorNameList.add(this.doctorName);
			this.kioskName(rset1.getString("kioskId"));
			kioskNameList.add(this.kioskName);
			appointmentDateList.add(rset1.getString("appointmentDate"));
			allotmentDateList.add(rset1.getString("allotmentDate"));
			appointmentRequestedDateList.add(rset1.getString("appointmentRequestedDate"));
			requestDateList.add(rset1.getDate("requestDate"));
			appointmentIdList.add(rset1.getString("appointmentId"));
			descriptionList.add(rset1.getString("description"));
			remarkList.add(rset1.getString("remark"));
			appointmentStatusList.add(rset1.getString("appointmentStatus"));
		}
		if(doctorNameList!=null && doctorNameList.size()>0){
			list.add(doctorNameList);
			list.add(patientNameList);
			list.add(kioskNameList);
			list.add(appointmentDateList);
			list.add(allotmentDateList);
			list.add(appointmentRequestedDateList);
			list.add(requestDateList);
			list.add(appointmentIdList);
			list.add(descriptionList);
			list.add(remarkList);
			list.add(appointmentStatusList);
			
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
