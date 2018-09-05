<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class student notice</title>
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
			<a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: white;">Admins</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: white;">Teachers</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: white;">Students</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: white;">Staffs</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "logout.jsp" style = " text-decoration: none; font-size: 50px; color: white;">Parents</a>
		</div>
		<div id = "hd2s3"><h1 style = "color: #ACE500">Class student notice</h1></div>
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
	String id = (String)session.getAttribute("uid");
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
	Statement st= con.createStatement();
	Statement st1= con.createStatement();
	Statement st2= con.createStatement();
	ResultSet rs=st.executeQuery("select * from `student` where `id` = '"+ id +"'");
	
	if(rs.next()){
		String classid = rs.getString("class");
		ResultSet rs1=st1.executeQuery("select * from `send_to` where cid = '"+ classid +"'");
		
		while(rs1.next()) {
			String nid = rs1.getString(1);
			ResultSet rs2=st2.executeQuery("select * from `notice` where nid = '"+ nid +"'");
			//out.println("Working");
			
			if(rs2.next()) {
				
				String sender = rs2.getString(4);
				String sdate = rs2.getString(3);
				String desc = rs2.getString(2);
				
				%>
					<h2>Senders ID : <% out.println(sender); %></h2>
					<h2>Date Send : <% out.println(sdate); %></h2>
					<h2>Notice : <% out.println(desc); %></h2>
					<hr/>
				<%
			
			}
			else{
				out.println("Something went wrong");
			}
		}
	}
	else{
		out.println("Something went wrong");
	}
	%>
	</div>
</div>
<!-- Mid section end -->

</body>
</html>