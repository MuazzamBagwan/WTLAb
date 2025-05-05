<?php
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_number = $_POST['roll_number'];
    
    $sql = "DELETE FROM student1 WHERE roll_number='$roll_number'";
    
    if ($conn->query($sql) === TRUE) {
        echo "Student record deleted successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}
$conn->close();
?>

    <h2>Delete Student Record</h2>
    <form method="POST">
        Roll Number: <input type="number" name="roll_number" required /><br>
        <input type="submit" value="Delete">
    </form>