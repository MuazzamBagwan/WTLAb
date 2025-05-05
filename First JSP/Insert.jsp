<%@ page import="java.sql.*" %>
<html>
<head><title>Insert Student</title></head>
<body>

<h2>Insert Student</h2>

<form method="post">
    Stud_id: <input type="text" name="stud_id" required><br>
    Name: <input type="text" name="name" required><br>
    Class: <input type="text" name="class" required><br>
    Division: <input type="text" name="division" required><br>
    City: <input type="text" name="city" required><br>
    <input type="submit" name="submit" value="Insert">
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
        con.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
}
%>

<br><a href="MainPage.jsp">Go Back</a>

</body>
</html>
