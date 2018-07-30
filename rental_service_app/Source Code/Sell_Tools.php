<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: Login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (empty($_POST['Tool_id']) or !isset($_POST['Tool_id'])) {
		$errorMsg = (string) $_SESSION['username'].": Please make sure you specified a valid tool ID.";		
	}
	else {  
		
		$Tool_id = mysql_real_escape_string($_POST['Tool_id']);
		$Selling_clerk = $_SESSION['username'];
		#$Selling_clerk = "jzhao";
		date_default_timezone_set('America/New_York');
		$today = date('Y-m-d');
		
		$queryGetSellingPrice = "SELECT `Purchase_price` FROM `tools` WHERE `ID` = '{$Tool_id}';";
		$querySell = "UPDATE `tools` SET `Selling_clerk` = '{$Selling_clerk}', `Date_sold` = '{$today}' WHERE `ID` = '{$Tool_id}';";
		
		if (!mysql_query($queryGetSellingPrice)) {
			print '<p class="error">Error: The Tool ID you typed is not in our Database. ' . mysql_error() . '</p>';
		} else {
		    echo "<table>";
		    $result = mysql_query($queryGetSellingPrice);
		    $row = mysql_fetch_assoc($result);
		    mysql_free_result($result);
		    $Selling_price = $row["Purchase_price"] / 2;          #We assume the default selling price is half of original purchase price.
		    echo "<tr><td>"."The suggested Selling price (assumed to be half of purchase price) is:". (String) $Selling_price ."</td></tr>";
		    echo "</table>";
		    
		    if (!mysql_query($querySell)) {
			    print '<p class="error">Error: Failed to update the tool selling infromation into database. ' . mysql_error() . '</p>';
		    }
		}
		
    }
}

mysql_close();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Handyman Sell Old Tools Interface</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="Sell_Tools.php" method="post">
				  
						<div class="title">Handyman Sell Old Tools Interface</div>
						
						<div class="Tool_id">
						    
							<label class="Tool_id">The ID of the old tool you desire to sell:</label>
							<input type="text" name="Tool_id" class="Tool_id" />
						</div>
						
						
						<input type="image" src="images/sell_tool.png" class="submit" />

				  
					<form/>
				  
					<?php
					if (!empty($errorMsg)) {
						print "<div class='login_form_row' style='color:red'>$errorMsg</div>";
					}
					?>                    
						   
				</div>
			
				<div class="clear"><br/></div> 
			   
			</div>    
      
			
		</div>
	</body>
</html>
