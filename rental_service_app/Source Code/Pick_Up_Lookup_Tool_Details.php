<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>Handyman Reservation Pick Up Lookup Tool Details</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="main_container">
	<div id="header">
	<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
</div>

<div class="center_content"><div class="text_box">
<form action="Pick_Up_3.php" method="post">

<div class="title">Handyman Reservation Pick Up Lookup Tool Details</div>

<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";


if (empty($_GET['Tool_detail_id'])) {
	$errorMsg = "Tool ID of which you desire to check availability was not passed to this page.";	
} else {
    echo "Tool Details you desire to checked:";
    $queryGetToolDetail = "SELECT * FROM `tools` WHERE `ID` = '{$_GET['Tool_detail_id']}';";
    $results = mysql_query($queryGetToolDetail);
    if (!$results) {
		print '<p class="error">Error: Failed to get Tool Details. ' . $p . mysql_error() . '</p>';
	}
    echo "<table border=1>
        <tr>
        <th> ID </th>
        <th> Purchase_price </th>
        <th> Deposit_amount </th>
        <th> Rental_price </th>
        <th> Abbr_desc </th>
        <th> Full_desc </th>
        <th> Date_sold </th>
        <th> Tool_type </th>
        <th> Adding_clerk </th>
        <th> Selling_clerk </th>
        </tr>";
    while ($record = mysql_fetch_array($results)) {
        echo "<tr>";
        echo "<td>".$record['ID']."</td>";
        echo "<td>".$record['Purchase_price']."</td>";
        echo "<td>".$record['Deposit_amount']."</td>";
        echo "<td>".$record['Rental_price']."</td>";
        echo "<td>".$record['Abbr_desc']."</td>";
        echo "<td>".$record['Full_desc']."</td>";
        echo "<td>".$record['Date_sold']."</td>";
        echo "<td>".$record['Tool_type']."</td>";
        echo "<td>".$record['Adding_clerk']."</td>";
        echo "<td>".$record['Selling_clerk']."</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    
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
