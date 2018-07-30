<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}

session_start(); 

if (!isset($_SESSION['username'])) {
	die("Blank user");
}

mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";
?>

<!DOCTYPE html>
	<head>

		<title>Reservation Summary</title>

		<link rel="stylesheet" type="text/css" href="6400prj.css" />

	</head>
	<body>
		<div class="container">
			<p class="caption"><b>Clerk Main Menu</b></p>
			<ul class="menu">
				<li><a href="Pick_Up.php">Pick-up Reservation</a></li>
				<li><a href="Drop_Off.php">Drop-off Reservation</a></li>
				<li><a href="Service_Order.php">Service Order</a></li>
				<li><a href="Add_New_Tool.php">Add New Tool</a></li>
				<li><a href="Sell_Tools.php">Sell Tool</a></li>
				<li><a href="Report.php">Generate Reports</a></li>
			</ul>
		</div>
	</body>