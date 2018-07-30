<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start(); ?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>Handyman Reservation Pick Up Step 2</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="main_container">
	<div id="header">
	<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
</div>

<div class="center_content"><div class="text_box">

<form action='<?php echo "Pick_Up_Update_to_DB.php?Reservation_id=".$_GET['Reservation_id']; ?>' method="post">
<div class="title">Handyman Reservation Pick Up Step 2</div>
<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";
if (!isset($_SESSION['username'])) {
    header('Location: Login.php');
    exit();
} else {
    $Pick_up_clerk = $_SESSION['username'];
}

if (empty($_GET['Reservation_id'])) {
	$errorMsg = "Reservation ID was not passed to this page.";	
} else {
    echo "<p>".(string) $_SESSION['username']."</p>";
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
<div class="Tool_detail">
	<label class="Tool_detail">Tool ID: </label>
	<input type="text" name="Tool_detail" class="Tool_detail" id="Tool_detail"/>
	<script language="javascript">
    function open_windows_for_detail() {
        var check_tool_id = document.getElementById("Tool_detail").value;
        var tmpstring = "Pick_Up_Lookup_Tool_Details.php?Tool_detail_id=".concat(check_tool_id);
        window.open(tmpstring,"demo");
    }
    </script>
	<input name="Go_to_details" type="image" value="Go_to_details" src="images/check_tool_details.png" class="submit" onclick="open_windows_for_detail()"/>
</div>

<hr>
<div class="Credit_card">
	<label class="Credit_card">Credit_card Number (all 16 digits): </label>
	<input type="text" name="Credit_card" class="Credit_card"/>
</div>
<div class="Expiration_date">
	<label class="Expiration_date">Expiration_date (YYYY-MM): </label>
	<input type="text" name="Expiration_date" class="Expiration_date"/>
</div>
<div class="Pay">
<script language="javascript">
    function open_windows_for_contract() {
        var get_reservation_id = '<?php echo $_GET['Reservation_id']; ?>';
        var tmpstring = "Rental_Contract.php?Reservation_id=".concat(get_reservation_id);
        window.open(tmpstring,"demo");
    }
</script>
<input name="Pay" type="image" value="Pay" src="images/pay.png" class="submit" onclick="open_windows_for_contract()"/>
</div>


<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");
$errorMsg = "";

if (!isset($_SESSION['username'])) {
    header('Location: Login.php');
    exit();
} else {
    $Pick_up_clerk = $_SESSION['username'];
}
#$Pick_up_clerk = "dkoopman";

$Credit_card = mysql_real_escape_string($_POST['Credit_card']);
date_default_timezone_set('America/New_York');
$Expiration_date = mysql_real_escape_string($_POST['Expiration_date']) . "-01";
$Expiration_date = date('Y-m-d', strtotime($Expiration_date));

if (empty($_GET['Reservation_id'])) {
	$errorMsg = "Reservation ID was not passed to this page.";	
} elseif (isset($_POST['Pay'])) {
    # Pay button was clicked
    $queryPickupUpdate = "UPDATE reservation SET `Pick_up_clerk` = '{$Pick_up_clerk}', `Credit_card_no` = '{$Credit_card}', " . 
                         "`Credit_card_exp_date` = '{$Expiration_date}' WHERE `Reservation_no` = '{$_GET['Reservation_id']}';";
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
