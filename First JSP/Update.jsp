<%@ page import="java.sql.*" %>
<html>
<head><title>Update Student</title></head>
<body>

<h2>Update Student</h2>

<form method="post">
    Stud_id (to Update): <input type="text" name="stud_id" required><br>
    New Name: <input type="text" name="name"><br>
    New Class: <input type="text" name="class"><br>
    New Division: <input type="text" name="division"><br>
    New City: <input type="text" name="city"><br>
    <input type="submit" name="submit" value="Update">
</form>

<%
if (request.getParameter("submit") != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/department", "root", "");

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
        con.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
}
%>

<br><a href="MainPage.jsp">Go Back</a>

</body>
</html>
