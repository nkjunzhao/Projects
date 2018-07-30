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
		$Filling_clerk_login = $_SESSION['username'];
		#$Filling_clerk_login = "dkoopman";
		date_default_timezone_set('America/New_York');
		$Starting_date = mysql_real_escape_string($_POST['Starting_date']);
		$Ending_date = mysql_real_escape_string($_POST['Ending_date']);
		$Repair_cost = mysql_real_escape_string($_POST['Repair_cost']);
		
		$query = "INSERT INTO service_order (Tool_ID, Filling_clerk_login, Start_date, End_date, Est_cost) VALUES" .
                 "('{$Tool_id}','{$Filling_clerk_login}', '{$Starting_date}', '{$Ending_date}', '{$Repair_cost}');";		    
		    
		if (!mysql_query($query)) {
			print '<p class="error">Error: Failed to update the service order information into database. ' . mysql_error() . '</p>';
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
		 
					<form action="Service_Order.php" method="post">
				  
						<div class="title">Handyman Service Order Request Interface (Hold Tools for Repair)</div>

						<div class="Tool_id">
							<label class="Tool_id">Tool ID (Please type in a valid tool ID):</label>
							<input type="text" name="Tool_id" class="Tool_id" />
						</div>
						
						<div class="Starting_date">
							<label class="Starting_date">Starting_date (YYYY-MM-DD):</label>
							<input type="text" name="Starting_date" class="Starting_date" />
						</div>
						
						<div class="Ending_date">
							<label class="Ending_date">Ending_date (YYYY-MM-DD):</label>
							<input type="text" name="Ending_date" class="Ending_date" />
						</div>
						
						<div class="Repair_cost">
							<label class="Repair_cost">Estimating Cost of Repair (numbers only) $</label>
							<input type="text" name="Repair_cost" class="Repair_cost" />
						</div>
						
						<input type="image" src="images/submit_repair_service_order.png" class="submit" />

				  
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
