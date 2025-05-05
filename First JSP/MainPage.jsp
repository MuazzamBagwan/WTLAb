<%@ page import="java.sql.*" %>
<html>
<head>
<title>Student Management - Main Page</title>
</head>
<body>

<h1>Welcome to Sanjivani College of Engineering, IT Department</h1>

<h2>Student Records</h2>
<table border='5'>
<tr>
    <th>Stud_id</th>
    <th>Name</th>
    <th>Class</th>
    <th>Division</th>
    <th>City</th>
</tr>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/department", "root", "");

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

<br><br>


<form action="Insert.jsp" method="post" style="display:inline;">
    <input type="submit" value="Insert Student">
</form>
<form action="Update.jsp" method="post" style="display:inline;">
    <input type="submit" value="Update Student">
</form>

<form action="Delete.jsp" method="post" style="display:inline;">
    <input type="submit" value="Delete Student">
</form>




</body>
</html>
