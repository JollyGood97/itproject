<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add_Resource_Db</title>
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
		String tid = request.getParameter("tid");
		String pos = request.getParameter("pos");
		String sid = request.getParameter("sec");
		String cid = request.getParameter("class");
			
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schoolmanagement", "root", ""); 
		
		Statement st5= con.createStatement(); 
		ResultSet rs5 = st5.executeQuery("select * from teacher where tid ='"+tid+"'");
		
		Statement st= con.createStatement(); 
		ResultSet rs = st.executeQuery("select * from teacher_position where workid ='"+wid+"'");
		
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select * from teacher_position where tid ='"+tid+"' AND position = 'Sectional_head'");
		
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("select * from teacher_position where tid ='"+tid+"' AND position = 'Class_teacher'");
		
		Statement st3 = con.createStatement();
		ResultSet rs3 = st3.executeQuery("select * from teacher_position where classid = '"+cid+"' AND position ='class_teacher' AND sectionid = '"+sid+"'");
		
		Statement st4 = con.createStatement();
		ResultSet rs4 = st4.executeQuery("select * from teacher_position where position ='Sectional_head' AND sectionid = '"+sid+"' AND classid = 'classAll'");
		
		if(rs5.next()){
			if(!rs.next()){
				if(!rs1.next()){
					if(!rs2.next()){
						if(!rs3.next()){
							if(!rs4.next()){
								int x = st.executeUpdate("insert into teacher_position (`workid`, `tid`, `position`, `sectionid`, `classid`) values ('"+wid+"','"+tid+"', '"+pos+"', '"+sid+"', '"+cid+"')");	
								out.println("<h3 class = 'green_correct'>Teachers resources added successfully</h3>");
								%><a href = "assign_resource.jsp">back</a><%
							}
							else{
								out.println("<h3 class = 'red_wrong'>Warning : There is a sectional head for this particular section</h3>");
								%><a href = "assign_resource.jsp">back</a><%
							}
						}
						else{
							out.println("<h3 class = 'red_wrong'>Warning : There is a class teacher for this particular class</h3>");
							%><a href = "assign_resource.jsp">back</a><%
						}
					}
					else{
						out.println("<h3 class = 'red_wrong'>Warning : The teacher is already a class teacher</h3>");
						%><a href = "assign_resource.jsp">back</a><%
					}
				}
				else{
					out.println("<h3 class = 'red_wrong'>Warning : The teacher is already a sectional head</h3>");
					%><a href = "assign_resource.jsp">back</a><%
				}
			}
			else{
				out.println("<h3 class = 'red_wrong'>Warning : The Work Id is already assigned</h3>");
				%><a href = "assign_resource.jsp">back</a><%
			}
		}else{
			out.println("<h3 class = 'red_wrong'>Warning : Teacher id is incorrect</h3>");
			%><a href = "assign_resource.jsp">back</a><%
		}
	%>
	</div>
</div>
<!-- Mid section end -->

</body>
</html>