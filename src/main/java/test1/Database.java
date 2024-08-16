package test1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Database {
	
	public Database() {
		
	}

	public Connection getConnection(){
		try {  
		    // Step 1: Load the driver class  
		    Class.forName("oracle.jdbc.driver.OracleDriver");  
		    
		    // Step 2: Create the connection object  
		    Connection con = DriverManager.getConnection(  
		        "jdbc:oracle:thin:@15.235.207.176:1521/ORCLPDB1", "hr", "hr"); 
		    
		    return con;
		    
		} catch (Exception e) {  
		    System.out.println("Error: " + e.getMessage());  
		    return null;
		} 
	}
	
	public ArrayList<String> getEmployees(Connection con){
		ArrayList<String> list = new ArrayList();
		try {  
		    // Step 3: Create the statement object  
		    Statement stmt = con.createStatement();  
		    
		    // Step 4: Execute query  
		    ResultSet rs = stmt.executeQuery("select * from employees");  
		    while (rs.next()) { 
		        list.add(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));  
		    }  
		    
		    return list;
		} catch (Exception e) {  
		    return null;  
		} 
	}
}
