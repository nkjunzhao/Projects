<?php

/* connect to database */	

$connect = mysql_connect("localhost:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
session_start();
mysql_select_db("handyman") or die( "Unable to select database");
$errorMsg = "";
$toollist = $_GET["tool"];
$toolarray=explode("_",$toollist);
$eDate=$_GET['eDate'];
$sDate=$_GET['sDate'];
$daydiff=floor((abs(strtotime($_GET['eDate']) - strtotime($_GET['sDate']))/(60*60*24)))+1;
$rentP=0;
$deposit=0;
$_SESSION['eDate']=$eDate;
$_SESSION['sDate']=$sDate;
$_SESSION['tool']=$toollist;
?>



<!DOCTYPE html>
	<head>

		<title>Clerk main menu</title>

		<link rel="stylesheet" type="text/css" href="6400prj.css" />

	</head>
	<body>
		<div class="container">
			<div>
			<p class="caption"><b>Reservation Summary</b></p>
			<hr>
			</div>
			<div class="poster blposter">
				<p class="sub-caption"><b>Tools Desired</b></p>
				<hr>
				<ol>
					<?php
					foreach($toolarray as $id){
					$id=mysql_real_escape_string($id);
					$query_tool= "select abbr_desc,Rental_price,Deposit_amount from tools where tools.ID='$id';";
					$row =mysql_fetch_assoc(mysql_query($query_tool));
					echo "<li>".$row['abbr_desc']."</li>";
					$rentP= $rentP+$daydiff*$row['Rental_price'];
					$deposit = $deposit + $row['Deposit_amount'];
					}
					?>
				</ol>
			</div>
			<div class="poster slposter">
				<p class="sub-caption"><b>Start Date</b></p>
				<hr>
				<p><?php echo $_GET['sDate']?></p>
			</div>
			<div class="poster slposter">
			<p class="sub-caption"><b>End Date</b></p>
			<hr>
			<p><?php echo $_GET['eDate']?></p>
			</div>
			<div class="poster slposter">
			<p class="sub-caption"><b>Total Rental Price</b></p>
			<p><?php echo $rentP ?></p>
			<hr>
			</div>
			<div class="poster slposter">
			<p class="sub-caption"><b>Total Deposit Required</b></p>
			<p><?php echo $deposit ?></p>
			</div>
			<div>
				<form method="get" action="Make_Reservation.php">
					<button class="button button1">reset</button>
				</form>
				<form method="get" action="Reservation_Final.php">
					<button class="button button2">submit</button>
				</form>
			</div>
		</div>
	</body>