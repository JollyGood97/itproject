<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave notification</title>
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
		<div id = "hd2s3"><h1 style = "color: #ACE500">Leave notification</h1></div>
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
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%	
		String tid = (String)session.getAttribute("uid");
		int lid;
		String adate;
		String rdate;
		int noOfDays;
		String reason;
		String approve;
	
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schoolmanagement", "root", ""); 
		Statement st= con.createStatement(); 
		ResultSet rs = st.executeQuery("select * from `leave` where tid ='"+tid+"'");
		
		while(rs.next()){
			
			
			lid = rs.getInt(1);
			adate = rs.getString(3);
			rdate = rs.getString(4);
			noOfDays = rs.getInt(5);
			reason = rs.getString(6);
			approve = rs.getString(7);
			if(approve == null || approve == ""){
				%> <h2>Leave Id: <% out.println(lid); %></h2> <br/><%
				%> <h2>Leave Reason: <% out.println(reason); %></h2> <br/><%
				%> <h2 class = "red_wrong">Pending Request</h2> <hr/><%
			}
			else if(approve.equals("Accept")){
				%> <h2>Leave Id: <% out.println(lid); %></h2> <br/><%
				%> <h2>Leave Reason: <% out.println(reason); %></h2> <br/><%
				%> <h2 class = "green_correct">Request Accepted</h2> <hr/><%
			}
			else{
				%> <h2>Leave Id: <% out.println(lid); %></h2> <br/><%
				%> <h2>Leave Reason: <% out.println(reason); %></h2> <br/><%
				%> <h2 class = "red_wrong">Request Rejected</h2> <hr/><%
			}
			
		}
		
	%>
	</div>
</div>
<!-- Mid section end -->










	
</body>
</html>