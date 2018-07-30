<?php

/* connect to database */	

$connect = mysql_connect("localhost:3306", "gtuser", "gtuser123");
if (!$connect) {
	die("Failed to connect to database");
}
session_start();
mysql_select_db("handyman") or die( "Unable to select database");
$errorMsg = "";

?>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>Make Reservation</title>
		<link rel="stylesheet" type="text/css" href="6400prj.css" />
	</head>
  
	<body>
		<div class="container">
			<div id="header">
				<div class="logo"><img src="images/handyman_logo.gif" border="0" alt="" title="" /></div>       
			</div>
			<p class="caption">Make Reservation</p>
					<div class="poster sbposter">
						<div class="input_row" style="float:left">
							<label class="login_label">Starting Date</label>
							<input type="date" name="starting_date" class="login_input" id="Sdate" />
						</div>                     
						<div class="input_row" style="float:left">
							<label class="login_label">Ending Date</label>
							<input type="date" name="ending_date" class="login_input" id="Edate" />
						</div>
						<div style="clear:left">
                        <span class="sub-caption" style="float:left;margin:10px auto auto 0px"> Type of Tool</span>
						<span class="sub-caption" style="float:right;margin:10px 200px auto auto"> Tool</span>
						</div>
						<div style="clear:left" id="tool_group">
							<div style="clear:left">
                            <select name="tool_type" id="select11" style="float:left;margin:10px auto auto 0px" onchange="oc(this.id)">
                                <option value="Select Tool Type">Select Tool Type</option>
                                <option value="Power Tool">Power Tools</option>
                                <option value="Handy Tool">Handy Tools</option>
                                <option value="Construction Equipment">Construction Equipment</option>
                            </select>
							
						
						
							<select name="tool" id="select12" style="float:right;margin:10px 150px auto auto">
							</select>
							</div>
						</div>
                    </div>
				    

					
					
           

				  
				    <div >
							<button class="button button1" id="submit"/> Submit</button>
							<button class="button button1" id="del"/> Delete last tool</button>
                            <button class="button button1" id="add"/> Add more tools</button>
							
                    </div>
					

		</div>
		<script type="text/javascript">
		var s1= document.getElementById("select11");
		var s2 = document.getElementById("select12");
		var s3= document.getElementById("Sdate");
		var s4 = document.getElementById("Edate");
		var s5= document.getElementById("add");
		var s6= document.getElementById("tool_group");
		var s7= document.getElementById("del");
		var s8= document.getElementById("submit");
		//onchange("select12"); //Change options after page load
		s5.onclick =addonclick;
		s7.onclick =delonclick;
		s8.onclick = subonlick;
		function oc(id) {
			id=id.slice(0,id.length-1);
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(id+"2").innerHTML = xmlhttp.responseText;
				}
			};
			xmlhttp.open("GET", "getinfo.php?type=" + document.getElementById(id+"1").value+"&sdate="+s3.value+"&edate="+s4.value, true);
			xmlhttp.send();

		};

		
		var count = 1;
		var sendData = [];
		function addonclick(){
			var s6html = s6.innerHTML;
			sendData.push(document.getElementById("select"+count+"2").value);
			count = count+1;
			var id1="select"+count+"1";
			var id2="select"+count+"2";
			s6html= s6html+	"<div style=\"clear:left\">";
			s6html= s6html+ "<select name=\"tool_type\" id=\""+id1+"\" style=\"float:left;margin:10px auto auto 0px\" onchange=\"oc(this.id)\">";
			s6html= s6html+ "<option value=\"Select Tool Type\">Select Tool Type</option>";
			s6html= s6html+ "<option value=\"Power Tool\">Power Tools</option>";
			s6html= s6html+ "<option value=\"Handy Tool\">Handy Tools</option>";
			s6html= s6html+ "<option value=\"Construction Equipment\">Construction Equipment</option>";
			s6html= s6html+ "</select>";
		

			s6html=s6html+"<select name=\"tool\" id=\""+id2+"\" style=\"float:right;margin:10px 150px auto auto\">";
			s6html=s6html+"</select>";
			s6html=s6html+"</div> ";
			s6.innerHTML=s6html;

			
		}
		
				
		function delonclick(){
			sendData.pop();
			var s6html = s6.innerHTML;
			var id1="select"+count+"1";
			var id2="select"+count+"2"
			var pos1 = s6html.indexOf("<div style=\"clear:left\"><select name=\"tool_type\" id=\""+id1+"\" style=\"float:left;margin:10px auto auto 0px\" onchange=\"oc(this.id)\"");
			s6html=s6html.slice(0,pos1);
			s6.innerHTML=s6html;0
			count = count-1;
			
		}
		
		function subonlick(){
			sendData.push(document.getElementById("select"+count+"2").value);
			var url ="Resvervation_Summary.php?tool="
			for (i = 0; i < sendData.length; i++) {
				if(i>0){
				url=url+"_";
				}
				url = url+sendData[i];
			}
			url=url+"&sDate="+s3.value+"&eDate="+s4.value;
			window.location.href=url;

			
		}
	
	
	

</script>   
	</body>
</html>



