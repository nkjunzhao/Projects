<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start(); ?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>Handyman Reservation Drop Off Step 2</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="main_container">
	<div id="header">
	<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
</div>

<div class="center_content"><div class="text_box">

<form action='<?php echo "Drop_Off_Update_to_DB.php?Reservation_id=".$_GET['Reservation_id']; ?>' method="post">
<div class="title">Handyman Reservation Drop Off Step 2</div>
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
    $queryGetReservInfo = "SELECT * FROM `reservation` WHERE `Reservation_no` = '{$_GET['Reservation_id']}';";
    $results = mysql_query($queryGetReservInfo);
    if (!$results) {
		print '<p class="error">Error: Failed to get reservation information. ' . $p . mysql_error() . '</p>';
	}
    echo "<table border=1>
        <tr>
        <th> Reservation_no </th>
        <th> Start_date </th>
        <th> End_date </th>
        </tr>";
    while ($record = mysql_fetch_array($results)) {
        echo "<tr>";
        echo "<td>".$record['Reservation_no']."</td>";
        echo "<td>".$record['Start_date']."</td>";
        echo "<td>".$record['End_date']."</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    echo "<br/>\n";
    echo "Tool Information:";
    $queryGetToolInfo = "SELECT A.*, B.Abbr_desc, B.Deposit_amount, B.Rental_price " .
                        "FROM `consist_of` AS A LEFT JOIN `tools` AS B ON A.Tool_id = B.ID " .
                        "WHERE A.`Reservation_no` = '{$_GET['Reservation_id']}';";
    $results2 = mysql_query($queryGetToolInfo);
    if (!$results2) {
		print '<p class="error">Error: Failed to get tool information. ' . $p . mysql_error() . '</p>';
	}
    echo "<table border=1>
        <tr>
        <th> Reservation_no </th>
        <th> Tool_id </th>
        <th> Abbr_desc </th>
        <th> Deposit_amount </th>
        <th> Rental_price </th>
        </tr>";
    while ($record2 = mysql_fetch_array($results2)) {
        echo "<tr>";
        echo "<td>".$record2['Reservation_no']."</td>";
        echo "<td>".$record2['Tool_id']."</td>";
        echo "<td>".$record2['Abbr_desc']."</td>";
        echo "<td>".$record2['Deposit_amount']."</td>";
        echo "<td>".$record2['Rental_price']."</td>";
        echo "</tr>";
    }
    echo "</table>"; echo "<br/>\n";

    $queryGetPrice = "SELECT sum(B.Deposit_amount) Deposit_amount, sum(B.Rental_price) Rental_price " .
                        "FROM `consist_of` AS A LEFT JOIN `tools` AS B ON A.Tool_id = B.ID " .
                        "WHERE A.`Reservation_no` = '{$_GET['Reservation_id']}' ";
    $results3 = mysql_query($queryGetPrice);
    if (!$results3) {
		print '<p class="error">Error: Failed to get total prices. ' . $p . mysql_error() . '</p>';
	}
	while ($record3 = mysql_fetch_array($results3)) {
	    echo "Total Deposit: " . $record3['Deposit_amount'] . "<br/>\n";
	    echo "Total Rental: " . $record3['Rental_price'];
	}
	echo "<br/>\n";
}

mysql_close();
  
?>
<form/>

<hr>
<div class="Expiration_date">
	<label class="Expiration_date">Please make sure *ALL* tools listed above have been returned before click on the pink button!</label>
</div>

<div class="Drop_off_confirm">
<script language="javascript">
    function open_windows_for_receipt() {
        var check_reservation_id = '<?php echo $_GET['Reservation_id']; ?>';
        var tmpstring = "Rental_Receipt.php?Reservation_id=".concat(check_reservation_id);
        window.open(tmpstring,"demo");
    }
</script>
<input name="Drop_off_confirm" type="image" value="Drop_off_confirm" src="images/drop_off_confirm.png" class="submit" onclick="open_windows_for_receipt()"/>
</div>


<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");
$errorMsg = "";

$Drop_Off_clerk = $_SESSION['username'];
#$Drop_Off_clerk = "jzhao";

if (empty($_GET['Reservation_id'])) {
	$errorMsg = "Reservation ID was not passed to this page.";	
} elseif (isset($_POST['Drop_off_confirm'])) {
    # Pay button was clicked
    $queryPickupUpdate = "UPDATE reservation SET `Drop_Off_clerk` = '{$Drop_Off_clerk}' WHERE `Reservation_no` = '{$_GET['Reservation_id']}';";
	if (!mysql_query($queryPickupUpdate)) {
		print '<p class="error">Error: Failed to update pick-up information into database. ' . mysql_error() . '</p>';
	}
}


mysql_close();
?>


				  
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
