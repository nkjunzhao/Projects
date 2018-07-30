<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
mysql_select_db("handyman") or die( "Unable to select database");

$errorMsg = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (empty($_POST['username']) or empty($_POST['password'])) {
		$errorMsg = "Please provide both user name and password.";		
	}
	else {  
		
		$username = mysql_real_escape_string($_POST['username']);
		$password = mysql_real_escape_string($_POST['password']);
		$login_type = mysql_real_escape_string($_POST['login_type']);
        $query_user_check = "SELECT * FROM $login_type WHERE Login = '$username'";
        $result_user_check = mysql_query($query_user_check);
        if (mysql_num_rows($result_user_check)==0 and $login_type == "Customer") {
            /* no such user */
			header('Location: New_User.php');
            exit();
        }
        else {
            $query = "SELECT * FROM $login_type WHERE Login = '$username' AND Password = '$password'";  
            $result = mysql_query($query);
            if (mysql_num_rows($result) == 0) {
                /* login failed */
                $errorMsg = "Login failed.  Please try again.";
            }
            else {
                if ($login_type == "Customer") {
                    /* login successful */
                    session_start();
                    $_SESSION['username'] = $username;
			
                    /* redirect to the profile page */
                    header('Location: Customer_Main_Menu.php');
                    exit();
                }
                elseif ($login_type == "Clerk") {
                    /* login successful */
                    session_start();
                    $_SESSION['username'] = $username;
			
                    /* redirect to the profile page */
                    header('Location: Clerk_Main_Menu.php');
                    exit();
                }
            }
        }
    }

}
  
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Handyman Tools Rental Login</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="signup_text_box">
		 
					<form action="login.php" method="post">
				  
						<div class="title">Handyman Tools Rental Login</div>
							<div class="login_form_row">
							<label class="login_label">User Name:</label>
							<input type="text" name="username" class="login_input" />
						</div>
										
						<div class="login_form_row">
							<label class="login_label">Password:</label>
							<input type="password" name="password" class="login_input" />
						</div>   
						<div class="login_form_row">
                            <label class="login_type"></label>
                            <input type="radio" name="login_type" value="Customer" class="login_type" > Customer 
                            <input type="radio" name="login_type" value="Clerk" class="login_type"> Clerk <br><br><br>
                        </div>
						<input type="image" src="images/login.gif" class="login" />                              
				  
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