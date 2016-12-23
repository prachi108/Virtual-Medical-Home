package vmh;

import java.sql.*;


public class DBConnection
{
	public static Connection getConnection()
	{
			Connection conn = null;
			try {
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/vmh";
				conn = DriverManager.getConnection(url, "root", "Prachi");
                
               }
	         catch (Exception e) 
			   {
				e.printStackTrace();
			   }
			return conn;
			
	
	}
}

