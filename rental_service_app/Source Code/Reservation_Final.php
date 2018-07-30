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
$userName = $_SESSION['username'];
mysql_select_db("handyman") or die( "Unable to select database");
$errorMsg = "";
$toollist = $_SESSION['tool'];
$toolarray=explode("_",$toollist);
$eDate=$_SESSION['eDate'];
$sDate=$_SESSION['sDate'];
$daydiff=floor((abs(strtotime($eDate) - strtotime($sDate))/(60*60*24)))+1;
$rentP=0;
$deposit=0;

foreach($toolarray as $id){
	$query = "Select A.ID as result from 
(select distinct tools.ID as ID from tools
where tools.ID= '$id') A 
left join 
(
SELECT consist_of.Tool_id as ID FROM reservation,consist_of
where consist_of.Tool_id='$id' and consist_of.Reservation_no=reservation.Reservation_no and 
((reservation.Start_date<='$eDate' and reservation.Start_date>='$sDate') or (reservation.End_date<='$eDate' and reservation.End_date>='$sDate'))
Union
select Tool_ID from service_order 
where service_order.Tool_ID='$id' and ((Start_date<='$eDate' and Start_date>='$sDate') or (End_date<='$eDate' and End_date>='$sDate'))
) B on A.ID=B.ID
where B.ID is null;"; 
$result= mysql_query($query);
$row=mysql_fetch_assoc($result);
$al=$row['result'];
if($row['result']!=$id){
		header('Location: error.php?invalidID='.$id);
        exit();  
}
	
}

$updateReservation="INSERT INTO reservation (Customer_login, Start_date, End_date) VALUES
('$userName','$sDate','$eDate');";
$result=mysql_query($updateReservation);

$getRno="SELECT Reservation_no as resno
FROM reservation
WHERE Customer_login= '$userName'and Start_date = '$sDate';";
$result=mysql_query($getRno);
$resIDline=mysql_fetch_assoc($result);
$resID=$resIDline['resno'];

foreach($toolarray as $id){
$updateTool="
INSERT INTO consist_of (Reservation_no, Tool_id) VALUES ('$resID',
'$id');
";
$result=mysql_query($updateTool);
}
?>

<!DOCTYPE html>
	<head>

		<title>Clerk main menu</title>

		<link rel="stylesheet" type="text/css" href="6400prj.css" />

	</head>
	<body>
		<div class="container">
			<div>
			<p class="caption"><b>Your Reservation</b></p>
			<p class="id">ID: <?php echo $resID ?></p>
			<hr>
			</div>
			<div class="poster blposter">
				<p class="sub-caption"><b>Tools Rented</b></p>
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
				<p><?php echo $sDate?></p>
			</div>
			<div class="poster slposter">
			<p class="sub-caption"><b>End Date</b></p>
			<hr>
			<p><?php echo $eDate?></p>
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
			<form method="get" action="Customer_Main_Menu.php">
				<button class="button button1">Back to main menu</button>
			</form>
			</div>
		</div>
	</body>