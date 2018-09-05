<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance_DB</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.*"%>
	
	<%
		int[] status = request.getParameterValues("state");
		
		for(int i = 0; i < status.length; i++){
			out.println(status[i]);
		}
		//String a = "1";
		//out.println("Status of IT17044400:- " + request.getParameter(a));
		/*DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = df.format(date);
		
		int stdCount;
		String sid[];
		int status[];
		
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select count(*) AS stdCount from student");
		
		if(rs.next()){
			stdCount = rs.getInt("stdCount");
		}
		else{
			stdCount = 0;
		}
		
		sid = new String[stdCount];
		status = new int[stdCount];
*/
		//Problem******************************************************************************************************
	/*	for(int i = 0; i < stdCount; i++){
			sid[i] = request.getParameter(sid[i]);
			status[i] = request.getParameter(status[i]);
		}
	*/	//Problem******************************************************************************************************
		
	/*	for(int c = 0; c < stdCount; c++){
			int x = st.executeUpdate("insert into student_attendance (`sid`, `date`, `status`) values ('"+sid[c]+"','"+str+"', '"+status[c]+"')");	
		}
		
		if(stdCount == 0){
			out.println("There are no students");
		}
		else{
			out.println("Attendance successfully added to the database");
		}
*/	%>
</body>
</html>