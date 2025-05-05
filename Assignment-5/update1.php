<?php
session_start();
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

// Ensure roll number exists in session
if (!isset($_SESSION['roll_number'])) {
    die("Invalid Access! <a href='update.php'>Go Back</a>");
}

$roll_no = $_SESSION['roll_number'];

// Fetch student details
$stmt = $conn->prepare("SELECT * FROM student1 WHERE roll_number = ?");
$stmt->bind_param("i", $roll_no);
$stmt->execute();
$result = $stmt->get_result();
$student = $result->fetch_assoc();

if (!$student) {
    die("No record found! <a href='update.php'>Go Back</a>");
}

// Handle Update Request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $address = $_POST['address'];

    $stmt = $conn->prepare("UPDATE student1 SET name=?, password=?, email=?, mobile=?, address=? WHERE roll_number=?");
    $stmt->bind_param("sssssi", $name, $password, $email, $mobile, $address, $roll_no);

    if ($stmt->execute()) {
        echo "<p style='color: green;'>Student record updated successfully!</p>";
    } else {
        echo "<p style='color: red;'>Error updating record: " . $stmt->error . "</p>";
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
            Roll Number: <input type="text" name="roll_number" value="<?= htmlspecialchars($student['roll_number']); ?>" readonly /><br> Name: <input type="text" name="name" value="<?= htmlspecialchars($student['name']); ?>" required /><br> Password:
            <input type="password" name="password" value="<?= htmlspecialchars($student['password']); ?>" required /><br> Email: <input type="email" name="email" value="<?= htmlspecialchars($student['email']); ?>" required /><br> Mobile: <input type="tel"
                name="mobile" value="<?= htmlspecialchars($student['mobile']); ?>" required /><br> Address: <input type="text" name="address" value="<?= htmlspecialchars($student['address']); ?>" required /><br>
            <input type="submit" value="Update">
        </form>
        <a href="update.php">Go Back</a>
    </body>

    </html>