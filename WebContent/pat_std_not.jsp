<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Particular teacher notice</title>
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
			<a href = "view_notice_std.jsp" style = " text-decoration: none; font-size: 35px; color: white;">Leave_request</a>
		</div>
		<div id = "hd2s3"><h1 style = "color: #ACE500">Notice to a particular student</h1></div>
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
	String uid = (String)session.getAttribute("uid");
	
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schoolmanagement", "root", ""); 
	Statement st= con.createStatement();
	Statement st1= con.createStatement();
	ResultSet rs=st.executeQuery("select * from `send_to` where stid = '"+ uid +"' ORDER BY nid DESC");
	
	String sdate, desc, sid, nid;
	
	while(rs.next()) {
		nid = rs.getString(1);
		ResultSet rs1=st1.executeQuery("select * from `notice` where nid = '"+ nid +"'");
		
		if(rs1.next()) {
			
			sid = rs1.getString(4);
			sdate = rs1.getString(3);
			desc = rs1.getString(2);
			
			%>
				<h2>Senders ID : <% out.println(sid); %></h2>
				<h2>Date Send : <% out.println(sdate); %></h2>
				<h2>Notice : <% out.println(desc); %></h2>
				<hr/>
			<%
		}
	}
%>
	</div>
</div>
<!-- Mid section end -->





</body>
</html>