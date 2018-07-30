<?php

/* connect to database */	
$connect = mysql_connect("localhost:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}

session_start(); 

if (!isset($_SESSION['username'])) {
	die("Blank user");
}

mysql_select_db("handyman") or die( "Unable to select database");

$username = $_SESSION['username'];
$query_user_profile = "SELECT Login, Fname, Lname, Home_phone, Work_phone, Address FROM Customer WHERE Login = '$username'";
$result_user_profile = mysql_query($query_user_profile);
$row=mysql_fetch_assoc($result_user_profile);
$query_user_history = "SELECT a.Reservation_no as res, Tool_id, Start_date, End_date, Rental_price,
Deposit_amount, Pick_up_clerk, Drop_off_Clerk
FROM Reservation a
LEFT JOIN
(SELECT Reservation_no, Tool_id, Rental_price, Deposit_amount
FROM Consist_of
LEFT JOIN Tools ON Consist_of.Tool_id = Tools.ID) b
ON a.Reservation_no = b.Reservation_no
WHERE Customer_Login = '$username'
ORDER BY End_date DESC;";
$result_user_history = mysql_query($query_user_history);
$errorMsg = "";
?>


<!DOCTYPE html>
	<head>

		<title>Profile</title>

		<link rel="stylesheet" type="text/css" href="6400prj.css" />

	</head>
	<body>
		<div class="container">
			<div>
			<p class="caption"><b>Reservation Summary</b></p>
			<hr>
			</div>
			<div class="poster mposter">
				<p class="sub-caption"><b>Email Address:</b> <?php echo $row['Login'] ?></p>
				<p class="sub-caption"><b>Name:</b> <?php echo $row['Fname'].' '.$row['Lname'] ?></p>
				<p class="sub-caption"><b>Home Phone:</b> <?php echo $row['Home_phone'] ?></p>
				<p class="sub-caption"><b>Work Phone:</b> <?php echo $row['Work_phone'] ?></p>
				<p class="sub-caption"><b>Address</b> <?php echo $row['Address'] ?></p>
			</div>
			<div class="poster sbposter">
				<p class="sub-caption"><b>Reservation History</b></p>
				<hr>
				<table id="t01" style="width:100%">
				  <tr>
					<th>Res#</th>
					<th>Tools</th> 
					<th>Start</th>
					<th>End</th>
					<th>Rental Price</th> 
					<th>Deposit</th>
					<th>Pick-up Clerk</th> 
					<th>Drop-off Clerk</th>
				  </tr>
				<?php while($row=mysql_fetch_assoc($result_user_history)){
					 echo "<tr>
						<td>".$row['res']."</td>
						<td>".$row['Tool_id']."</td> 
						<td>".$row['Start_date']."</td>
						<td>".$row['End_date']."</td>
						<td>".$row['Rental_price']."</td> 
						<td>".$row['Deposit_amount']."</td>
						<td>".$row['Pick_up_clerk']."</td>
						<td>".$row['Drop_off_Clerk']."</td> 
					  </tr>";
					}
				  ?>
				</table>
			</div>
		</div>
	</body>