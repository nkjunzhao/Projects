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

	if (empty($_POST['Purchase_price']) or !is_numeric($_POST['Purchase_price']) or !isset($_POST['Purchase_price'])
	    or empty($_POST['Rental_price']) or !is_numeric($_POST['Rental_price']) or !isset($_POST['Rental_price'])
	    or empty($_POST['Deposit_amount']) or !is_numeric($_POST['Deposit_amount']) or !isset($_POST['Deposit_amount'])
	    or empty($_POST['Abbr_desc']) or !isset($_POST['Abbr_desc'])
	    or empty($_POST['Full_desc']) or !isset($_POST['Full_desc'])) {
		$errorMsg = (string) $_SESSION['username'].": Please make sure you set legitimate values in *ALL* of the following fields: purchase price, rental price, deposit amount, abbreviated description and full description.";		
	}
	else {  
		
		$Purchase_price = mysql_real_escape_string($_POST['Purchase_price']);
		$Rental_price = mysql_real_escape_string($_POST['Rental_price']);
		$Deposit_amount = mysql_real_escape_string($_POST['Deposit_amount']);
		$Abbr_desc = mysql_real_escape_string($_POST['Abbr_desc']);
		$Full_desc = mysql_real_escape_string($_POST['Full_desc']);
		$Date_sold = null;
		$Tool_type = $_POST['Tool_type'];
		$Adding_clerk = $_SESSION['username'];
				
		if (isset($_POST['Power_Tools'])) {
        # Green button was clicked
            if ($Tool_type == "Power Tool") {
                $query = "INSERT INTO tools (Purchase_price, Rental_price, Deposit_amount, Abbr_desc, Full_desc, Date_sold, Tool_type, Adding_clerk, Selling_clerk) VALUES" .
                 "('{$Purchase_price}','{$Rental_price}', '{$Deposit_amount}', '{$Abbr_desc}', '{$Full_desc}', '{$Date_sold}', '{$Tool_type}', '{$Adding_clerk}', NULL);";
		        if (!mysql_query($query)) {
			        print '<p class="error">Error: Failed to insert the new tool. ' . mysql_error() . '</p>';
		        } else {
		            $_SESSION['passToNextPage'] = mysql_insert_id();
                    header('Location: Power_Tool_Accessories.php');
		        }
            } else {
                $errorMsg = "The GREEN button is for Power Tools only! Please retype the information you just typed in and click the BLUE button instead.";
            }
        }
        elseif (isset($_POST['Non_Power_Tools'])) {
        # Blue button was clicked
            if ($Tool_type != "Power Tool") {
                $query = "INSERT INTO tools (Purchase_price, Rental_price, Deposit_amount, Abbr_desc, Full_desc, Date_sold, Tool_type, Adding_clerk, Selling_clerk) VALUES" .
                 "('{$Purchase_price}','{$Rental_price}', '{$Deposit_amount}', '{$Abbr_desc}', '{$Full_desc}', '{$Date_sold}', '{$Tool_type}', '{$Adding_clerk}', NULL);";
		        if (!mysql_query($query)) {
			        print '<p class="error">Error: Failed to insert the new tool. ' . mysql_error() . '</p>';
		        }
            } else {
                $errorMsg = "The BLUE button is for Handy Tools and Construction Equipment only! Please retype the information you just typed in and click the GREEN button instead.";
            }
        }
		
    }
}

mysql_close();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Handyman Add New Tools Interface</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="Add_New_Tool.php" method="post">
				  
						<div class="title">Handyman Add New Tools Interface</div>

						<div class="Abbr_desc">
							<label class="Abbr_desc">Abbreviated Description:</label>
							<input type="text" name="Abbr_desc" class="Abbr_desc" />
						</div>
										
						<div class="Purchase_price">
							<label class="Purchase_price">Purchase Price ($):</label>
							<input type="text" name="Purchase_price" class="Purchase_price" />
						</div>  
						
						<div class="Rental_price">
							<label class="Rental_price">Rental Price (per day) ($):</label>
							<input type="text" name="Rental_price" class="Rental_price" />
						</div> 
						
						<div class="Deposit_amount">
							<label class="Deposit_amount">Deposit Amount ($):</label>
							<input type="text" name="Deposit_amount" class="Deposit_amount" />
						</div> 
						
						<div class="Full_desc">
							<label class="Full_desc">Full Description:</label>
							<input type="text" name="Full_desc" class="Full_desc" />
						</div>
						
						<div class="Deposit_amount"> 
						    <label class="Tool_type">Tool Type:</label>
						    <select name="Tool_type" id="Tool_type">
						        <option value="0" selected="selected">Please select a Tool Type...</option>
                                <option value="Handy Tool">Handy Tool</option>
                                <option value="Power Tool">Power Tool</option>
                                <option value="Construction Equipment">Construction Equipment</option>
                            </select>
                        </div>
                        
                        <script language="javascript">
                            function open_win_oncondition() {
                                var check_tool_type = document.getElementById("Tool_type").value;
                                if (check_tool_type == "Power Tool") {
                                    window.open('Power_Tool_Accessories.php');
                                } else {
                                    window.location = "Add_New_Tool.php";
                                }
                            }
                        </script>
                        
                        <div class="Accessories">
							<label class="Accessories">If you selected **Power Tools** above, please click the green button to submit and specify ALL accessories!</label>
						</div>
                        <input name="Power_Tools" type="image" value="Accessories" src="images/submit_power_tool.png" class="submit"/>
                        
                        <div class="HC">
							<label class="HC">If you selected **Handy Tools** OR **Construction Equipment** above, please click the blue button to only submit!</label>
						</div>
						<input name="Non_Power_Tools" type="image" value="HC" src="images/submit_handy_construction.png" class="submit" />                    
				  
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
