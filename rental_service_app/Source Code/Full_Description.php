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

if (!(empty($_GET['Tool_ID']))) {
	$tool_id = $_GET['Tool_ID'];

	$query = "SELECT ID, Purchase_price, Rental_price, Deposit_amount, Abbr_desc, Full_desc, Tool_type, Adding_clerk 
				FROM Tools WHERE ID = '$tool_id'";

	$result = mysql_query($query);

	if (mysql_num_rows($result) == 0) {
	   print "<p>Tool not found, please try other tool types or another time period.</p>";
	   print "<a href='Check_Availability.php'>Back to Previous Page</a>";
	   exit();            
	}
} else {
	print "<p>Please enter tool ID</p>";
	exit();
} 
?>

<!DOCTYPE  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <title>Full Description</title>
	    <!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
		<style>
			table, th, td {
			    border-width:5px;	
    			border-style:hidden;
			}
			th, td {
			    padding: 1px;
			}
		</style>
	</head>

    <body>
        <div id="header">
             <h2>Tool Full Description</h2>
        </div>

        <table width="80%">
		  <?php
		  	while ($row = mysql_fetch_array($result)) {
		  		print "<tr>";
		  		print "<td height='40'>Tool ID:</td>";
				print "<td height='40'>{$row['ID']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Purchase Price:</td>";
				print "<td height='40'>{$row['Purchase_price']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Rental Price:</td>";
				print "<td height='40'>{$row['Rental_price']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Deposit Amount:</td>";
				print "<td height='40'>{$row['Deposit_amount']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Abbreviate Description:</td>";
				print "<td height='40'>{$row['Abbr_desc']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Full Description:</td>";
				print "<td height='40'>{$row['Full_desc']}</td>";
				print "</tr>";

				print "<tr>";
		  		print "<td height='40'>Tool Type:</td>";
				print "<td height='40'>{$row['Tool_type']}</td>";
				print "</tr>";
		  	}
		  ?>

		</table>
		<br>
		
		<form action="Check_Availability.php">
			<input type="submit" value="Back to Check Availability Page"><br>
		</form>

		<form action="Customer_Main_Menu.php">
			<input type="submit" value="Back to Main Menu"><br>
		</form>
    </body>
</html>