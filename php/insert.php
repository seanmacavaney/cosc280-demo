<?php
$HOST = '127.0.0.1';
$USER = 'user280';
$PASS = 'p4ssw0rd';
$DB = 'project280';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$dsn = "mysql:host=$HOST;dbname=$DB";
$pdo = new PDO($dsn, $USER, $PASS);

if ($_POST['age'] > 80) {
	echo "Too old!";
	die();
}

$stmt = $pdo->prepare('INSERT INTO People (first_name, last_name, phone, age, time_added) VALUES (?, ?, ?, ?, NOW())');
$stmt->execute([$_POST['firstname'], $_POST['lastname'], $_POST['phone'], $_POST['age']]);

if ($pdo->lastInsertId() == "0") {
  setcookie("ShowError", "True");
}
else {
  setcookie("ShowSuccess", "True");
}

header('Location: /index.php') ;
?>
