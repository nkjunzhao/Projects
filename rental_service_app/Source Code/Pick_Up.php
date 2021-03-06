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
$_SESSION['username'] = $_SESSION['username'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (empty($_POST['Reservation_id']) or !isset($_POST['Reservation_id'])) {
		$errorMsg = "Please make sure you have a valid reservation ID.";		
	} else {
	    header('Location: Pick_Up_Update_to_DB.php?Reservation_id=' . $_POST['Reservation_id']);
	    exit();
	}	

}
  
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Handyman Reservation Pick Up Step 1</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="Pick_Up.php" method="post">
				  
						<div class="title">Handyman Reservation Pick Up Step 1</div>

						<div class="Reservation_id">
							<label class="Reservation_id">What is the Reservation ID?</label>
							<input type="text" name="Reservation_id" class="Reservation_id" />
						</div>
						
						<input name="Go_to_details" type="image" value="Go_to_details" src="images/go_to_reservation_details.png" class="submit" />
                        				  
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
