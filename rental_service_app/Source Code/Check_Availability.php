<?php

/* connect to database */   
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
    die("Failed to connect to database");
}
mysql_select_db("handyman") or die("Unable to select database");

// session_start();
// if (!isset($_SESSION['email'])) {
//     header('Location: login.php');
//     exit();
// }

$errorMsg = "";
date_default_timezone_set('America/New_York');

/* if form was submitted, then save new data */
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (empty($_POST['category'])) {
        $errorMsg = "Please select tool category.";      
    } elseif (empty($_POST['Start_Date']) or empty($_POST['Start_Date'])) {
        $errorMsg = "Please enter Start Date and End Date for the rent of tools.";
    } elseif (!is_date($_POST['Start_Date']) or !is_date($_POST['End_Date'])) {
        $errorMsg = "Please enter valid Start Date and End Date";
    } elseif (strtotime($_POST['Start_Date']) > strtotime($_POST['End_Date'])) {
        $errorMsg = "Start Date must be prior to End Date";
    } elseif (strtotime($_POST['Start_Date']) < strtotime(date("Y-m-d"))) {
        $errorMsg = "You cannot check tool availability earlier than today";
    } else {
        /* redirect to the Tool_Availability page */
        header("Location: Tool_Availability.php?category=" . $_POST['category'] . "&Start_Date=" . $_POST['Start_Date'] . "&End_Date=" . $_POST['End_Date']);
        exit();
    }            
}

function is_date( $str ) { 
    $stamp = strtotime( $str ); 
    if (!is_numeric($stamp)) { 
        return false; 
    } 
    $month = date( 'm', $stamp ); 
    $day   = date( 'd', $stamp ); 
    $year  = date( 'Y', $stamp ); 
  
    if (checkdate($month, $day, $year)) { 
        return true; 
    } 
    return false; 
}
?>

<!DOCTYPE  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
      <head>
	    <title>Check Tool Availability</title>
	    <!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
      </head>
	
      <body>
            <div id="header">
                 <h2>Select Tool Category</h2>
	        </div>
	    <hr>

            <form action="Check_Availability.php" method="POST">
                <br>
                <input type="radio" name="category" value="Handy Tool"> Hand Tools<br>
                <br>
                <input type="radio" name="category" value="Construction Equipment"> Construction Equipment<br>
                <br>
                <input type="radio" name="category" value="Power Tool"> Power Tools<br>
                <br>
                
                <hr>
                
                <br>
                <label for="startDate">Start Date: </label><input type="text" name="Start_Date" value="yyyy-mm-dd"><br/>
                <br>
                <label for="endDate">End Date: </label><input type="text" name="End_Date" value="yyyy-mm-dd"><br/>
                <br>
                
                <input type="submit" value="Submit">
                
            </form>

            <div id="errMsg">
                <?php
                    if (!empty($errorMsg)) {echo "<div style='color:red'><font size='6'>$errorMsg</font></div>";}
                ?> 
            </div>
            
      </body>
</html>