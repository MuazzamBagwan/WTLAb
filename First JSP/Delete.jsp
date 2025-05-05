<%@ page import="java.sql.*" %>
<html>
<head><title>Delete Student</title></head>
<body>

<h2>Delete Student</h2>

<form method="post">
    Stud_id (to Delete): <input type="text" name="stud_id" required><br>
    <input type="submit" name="submit" value="Delete">
</form>

<%
if (request.getParameter("submit") != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/department", "root", "");

        String stud_id = request.getParameter("stud_id");

        PreparedStatement ps = con.prepareStatement("DELETE FROM student_info WHERE stud_id=?");
        ps.setString(1, stud_id);

        int deleted = ps.executeUpdate();
        if (deleted > 0) {
            out.println("<p>Student Deleted Successfully!</p>");
        } else {
            out.println("<p>No Student Found to Delete!</p>");
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
