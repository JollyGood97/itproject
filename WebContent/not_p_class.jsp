<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sent Notice To A Particular Class</title>
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
			<<a href = "all_lv_req.jsp" style = " text-decoration: none; font-size: 30px; color: white;">View all leave request</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "notice.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Send Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "resource_manager.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Resource Manager</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "Calculate_Salary.jsp" style = " text-decoration: none; font-size: 30px; color: white;">Calculate_Salary</a>
			<br/>
			<a href = "not_p_stud.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">Particular student</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "not_a_stud.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">All students</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "not_p_class.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">Particular class</a>
		</div>
		<div id = "hd2s3"><h1 style = "color: #ACE500">Sent Notice To A Particular Class</h1></div>
	</div>
	<br/>
</header>
<!-- Header section end -->
<% int id = 5; %>
<!-- Mid section start -->
<div style = "height: 100%; width: 100%; float: top;">
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
	<div style = "float: right; width: 75%; text-align: center">
	<br/>
	<form action = "send_notice.jsp?id=<%=id%>" method = "post">
	<h2>Section id : <select name = "sec">
		  <option value="sLKG">LKG</option>
		  <option value="sUKG">UKG</option>
		  <option value="s001">Grade 1</option>
		  <option value="s002">Grade 2</option>
		  <option value="s003">Grade 3</option>
		  <option value="s004">Grade 4</option>
		  <option value="s005">Grade 5</option>
		</select> </h2>
		
	<h2>Class Type : <select name = "class">  				
						<option value="classA">Class A</option>
						<option value="classB">Class B</option>
		  				<option value="classC">Class C</option>
		  				<option value="classD">Class D</option>
					</select> </h2>
	<h2>Description : <textarea name = "desc" required></textarea> </h2>
	<input type = "submit" value = "Submit" id = "sub"/>
</form>
	</div>
</div>
<!-- Mid section end -->




</body>
</html>