<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send Notice</title>
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
			<br/>
			<a href = "not_p_stud.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">Particular student</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "not_a_stud.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">All students</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "not_p_class.jsp" class = "link_col" style = " text-decoration: none; font-size: 30px; color: white;">Particular class</a>
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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%	
	String temp = request.getParameter("id");
	int id = Integer.parseInt(temp);
	
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schoolmanagement", "root", ""); 
	Statement st= con.createStatement(); 
	
	if(id == 1){ //Sending notice to a particular teacher
		String tid = request.getParameter("tid");
		String desc = request.getParameter("desc");
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String sdate = df.format(date);
		String sid = (String)session.getAttribute("uid");
		
		ResultSet rs = st.executeQuery("select * from teacher where `tid` = '" + tid + "'");
	
		if(rs.next()) {
			int i = st.executeUpdate("insert into `notice` (`descr`, `sdate`, `stid`) values ('"+desc+"','"+sdate+"','"+sid+"')");
			int j = st.executeUpdate("insert into `send_to` (`tid`) values ('"+tid+"')");
			out.println("<h2 class = 'green_correct'>Notice Sent To The Teacher Successfully!!!</h2>");
			%><a href = "not_p_tec.jsp">back</a><%
		}
		else{
			out.println("<h2 class = 'red_wrong'>There is no such teacher!!!</h2>");
			%><a href = "not_p_tec.jsp">back</a><%
		}
	}
	else if(id == 2){ //Sending notice to a particular student
		String stid = request.getParameter("stid");
		String desc = request.getParameter("desc");
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String sdate = df.format(date);
		String sid = (String)session.getAttribute("uid");
		
		ResultSet rs = st.executeQuery("select * from student where `stid` = '" + stid + "'");
	
		if(rs.next()) {
			int i = st.executeUpdate("insert into `notice` (`descr`, `sdate`, `stid`) values ('"+desc+"','"+sdate+"','"+sid+"')");
			int j = st.executeUpdate("insert into `send_to` (`stid`) values ('"+stid+"')");
			out.println("<h2 class = 'green_correct'>Notice Sent To The Student Successfully!!!</h2>");
			%><a href = "not_p_stud.jsp">back</a><%
		}
		else{
			out.println("<h2 class = 'red_wrong'>There is no such student!!!</h2>");
			%><a href = "not_p_stud.jsp">back</a><%
		}
	}
	else if(id == 3){ //Sending a notice to all teachers
		
		String desc = request.getParameter("desc");
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String sdate = df.format(date);
		String sid = (String)session.getAttribute("uid");
		int t_com = 1; 
		
		int i = st.executeUpdate("insert into `notice` (`descr`, `sdate`, `stid`) values ('"+desc+"','"+sdate+"','"+sid+"')");
		int j = st.executeUpdate("insert into `send_to` (`t_com`) values ('"+ t_com +"')");
		out.println("<h2 class = 'green_correct'>Notice Sent To All Teachers Successfully!!!</h2>");
		%><a href = "not_a_tec.jsp">back</a><%
	}
	else if(id == 4){ //Sending a notice to all students
		
		String desc = request.getParameter("desc");
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String sdate = df.format(date);
		String sid = (String)session.getAttribute("uid");
		int s_com = 1; 
		
		int i = st.executeUpdate("insert into `notice` (`descr`, `sdate`, `stid`) values ('"+desc+"','"+sdate+"','"+sid+"')");
		int j = st.executeUpdate("insert into `send_to` (`s_com`) values ('"+ s_com +"')");
		out.println("<h2 class = 'green_correct'>Notice Sent To All Students Successfully!!!</h2>");
		%><a href = "not_a_stud.jsp">back</a><%
	}
	else if(id == 5){ //Sending notice to a particular class
	
		String cid;
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();	
		String sid = request.getParameter("sec");
		String ctype = request.getParameter("class");
		String uid = (String)session.getAttribute("uid");
		String desc = request.getParameter("desc");	
		String sdate = df.format(date);
		
		ResultSet rs = st.executeQuery("select * from class where `secid` = '" + sid + "' AND `class` = '" + ctype + "'");
		
		if(rs.next()) {
			cid = rs.getString(1);
			int i = st.executeUpdate("insert into `notice` (`descr`, `sdate`, `stid`) values ('"+desc+"','"+sdate+"','"+uid+"')");
			int j = st.executeUpdate("insert into `send_to` (`cid`) values ('"+cid+"')");
			out.println("<h2 class = 'green_correct'>Notice Sent To The Student Successfully!!!</h2>");
			%><a href = "not_p_class.jsp">back</a><%	
		}
		else{
			out.println("<h2 class = 'red_wrong'>Warning: No class!!!</h2>");
			%><a href = "not_p_class.jsp">back</a><%
		}
		
		
		
		
		
	}
	else{
		out.println("<h2 class = 'red_wrong'>Something went wrong!!!</h2>");
	}
		
			
		
	
%>
	
	
	</div>
</div>
<!-- Mid section end -->


</body>
</html>