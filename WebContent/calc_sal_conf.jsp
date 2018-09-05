<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salary Confirmation</title>
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
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.util.*"%>
	<%	
		String tid = request.getParameter("tid");
		double oth = Double.parseDouble(request.getParameter("oth"));
		double ded = Double.parseDouble(request.getParameter("ded"));
		double bon = Double.parseDouble(request.getParameter("bon"));
		int year = Calendar.getInstance().get(Calendar.YEAR);
		int month = (Calendar.getInstance().get(Calendar.MONTH));
		int att = 0;
		
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
		Statement st= con.createStatement(); 
		Statement st1= con.createStatement();
		Statement st2= con.createStatement();
		Statement st3= con.createStatement();
		ResultSet rs = st.executeQuery("select * from `teacher` where `id` = '" + tid + "'");
		ResultSet rs1 = st1.executeQuery("select * from `salary` where `tid` = '" + tid + "' and `year` = '"+ year +"' and `month` = '"+ month +"' and Status = 'notify'");
		
		if(rs.next()){
			if(!rs1.next()){
				ResultSet rs2 = st2.executeQuery("select * from `teacher_attendance` where `tid` = '" + tid + "' and `year` = '"+ year +"' and `month` = '"+ month +"' and `status` = 'present'");
				
				while(rs2.next()){
					att++;
				}
				
				double basic = rs.getDouble(3);
				double ot_Rate = rs.getDouble(4);
				double salary = (att * basic) + (ot_Rate * oth) + bon - ded;
				
				int i = st3.executeUpdate("INSERT INTO `salary`(`tid`, `year`, `month`, `Salary`) VALUES ('"+tid+"', '"+year+"', '"+month+"', '"+salary+"')");
				%>
					<h2 class = "green_correct">!!!Notified the teacher about his/her salary!!!</h2>
					<h2 class = "green_correct">!!!Calculated the salary successfully!!!</h2>
					<a href = "Calculate_Salary.jsp">Calculate_Salary</a>
				<%			}
			else{
				%>
				<h2 class = "red_wrong">The teacher's salary is already calculated for this month</h2>
				<a href = "Calculate_Salary.jsp">Calculate_Salary</a>
				<%
			}
		}
		else{
			%>
			<h2 class = "red_wrong">The teacher id is invalid</h2>
			<a href = "Calculate_Salary.jsp">Calculate_Salary</a>
			<%
		}
		%>
	</div>
</div>
<!-- Mid section end -->


	
		
</body>
</html>