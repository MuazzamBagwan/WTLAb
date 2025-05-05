<!DOCTYPE html>
<html>

<head>
    <title>Student Registration</title>
    <link href="style.css" rel="stylesheet">
</head>

<body>
    <h1>Student Registration Form</h1>
    <form method="POST" action="add.php">
        <table>
            <tr>
                <td>Roll Number:</td>
                <td><input type="number" name="roll_number" required /></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required /></td>
            </tr>
            <tr>
                <td>Email ID:</td>
                <td><input type="email" name="email" required /></td>
            </tr>
            <tr>
                <td>Mobile Number:</td>
                <td><input type="tel" name="mobile" required /></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" required /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><input type="submit" value="add" /></td>
            </tr>
        </table>
    </form>

    <h2>Actions</h2>
    <a href="display.php"><button>Display</button></a>
    <a href="update.php"><button>Update</button></a>
    <a href="delete.php"><button>Delete</button></a>
</body>

</html>