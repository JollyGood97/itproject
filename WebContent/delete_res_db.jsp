<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting resource from db</title>
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
		<div id = "hd2s3"><h1 style = "color: #ACE500">Select a resource and delete it</h1></div>
		
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
	<div id = "res_main">
	<br/>
		<div id = "r_m_sub">
			<div style = "margin-top: 0px; float: left; width: 32.8%;"><a href = "assign_resource.jsp" class = "lin"><p style = "margin-top: 8px; color: white">Assign Resource</p></a></div>
			<div style = "margin-top: 0px; float: left; width: 33.3%;"><a href = "view_all_res_upd.jsp" class = "lin"><p style = "margin-top: 8px; color: white">View All Resources To Update</p></a></div>
			<div style = "margin-top: 0px; float: left; width: 33.3%;"><a href = "Delete_resource.jsp" class = "lin"><p style = "margin-top: 8px; color: white">Delete Resource</p></a></div>
		</div>
		<br/>
		<br/>
		<br/>
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			String wid = request.getParameter("wid");
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
			Statement st= con.createStatement(); 
		
			ResultSet rs;
			int i = st.executeUpdate("DELETE FROM teacher_position where workid='"+wid+"'");
			out.println("<h3 class='green_correct'>Deleted Successfully</h3>");
		%>	
		<a href = "Delete_resource.jsp">back</a>
	</div>
</div>
<!-- Mid section end -->

</body>
</html>