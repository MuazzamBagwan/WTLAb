<?php
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

$result = $conn->query("SELECT * FROM student1");

echo "<h2>Student Records</h2>";
echo "<table border='1'><tr><th>Roll Number</th><th>Name</th><th>Email</th><th>Mobile</th><th>Address</th></tr>";

while ($row = $result->fetch_assoc()) {
    echo "<tr><td>{$row['roll_number']}</td><td>{$row['name']}</td><td>{$row['email']}</td><td>{$row['mobile']}</td><td>{$row['address']}</td></tr>";
}
echo "</table>";

$conn->close();
?>