<%@ page import="java.sql.*" %>
<html>
<head>
<title>Student Information</title>
</head>
<body>

<h1>Welcome to Sanjivani College of Engineering, IT Department</h1>
<% out.print("Hello World !! Welcome to JSP"); %>
<p>Hello World !! Welcome to JSP</p>

<!-- Form for Insert -->
<h2>Insert Student</h2>
<form method="post">
    Stud_id: <input type="text" name="stud_id" required><br>
    Name: <input type="text" name="name" required><br>
    Class: <input type="text" name="class" required><br>
    Division: <input type="text" name="division" required><br>
    City: <input type="text" name="city" required><br>
    <input type="submit" name="action" value="Insert">
</form>

<!-- Form for Update -->
<h2>Update Student</h2>
<form method="post">
    Stud_id (to Update): <input type="text" name="stud_id" required><br>
    New Name: <input type="text" name="name"><br>
    New Class: <input type="text" name="class"><br>
    New Division: <input type="text" name="division"><br>
    New City: <input type="text" name="city"><br>
    <input type="submit" name="action" value="Update">
</form>

<!-- Form for Delete -->
<h2>Delete Student</h2>
<form method="post">
    Stud_id (to Delete): <input type="text" name="stud_id" required><br>
    <input type="submit" name="action" value="Delete">
</form>

<hr>

<%
    String url = "jdbc:mysql://localhost:3306/department";
    String username = "root";
    String password = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, password);

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("Insert")) {
                // Insert operation
                String stud_id = request.getParameter("stud_id");
                String name = request.getParameter("name");
                String className = request.getParameter("class");
                String division = request.getParameter("division");
                String city = request.getParameter("city");

                PreparedStatement ps = con.prepareStatement("INSERT INTO student_info VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, stud_id);
                ps.setString(2, name);
                ps.setString(3, className);
                ps.setString(4, division);
                ps.setString(5, city);

                int inserted = ps.executeUpdate();
                if (inserted > 0) {
                    out.println("<p>Student Inserted Successfully!</p>");
                }
            } else if (action.equals("Update")) {
                // Update operation
                String stud_id = request.getParameter("stud_id");
                String name = request.getParameter("name");
                String className = request.getParameter("class");
                String division = request.getParameter("division");
                String city = request.getParameter("city");

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE student_info SET name=?, class=?, division=?, city=? WHERE stud_id=?"
                );
                ps.setString(1, name);
                ps.setString(2, className);
                ps.setString(3, division);
                ps.setString(4, city);
                ps.setString(5, stud_id);

                int updated = ps.executeUpdate();
                if (updated > 0) {
                    out.println("<p>Student Updated Successfully!</p>");
                } else {
                    out.println("<p>No Student Found to Update!</p>");
                }
            } else if (action.equals("Delete")) {
                // Delete operation
                String stud_id = request.getParameter("stud_id");

                PreparedStatement ps = con.prepareStatement("DELETE FROM student_info WHERE stud_id=?");
                ps.setString(1, stud_id);

                int deleted = ps.executeUpdate();
                if (deleted > 0) {
                    out.println("<p>Student Deleted Successfully!</p>");
                } else {
                    out.println("<p>No Student Found to Delete!</p>");
                }
            }
        }

        // Always Display Table
%>
<h2>Student Records</h2>
<table border='5'>
<tr><th>Stud_id</th><th>Name</th><th>Class</th><th>Division</th><th>City</th></tr>

<%
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM student_info");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("stud_id") + "</td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("class") + "</td>");
            out.println("<td>" + rs.getString("division") + "</td>");
            out.println("<td>" + rs.getString("city") + "</td>");
            out.println("</tr>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</table>

</body>
</html>
