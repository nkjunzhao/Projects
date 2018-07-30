<?php

/* connect to database */   
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
    die("Failed to connect to database");
}
mysql_select_db("handyman") or die("Unable to select database");

// session_start();
// if (!isset($_SESSION['email'])) {
//     header('Location: login.php');
//     exit();
// }

if (!(empty($_GET['category']) or empty($_GET['Start_Date']) or empty($_GET['End_Date']))) {
	$tool_category = $_GET['category'];
	$sDate = $_GET['Start_Date'];
	$eDate = $_GET['End_Date'];

	$query = "SELECT A.ID as ID, A.tname as Abbr_desc, A.Deposit_amount AS Deposit_amount, A.Rental_price AS Rental_price from 
				(select distinct tools.ID as ID,tools.Abbr_desc as tname, tools.Rental_price AS Rental_price, tools.Deposit_amount AS Deposit_amount from tools
				where tools.Tool_type= '$tool_category') A 
				left join 
				(
				SELECT consist_of.Tool_id as ID FROM reservation,consist_of,tools
				where consist_of.Tool_id=tools.ID and tools.Tool_type='$tool_category' and consist_of.Reservation_no=reservation.Reservation_no and 
				((reservation.Start_date<='$eDate' and reservation.Start_date>='$sDate') or (reservation.End_date<='$eDate' and reservation.End_date>='$sDate'))
				Union
				select Tool_ID from service_order,tools
				where service_order.Tool_ID=tools.ID and tools.Tool_type='$tool_category' and ((Start_date<='$eDate' and Start_date>='$sDate') or (End_date<='$eDate' and End_date>='$sDate'))
				) B on A.ID=B.ID
				where B.ID is null;";

	$result = mysql_query($query);

	if (mysql_num_rows($result) == 0) {
	   print "<p>Tool not found, please try other tool types or another time period.</p>";
	   print "<a href='Check_Availability.php'>Back to Check Availability Page</a>";
	   exit();            
	}
} else {
	print "<p>Please enter tool type, start date and end date</p>";
	exit();
} 
?>


<!DOCTYPE  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <title>Tool Availability</title>
	    <!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
		<style>
			table, th, td {
			    border: 1px solid black;
			    border-collapse: collapse;
			}
			th, td {
			    padding: 5px;
			}
		</style>
	</head>

    <body>
        <div id="header">
             <h2>Tool Availability</h2>
        </div>

        <table>
		  <tr>
		    <th>Tool ID</th>
		    <th>Abbr Description</th>		
		    <th>Deposit($)</th>
		    <th>Price/Day($)</th>
		  </tr>
		  
		  <?php
		  	while ($row = mysql_fetch_array($result)) {
		  		print "<tr>";
		  		print "<td>{$row['ID']}</td>";
				print "<td>{$row['Abbr_desc']}</td>";
				print "<td>{$row['Deposit_amount']}</td>";
				print "<td>{$row['Rental_price']}</td>";
				print "</tr>";	
		  	}
		  ?>

		</table>
		<br>
		<hr>
		<br>

		<form action="Full_Description.php" method="GET" target="_blank">
			<label for="tool_id">Part #: &nbsp &nbsp </label><input type="text" name="Tool_ID">
			&nbsp &nbsp &nbsp <input type="submit" value="View Details"><br>
		</form>
		
		<form action="Customer_Main_Menu.php">
			<input type="submit" value="Back to Main Menu"><br>
		</form>
    </body>
</html>