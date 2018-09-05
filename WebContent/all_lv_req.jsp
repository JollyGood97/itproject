<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select * from `leave`");
	
	String name, tid, reason, rdate, adate;
	int lid, noOfDays;
	
	while(rs.next()) {
		
		String app = rs.getString(7);
		if(app == null) {
			lid = rs.getInt(1);
			tid = rs.getString(2);
			adate = rs.getString(3);
			rdate = rs.getString(4);
			noOfDays = rs.getInt(5);
			reason = rs.getString(6);
			
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery("select * from `teacher` where id = '"+ tid +"'");
			
			if(rs1.next()){
				name = rs1.getString(2);
			}
			else{
				name = "null";
			}
			
			out.println("<tr><td><h2 class = 'link_col'>" + "ID : " + lid + "<br/></td><td>" + "Name : " + name + "<br/></td><td>" + "Requested Date : " + rdate + "<br/></td><td>" + "Applied Date : " + adate + "<br/></td><td>" + "No-Of Days : " + noOfDays + "<br/></td><td>" + "Reason : " + reason + "<br/></h2></td><tr>");
			%>
				<td><a href="acc_or_rej.jsp?lid=<%=lid%>" style = "color: #28A4D8; text-decoration: none; font-size: 20px;">Accept/Reject</a></td>
				</tr>
				<hr/>
				<br/><br/>
			<%
		
		}
	}
%>
	</div>
</div>
<!-- Mid section end -->


</body>
</html>