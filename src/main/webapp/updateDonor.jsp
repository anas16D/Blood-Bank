<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,
	input[type="number"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	padding: 15px;
	width: 60%;
	border-radius: 25px;
	margin-left: 20%;
}

h2, h1 {
	margin-left: 20%;
}

hr {
	width: 60%;
}
</style>
</head>
<body>



	<%@page import="project.ConnectionProvider"%>
	<%@page import="java.sql.*"%>

	<%
	String id = request.getParameter("id");

	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from donor where id ='" + id + "'");
		rs.next();
	%>

	<div class="container">
		<form action="updateDonorAction.jsp" method="post">
			<input name="id" value="<%out.println(id);%>" type="hidden">

			<h2>Name</h2>
			<input type="text" name="name" placeholder="Enter Donor Name" value="<%=rs.getString(2) %>">
			<hr>

			<h2>Father's Name</h2>
			<input type="text" name="fatherName"
				placeholder="Enter Donor's Father Name" value="<%=rs.getString(3) %>">
			<hr>

			<h2>Mobile Number</h2>
			<input type="text" name="mobileNumber"
				placeholder="Enter DonorsMobile Number" value="<%=rs.getString(4) %>">
			<hr>

			<h2>E-mail</h2>
			<input type="email" name="email"
				placeholder="Enter Donor's Mobile Number" value="<%=rs.getString(5) %>">
			<hr>

			<h2>Blood Group</h2>
			<select name="bloodGroup"  id="bloodGroup">
				<option value="A+">A+</option>
				<option value="B+">B+</option>
				<option value="AB+">AB+</option>
				<option value="O+">O+</option>
				<option value="A-">A-</option>
				<option value="B-">B-</option>
				<option value="O-">O-</option>
				<option value="AB-">AB-</option>
			</select>
			<script>
				document.getElementById('bloodGroup').value="<%=rs.getString(6) %>";
			</script>
			<hr>

			<h2>Gender</h2>
			<select name="gender" id="gender">
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			<script>
				document.getElementById('gender').value="<%=rs.getString(7) %>";
			</script>
			<hr>

			<h2>Address</h2>
			<input type="text" name="address" placeholder="Enter Donor's address" value="<%=rs.getString(8) %>">
			<hr>

			<center>
				<button type="submit" class="button">Save</button>
			</center>
		</form>
	</div>

	<div class="container">
		<h1 style="color: red;">
			Donor ID:
			<%
		out.println(id);
		%>
		</h1>
	</div>
	<%
	}

	catch (Exception e) {
	
	%>
	<div class="container">
		<h1 style="color: blue;">
			Exception:
			<%
		out.println(e);
		%>
		</h1>
	</div>
	<%
	}
	%>



	<br>
	<br>
	<br>
	<br>
	

</body>
</html>