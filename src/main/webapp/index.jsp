<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList, java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Data</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="text-center">
            <h1><%= "Rana Depto" %></h1>
            <h2 class="text-muted">WebLogic.Run</h2>
            <hr>
            <a href='create.jsp' class="btn btn-primary">Create Employee</a>
            <hr>
        </div>

        <%
        out.println("<br><br>");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@oracle19c:1521/ORCLPDB1", "hr", "hr");

            ArrayList<String> list = new ArrayList<>();
            try {
                // Step 3: Create the statement object  
                Statement stmt = con.createStatement();

                // Step 4: Execute query  
                ResultSet rs = stmt.executeQuery("select * from employees");
                while (rs.next()) {
                    list.add(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));
                }

            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error fetching data: " + e.getMessage() + "</div>");
            }

            out.println("<div class='alert alert-success'>Connection Established: " + !con.isClosed() + "</div><br><br>");

            if (list != null && list.size() > 0) {
                out.println("<ul class='list-group'>");
                for (int i = 0; i < list.size(); i++) {
                    out.print("<li class='list-group-item'>" + list.get(i) + "</li>");
                }
                out.println("</ul>");
            } else {
                out.println("<div class='alert alert-warning'>No data found.</div>");
            }

            con.close();

        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
        %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
