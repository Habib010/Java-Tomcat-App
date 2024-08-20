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
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@51.89.167.221:1521/ORCLPDB1", "hr", "hr");
		    
		    return con;
		    
		} catch (Exception e) {  
		    System.out.println("Error: " + e.getMessage());  
		    return null;
		} 
	}
	
	public ArrayList<String> getEmployees(Connection con){
x	}
}
