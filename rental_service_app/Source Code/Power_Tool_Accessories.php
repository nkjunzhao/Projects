<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";

session_start();
if (!isset($_SESSION['passToNextPage'])) {
    header('Location: Add_New_Tool.php');
    exit();
}

$p = (string) $_SESSION['passToNextPage'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (empty($_POST['Accessories']) or !isset($_POST['Accessories'])) {
		$errorMsg = "You must insert Accessories info for power tools.";		
	}
	else {  
		$Accessories = mysql_real_escape_string($_POST['Accessories']);
		$arrayAccessories = explode(",", $Accessories);
		foreach ($arrayAccessories as $arrayAccessory) {
		    $query = "INSERT INTO `power_tool_accessories` (`Power_tool_id`, `Accessories`) VALUES" .
                 "('{$p}', '" . $arrayAccessory . "');";
		    if (!mysql_query($query)) {
			    print '<p class="error">Error: Failed to insert the new accessories. ' . $p . mysql_error() . '</p>';
		    }
		}
    }
}

mysql_close();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Handyman Add Accessories for Power Tools Interface</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="Power_Tool_Accessories.php" method="post">
				  
						<div class="title">Handyman Add Accessories for Power Tools</div>

						<div class="Accessories">
							<label class="Accessories">Specify ALL the Accessories of the Power Tool you typed in just now. [Please separate different accessories with ONLY comma (,)]</label>
							<label class="Accessories">(e.g. For Electric drills, you put "Drill head,Drill machine,Power charger" into below box):</label>
							<input type="text" name="Accessories" class="Accessories" />
						</div>
                        
						<input type="image" src="images/content-button-submit-hover.png" class="submit" />                              
				  
					<form/>
				                     
						   
				</div>
			
				<div class="clear"><br/></div> 
			   
			</div>    
      
			
		</div>
	</body>
</html>
