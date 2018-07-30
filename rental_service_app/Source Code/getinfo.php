<?php

/* connect to database */	
$connect = mysql_connect("127.0.0.1:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}

mysql_select_db("handyman") or die( "Unable to select database");

$tool_type = mysql_real_escape_string($_GET["type"]);
$starting_date = mysql_real_escape_string($_GET["sdate"]);
$ending_date = mysql_real_escape_string($_GET["edate"]);


$query1 = "Select A.ID as result, A.tname as tname from 
(select distinct tools.ID as ID,tools.Abbr_desc as tname from tools
where tools.Tool_type= '$tool_type') A 
left join 
(
SELECT consist_of.Tool_id as ID FROM reservation,consist_of,tools
where consist_of.Tool_id=tools.ID and tools.Tool_type='$tool_type' and consist_of.Reservation_no=reservation.Reservation_no and 
((reservation.Start_date<='$ending_date' and reservation.Start_date>='$starting_date') or (reservation.End_date<='$ending_date' and reservation.End_date>='$starting_date'))
Union
select Tool_ID from service_order,tools
where service_order.Tool_ID=tools.ID and tools.Tool_type='$tool_type' and ((Start_date<='$ending_date' and Start_date>='$starting_date') or (End_date<='$ending_date' and End_date>='$starting_date'))
) B on A.ID=B.ID
where B.ID is null;"; 
$result = mysql_query($query1);
while($row=mysql_fetch_assoc($result)){
echo "<option value=\"".$row['result']."\">".$row['result'].",".$row['tname']."</option>";
}		
$errorMsg = "";
?>
