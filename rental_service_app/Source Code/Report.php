<?php

/* connect to database */   
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
    die("Failed to connect to database");
}
mysql_select_db("handyman") or die("Unable to select database");

$errorMsg = "";
date_default_timezone_set('America/New_York');

?>


<!DOCTYPE  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <title>Monthly Report</title>
	    <!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
	    <!-- /*<style>
			table, th, td {
			    border: none;
			    border-collapse: collapse;
			}
			th, td {
			    padding: 5px;
			}
		</style>*/ -->
    </head>

    <body>
    	<div id="header">
                 <h1><center>Tool Rental Service Monthly Report</center></h1>
	    </div>

	    <hr>

	    <div id="header_tool">
                <h2><center>Tool Report</center></h2>
                <table border='0'>
					<tr>
						<td style="width:49%"></td>
						<td style="width:50%">
							<table border='1'>
							  <tr>
							    <th>Tool ID</th>
							    <th>Abbr Description</th>		
							    <th>Rental Profit</th>
							    <th>Cost of Tool</th>
							    <th>Total Profit</th>
							  </tr>
							  
							  <?php
							  	$current_month = date('Y-m');

							  	$query = "SELECT 
											    ID,
												Abbr_desc, 
											    Rental_Profit, 
											    Purchase_Price+Service_Cost Cost_of_Tool, 
											    Rental_Profit-Purchase_Price-Service_Cost Total_Profit
											FROM
											    (SELECT 
											        ID, 
											        Abbr_desc, 
											        Purchase_Price, 
											        Rental_Profit, 
											        SUM(Service_Cost) Service_Cost
											    FROM
											        (SELECT 
											            ID, 
											            Abbr_desc, 
											            Purchase_price, 
											            Rental_Profit,
											            IFNULL(Est_cost,0) Service_Cost
											        FROM 
											            (SELECT 
											                ID, 
											                Abbr_desc, 
											                Rental_Days, 


											                Rental_price, 
											                IFNULL(Rental_Days*Rental_price, 0) Rental_Profit,
											                Purchase_price 
											            FROM Tools a LEFT JOIN 
											                (SELECT  
											                    Tool_id, 
											                    DATEDIFF(End_date, Start_date)+1 as Rental_Days 
											                FROM 
											                    Reservation 
											                    LEFT JOIN Consist_of ON Reservation.Reservation_no = Consist_of.Reservation_no 
											                    WHERE End_date < '$current_month'
											                ) b 
											            ON a.ID = b.Tool_id) c 
											        LEFT JOIN (SELECT * FROM Service_order WHERE End_date < '$current_month') d
											        ON ID = Tool_ID) e
											    GROUP BY ID, Abbr_desc, Purchase_Price, Rental_Profit) f
											ORDER BY Total_Profit DESC";

								$result = mysql_query($query);

							  	while ($row = mysql_fetch_array($result)) {
							  		print "<tr>";
							  		print "<td align='center'>{$row['ID']}</td>";
									print "<td align='center'>{$row['Abbr_desc']}</td>";
									print "<td align='center'>{$row['Rental_Profit']}</td>";
									print "<td align='center'>{$row['Cost_of_Tool']}</td>";
									print "<td align='center'>{$row['Total_Profit']}</td>";
									print "</tr>";	
							  	}
							  ?>
							</table>
						</td>
						<td style="width:0%"></td>
					</tr>
				</table>
	    </div>

	    <div id="header_customer">
                <h2><center>Customer Report</center></h2>

                <table border='0'>
					<tr>
						<td style="width:39%"></td>
						<td style="width:45%">
							<table border='1'>
							  <tr>
							    <th>Name</th>
							    <th>Email</th>		
							    <th>Number of Tools Rented Last Month</th>
							  </tr>
							  
							  <?php
							  	$last_month = date('Y-m', strtotime('last month'));

							  	$query = "SELECT 
												Login,
											    Lname,
											    Fname,
											    Num_Tool_Rented
											FROM
											    (SELECT 
											        Customer_login,
											        COUNT(Tool_id) AS Num_Tool_Rented
											    FROM
											        (SELECT 
											            Customer_login,
											            Tool_id
											        FROM
											            Reservation a
											        LEFT JOIN Consist_of b ON a.Reservation_no = b.Reservation_no
											        WHERE DATE_FORMAT(Start_date,'%Y-%m') = '2016-03') c
											    GROUP BY Customer_login) d
											LEFT JOIN Customer e ON e.Login = d.Customer_login 
											ORDER BY Num_Tool_Rented DESC, Lname";

								$result = mysql_query($query);

							  	while ($row = mysql_fetch_array($result)) {
							  		print "<tr>";
							  		print "<td align='center'>{$row['Fname']} {$row['Lname']}</td>";
									print "<td align='center'>{$row['Login']}</td>";
									print "<td align='center'>{$row['Num_Tool_Rented']}</td>";
									print "</tr>";	
							  	}
							  ?>
							</table>
						</td>
						<td style="width:0%"></td>
					</tr>
				</table>
	    </div>

	    <div id="header_clerk">
                <h2><center>Clerk Report</center></h2>

                <table border='0'>
					<tr>
						<td style="width:44%"></td>
						<td style="width:55%">
							<table border='1'>
							  <tr>
							    <th>Name</th>
							    <th>Pick-Up Handled</th>		
							    <th>Drop-Off Handled</th>
							    <th>Total Handled in Last Month</th>
							  </tr>
							  
							  <?php
							  	$last_month = date('Y-m', strtotime('last month'));

							  	$query = "SELECT
											Fname,
										    Lname,
										    IFNULL(Num_of_PickUp, 0) Num_of_PickUp,
										    IFNULL(Num_of_DropOff, 0) Num_of_DropOff,
										    IFNULL(Num_of_PickUp, 0)+IFNULL(Num_of_DropOff, 0) Total_Handles
										FROM
											(SELECT
										        Fname,
										        Lname,
										        Num_of_PickUp,
										     	Login
										    FROM Clerk a
										    LEFT JOIN 
										        (SELECT 
										            Pick_up_clerk,
										            COUNT(Reservation_no) Num_of_PickUp,
										            Start_date,
										            End_date
										        FROM Reservation 
										        WHERE DATE_FORMAT(Start_date,'%Y-%m')  = '$last_month'
										        GROUP BY Pick_up_clerk) b
										    ON a.Login = b.Pick_up_clerk) d 
										LEFT JOIN 
											(SELECT 
										        Drop_off_clerk,
										        COUNT(Reservation_no) Num_of_DropOff,
										        Start_date,
										        End_date
										    FROM Reservation 
										    WHERE DATE_FORMAT(End_date,'%Y-%m')  = '$last_month'
										    GROUP BY Drop_off_clerk) c
										ON d.Login = c.Drop_off_clerk
										ORDER BY Total_Handles DESC";

								$result = mysql_query($query);

							  	while ($row = mysql_fetch_array($result)) {
							  		print "<tr>";
							  		print "<td align='center'>{$row['Fname']} {$row['Lname']}</td>";
									print "<td align='center'>{$row['Num_of_PickUp']}</td>";
									print "<td align='center'>{$row['Num_of_DropOff']}</td>";
									print "<td align='center'>{$row['Total_Handles']}</td>";
									print "</tr>";	
							  	}
							  ?>
							</table>
						</td>
						<td style="width:0%"></td>
					</tr>
				</table>

	    </div>

    <body>

</html>