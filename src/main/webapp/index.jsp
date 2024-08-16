<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="test1.Database, java.util.ArrayList, java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>This is JSP for the very first time</h2>
<% 
String name = "Ahsan Habib";
out.print("Name: " + name);

out.print("<br><br><a href='create.jsp'>Create Employee</a><br>");

%>

<hr>
<jsp:include page="create.jsp" />
<hr>

<%

out.println("<br><br>");

try {  
	Database db = new Database();
    Connection con =  db.getConnection();
    
    out.println("Connection Established: " + !con.isClosed()+"<br><br>");
    
    ArrayList<String> list = db.getEmployees(con);
    
    if (list!=null && list.size()>0){
    	for (int i=0; i<list.size(); i++){
    		out.print(list.get(i)+"<br>");
    	}
    }
    
    con.close();
    
} catch (Exception e) {  
    out.println("Error: " + e.getMessage());  
}  
%>
</body>
</html>
