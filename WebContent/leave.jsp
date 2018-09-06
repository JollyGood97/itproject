<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Request</title>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	Date date = new Date();
 	String user = (String)session.getAttribute("uid");
 %>
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
			<a href = "leave.jsp" style = " text-decoration: none; font-size: 35px; color: white;">Leave_request</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "t_send_notice.jsp" style = " text-decoration: none; font-size: 35px; color: white;">Send Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "view_notice_tec.jsp" style = " text-decoration: none; font-size: 35px; color: white;">View_Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "leave_notification.jsp" style = " text-decoration: none; font-size: 35px; color: white;">Leave_notification</a>
		</div>
		<div id = "hd2s3"><h1 style = "color: #ACE500">Leave Request Form</h1></div>
	</div>
	<br/>
</header>
<!-- Header section end -->



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
	<form action = "leave_req_db.jsp" method = "post">
		<h2>ID: <% out.println(user); %></h2>
		<h2>Reason: <textarea name = "reason" required></textarea></h2>
		<h2>Requested date: <input type = "date" name = "rdate" required></h2>
		<h2>No. of Days: <input type = "text" name = "ndate" required></h2>
		<h2>Current Date: <% out.println(df.format(date)); %></h2>
		<input type = "submit" value = "Submit" id = "sub">
	</form>
	</div>
</div>
<!-- Mid section end -->



</body>
</html>