<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%	
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		session.putValue("uid",un);
		String uid = (String)session.getAttribute("uid");
		out.println("U can enter the system </h3>");
		out.println("username = " + un);
		out.println("Varaiable uid = " + uid);
	%>
	<a href = "teacher.jsp">Teacher_Page</a>
	<a href = "admin.jsp">Admin_Page</a>
	<a href = "student.jsp">Student_Page</a>
</body>
</html>