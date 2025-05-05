<?php
session_start(); // Start session

$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_no = $_POST['t1'];

    // Check if the roll number exists
    $stmt = $conn->prepare("SELECT * FROM student1 WHERE roll_number = ?");
    $stmt->bind_param("i", $roll_no);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $_SESSION['roll_number'] = $roll_no; // Store roll number in session
        header("Location: update1.php"); // Redirect to update form
        exit();
    } else {
        echo "<p style='color: red;'>No record found for Roll Number: $roll_no</p>";
    }
}
?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Update Student Record</title>
    </head>

    <body>
        <h2>Update Student Record</h2>
        <form method="POST">
            Roll Number: <input type="text" name="t1" required />
            <input type="submit" value="Find Record">
        </form>
    </body>

    </html>