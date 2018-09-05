<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mark Attendance</title>
		
<script type="text/javascript">
	
	

	
	function myFunction() {
		  document.getElementById("demo").innerHTML = "Hello World";
		}

</script>


</head>
<body>
	<h1>Mark Teacher's Attendance</h1>
	<hr/>
	
	<form action = "" method = "post">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.*"%>
	
	<%	
	
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp", "root", ""); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from teacher");
	
		int c = 1;
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = df.format(date);
		
		
		while(rs.next()){
			String tid = rs.getString("id");
			out.println(tid + " | " + str + " | ");
			%>
				<script>
					var c = 0;
					var status_arr = [];
					function setValues(status) {
						var status_arr[c] = status.value;
						c = c + 1;	
					}
					var a = "Hariharan";
				</script>
				<select name = "attendance"  onChange="setValues(this)">
					<option value="">Select status</option>
					<option value = "0">0</option>
					<option value = "1">1</option>
				</select>
			<%
			c++;
			%><br/><%
		}
	%>
	<br/>
	

	
		<input type = "submit" value = "Submit" onmouseover = "set_Val()"/>
	</form>
	
	

	<script>
		function print_Res(){
		
			document.getElementById('demo').innerHTML = a;
	    
		}
	</script>
	<button onclick="print_Res()">sub</button>
	
	
	<button onclick="myFunction()">Click me</button>

<p id="demo"></p>


	
</body>
</html>