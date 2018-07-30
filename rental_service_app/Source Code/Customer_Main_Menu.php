<?php
/* connect to database */	
$connect = mysql_connect("localhost:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");
session_start();
if (!isset($_SESSION['username'])) {
	header('Location: login.php');
	exit();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $login_selection = mysql_real_escape_string($_POST['login_selection']);
	if ($login_selection == "View Profile") {
		header('Location: View_Customer_Profile.php');
        exit();
	}
	if ($login_selection == "Check Tool Availability") {
		header('Location: Check_Availability.php');	
        exit();
	}
	if ($login_selection == "Make Reservation") {
		header('Location: Make_Reservation.php');
        exit();
	}
	if ($login_selection == "Exit") {
		header('Location: Login.php');
        exit();
	}   
}    
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Main Menu</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>
		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">

		 
					<form action="Customer_Main_Menu.php" method="post">
				  
						<div class="title">Main Menu</div>
						<div class="login_button">
                            <input type="submit" name="login_selection" value="View Profile" /> <br/>
                        </div>
						
                        <div class="login_button">
                            <input type="submit" name="login_selection" value="Check Tool Availability" /> 
                        </div>   
                       
                        <div class="login_button">
                            <input type="submit" name="login_selection" value="Make Reservation" /> 
                        </div>
                    
                        <div class="login_button">
                            <input type="submit" name="login_selection" value="Exit" class="login_text"/> <br>
                        </div>                        
				  
					<form/>
				  
					<?php
					if (!empty($errorMsg)) {
						print "<div class='login_form_row' style='color:red'>$errorMsg</div>";
					}
					?>                    
						   
				</div>
			
				<div class="clear"><br/></div> 
			   
			</div>    
      
			<div id="footer">                                              
				<div class="right_footer"><a href="http://csstemplatesmarket.com"  target="_blank">http://csstemplatesmarket.com</a></div>       
			</div>
		</div>
	</body>
</html>