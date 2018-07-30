<?php

/* connect to database */	
$connect = mysql_connect("localhost:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (empty($_POST['username']) or empty($_POST['password']) or empty($_POST['confirm_password']) or 
        empty($_POST['fname']) or empty($_POST['lname']) or empty($_POST['hphone'])){
		$errorMsg = "Except work phone, all other information are required.";
	}
    else if ($_POST['password']!=$_POST['confirm_password']) {
		$errorMsg = "Password and confirm password isn't match";       
    }
    else {
        $username = mysql_real_escape_string($_POST['username']);
        $password = mysql_real_escape_string($_POST['password']);
        $fname = mysql_real_escape_string($_POST['fname']);
        $lname = mysql_real_escape_string($_POST['lname']);
        $hphone = mysql_real_escape_string($_POST['hphone']); 
        $address = mysql_real_escape_string($_POST['address']);   
        $wphone = mysql_real_escape_string($_POST['wphone']);
        $query = "INSERT INTO Customer (Login,  Lname,  Fname, Password, Address, Home_phone, Work_phone)
             VALUES ('$username', '$lname', '$fname', '$password', '$address', '$hphone', '$wphone')"; 
        if (!mysql_query($query)) {
            print '<p class="error">Error: Failed to add user. ' . mysql_error() . '</p>';
        }      
        else {
            /* login successful */
            session_start();
            $_SESSION['username'] = $username;
			
            /* redirect to the profile page */
            header('Location: Customer_Main_Menu.php');
            exit();
        }           
    }
}
  
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Create a profile</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="new_user.php" method="post">
				  
						<div class="title">Create a Profile</div>
							<div class="signup_form_row">
                                <label class="signup_label">Email Address(Login):</label>
                                <input type="email" name="username" class="signup_input" />
                            </div>
                            <div class="signup_form_row">
                                <label class="signup_label">Password:</label>
                                <input type="password" name="password" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">Confirm Password:</label>
                                <input type="password" name="confirm_password" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">First Name:</label>
                                <input type="text" name="fname" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">Last Name:</label>
                                <input type="text" name="lname" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">Home Phone:</label>
                                <input type="number" name="hphone" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">Work Phone:</label>
                                <input type="number" name="wphone" class="signup_input" />
                            </div> 
                            <div class="signup_form_row">
                                <label class="signup_label">Address:</label>
                                <input type="textarea" name="address" class="signup_input" rows="5" cols="40" />
                            <br><br>    
                            <input type="image" src="images/content-button-submit-hover.png" class="signup" />                              
				  
					<form/>
				  
					<?php
					if (!empty($errorMsg)) {
						print "<div class='signup_form_row' style='color:red'>$errorMsg</div>";
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