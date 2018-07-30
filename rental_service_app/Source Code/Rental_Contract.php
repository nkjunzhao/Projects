<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start(); ?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>Handyman Reservation Pick Up Rental Contract</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="main_container">
	<div id="header">
	<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
</div>

<div class="center_content"><div class="text_box">

<form action='<?php echo "Pick_Up_Update_to_DB.php?Reservation_id=".$_GET['Reservation_id']; ?>' method="post">
<div class="title">Handyman Reservation Pick Up Rental Contract</div>
<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";

if (empty($_GET['Reservation_id'])) {
	$errorMsg = "Reservation ID was not passed to this page.";	
} else {
    echo "Reservation Information:";
    $queryGetReservInfo = "SELECT A.*, B.Lname, B.Fname " .
                          "FROM `reservation` AS A LEFT JOIN `customer` AS B ON A.Customer_login = B.Login " .
                          "WHERE `Reservation_no` = '{$_GET['Reservation_id']}';";
    $results = mysql_query($queryGetReservInfo);
    if (!$results) {
		print '<p class="error">Error: Failed to get reservation information. ' . $p . mysql_error() . '</p>';
	}
    echo "<table border=1>
        <th> Customer_name </th>
        <th> Reservation_no </th>
        <th> Credit_card_no </th>
        <th> Start_date </th>
        <th> End_date </th>
        <th> Pick_up_clerk </th>
        </tr>";
    while ($record = mysql_fetch_array($results)) {
        echo "<tr>";
        echo "<td>".$record['Fname']." ".$record['Lname']."</td>";
        echo "<td>".$record['Reservation_no']."</td>";
        echo "<td>".$record['Credit_card_no']."</td>";
        echo "<td>".$record['Start_date']."</td>";
        echo "<td>".$record['End_date']."</td>";
        echo "<td>".$record['Pick_up_clerk']."</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "<br/>\n";
    
    $queryGetToolInfo = "SELECT C.*, D.Abbr_desc FROM (SELECT A.*, B.Tool_id " .
                        "FROM `reservation` AS A LEFT JOIN `consist_of` AS B ON A.Reservation_no = B.Reservation_no " .
                        "WHERE A.`Reservation_no` = '{$_GET['Reservation_id']}') AS C LEFT JOIN `tools` AS D " .
                        "ON C.Tool_id = D.ID;";
    $results2 = mysql_query($queryGetToolInfo);
    if (!$results2) {
		print '<p class="error">Error: Failed to get tool information. ' . $p . mysql_error() . '</p>';
	}
	echo "<table border=1>
        <th> Tool_id </th>
        <th> Abbr_desc </th>
        </tr>";
    while ($record = mysql_fetch_array($results2)) {
        echo "<tr>";
        echo "<td>".$record['Tool_id']."</td>";
        echo "<td>".$record['Abbr_desc']."</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "<br/>\n";

    $queryGetPrice = "SELECT sum(B.Deposit_amount) Deposit_amount, sum(B.Rental_price) Rental_price " .
                        "FROM `consist_of` AS A LEFT JOIN `tools` AS B ON A.Tool_id = B.ID " .
                        "WHERE A.`Reservation_no` = '{$_GET['Reservation_id']}' ";
    $results3 = mysql_query($queryGetPrice);
    if (!$results3) {
		print '<p class="error">Error: Failed to get total prices. ' . $p . mysql_error() . '</p>';
	}
	while ($record3 = mysql_fetch_array($results3)) {
	    echo "Rental Price: $" . $record3['Rental_price'] . "<br/>\n";
	    echo "Total Deposit: $" . $record3['Deposit_amount'] . "<br/>\n";
	}
	echo "Signiture: ____________________________________________________";
	echo "<br/>\n";
}

mysql_close();
  
?>
<form/>

	               
<?php
if (!empty($errorMsg)) {
	print "<div class='login_form_row' style='color:red'>$errorMsg</div>";
}
?>                    
						   
</div>
	<div class="clear"><br/></div> 
</div>    
      
</div></div>
</body>
</html>