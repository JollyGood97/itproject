<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave_request_db</title>
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
			<a href = "leave.jsp" style = " text-decoration: none; font-size: 45px; color: white;">Leave_request</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "t_send_notice.jsp" style = " text-decoration: none; font-size: 45px; color: white;">Send Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "view_notice_tec.jsp" style = " text-decoration: none; font-size: 45px; color: white;">View_Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
		<div id = "hd2s3"><h1 style = "color: #b0e24a">Leave Request Form</h1></div>
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
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.*"%>
	
	<%	
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date cdate = new Date();
		Date rdate = new Date();
		String user = (String)session.getAttribute("uid");
		String reason = request.getParameter("reason");
		rdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("rdate"));
		int ndate = Integer.parseInt(request.getParameter("ndate"));
		long day1 = rdate.getTime();
		long day2 = cdate.getTime();
		long ded = day1 - day2;
		String xcdate = df.format(cdate);	
		String xrdate = df.format(rdate);
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
		Statement st= con.createStatement(); 
		ResultSet rs;  
	
		if(ded <= 50167604){
		%>
			<p class = "red_wrong">The selected date is an old date!!! <b>OR</b> the selected date is the current date!!! So please change it.</p>
			<h3 class = "normal_font">!!!click <a href = "leave.jsp">here</a> to go to the previous page!!!</h3>
			
		<%	
		}
		else{
			int i=st.executeUpdate("insert into `leave` (`tid`, `app_date`, `req_date`, `no_dates`, `reason`) values ('"+user+"','"+xcdate+"','"+xrdate+"', '"+ndate+"', '"+reason+"')");
			out.println("<h1 class = 'green_correct'>You have submitted your leave request successfully!!!</h3>");
			%><a href = "leave.jsp">back</a><%
		}
%>
	
	
	</div>
</div>
<!-- Mid section end -->
	
</body>
</html>