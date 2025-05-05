<?php
$conn = new mysqli("localhost", "root", "", "studentdb");

if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_number = $_POST['roll_number'];
    $name = $_POST['name'];
    $password = $_POST['password'];  // You should hash this
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $address = $_POST['address'];

    $sql = "INSERT INTO student1 (roll_number, name, password, email, mobile, address) VALUES ('$roll_number', '$name', '$password', '$email', '$mobile', '$address')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Student added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}
$conn->close();
?>