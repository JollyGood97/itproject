<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calculate Salary</title>
<link rel="stylesheet" href="assests/css/style.css"> 
</head>
<body>



<!-- Header section start -->
<header>
	<div id = "hd1">
		<div id = "hds1"><img src="assests/image/icon.png" height = "80" width = "80">
			<h1><% out.println((String)session.getAttribute("uid")); %></h1>
			<hr>
		</div>
	</div>
	<div id = "hd2">
		<div id = "hd2s1">
			<div style = "float: right; margin-right: 25px; margin-top: 5px;"><a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: black;">LOGOUT</a></div>
		</div>
		<div id = "hd2s2">
			<a href = "all_lv_req.jsp" style = " text-decoration: none; font-size: 30px; color: white;">View all leave request</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "notice.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Send Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "resource_manager.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Resource Manager</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "Calculate_Salary.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Calculate_Salary</a>
		</div>
		<div id = "hd2s3"><h1 style = "color: #ACE500">Calaculate_Salary</h1></div>
		
	</div>
	
</header>
<!-- Header section end -->



<!-- Mid section start -->
<div style = "height: 100%; width: 100%; float: top; text-align: center;">
	<div style = "height: 600px; background-color: #1a414c; width: 25%; float: left;">
		
		
		
	<ul>
			<li><a href="#">Home</a></li> 
    		<li><a href="#">User Management</a></li>
       		<li class="active"><a href="addSubject.html">Subject Management</a></li>
    		<li><a href="#">Exam Management</a></li>
    		<li><a href="#">Library Management</a></li> 
    		<li><a href="#">Attendance Management</a></li>
    		<li><a href="#">Classroom Management</a></li>      
    		<li><a href="#">CSS</a></li>
    		<li><a href="#">About</a></li> 
    		<li><a href="#">Classroom Management</a></li>
			<li><a href="#">Classroom Management</a></li>             
  </ul>
		
				
		
	</div>
	<br/>
	<script>
	function Validate(){
		
		var tid = document.getElementById('tid').value;
		var oth = document.getElementById('oth').value;
		var ded = document.getElementById('ded').value;
		var bon = document.getElementById('bon').value;
		
		if(tid == "" || tid == null){
			alert("Teacher Id field cannot be empty");
			return false;
		}
		else{
			if(oth == "" || oth == null){
				alert("OT hours field cannot be empty");
				return false;
			}
			else{
				if(ded == "" || ded == null){
					alert("Deduction field cannot be empty");
					return false;
				}
				else{
					if(bon == "" || bon == null){
						alert("Bonus field cannot be empty");
						return false;
					}
					else{
						if(!oth.match(/^[0-9]+$/)){
							alert("Noob!!! dont you know you cant have alphabetic letters in OT hours field!!!");
							return false;
						}
						else if(!ded.match(/^[0-9]+$/)){
							
							alert('Noob!!! dont you know you cant have alphabetic letters in Deduction field!!!');
							return false;
						}
						else if(!bon.match(/^[0-9]+$/)){
							
							alert('Noob!!! dont you know you cant have alphabetic letters in Bonus field!!!');
							return false;
						}
						else if(!tid.match(/^[0-9a-zA-Z]+$/)){
							
							alert('Noob!!! dont you know you should have alphanumeric value in Teaher ID field!!!');
							return false;
						}
						else
							return true;
					}
				}
			}
		}
		
		
		
	}
	</script>
	<form method = "post" action = "calc_sal_conf.jsp" onsubmit="return Validate()">
		<h2>Teacher Id: <input type = "text" name = "tid" id="tid"/> </h2>
		<h2>OT hours: <input type = "text" id="oth" name = "oth"/> </h2>
		<h2>Deduction: <input type = "text" id="ded" name = "ded"/> </h2>
		<h2>Bonus: <input type = "text" id="bon" name = "bon"/> </h2>
		<input type = "submit" id = "sub" value = "Submit"/>
	</form>
	</div>
</div>
<!-- Mid section end -->
	
</body>
</html>