<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 95%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<br>

	<%@page import="project.ConnectionProvider"%>
	<%@page import="java.sql.*"%>

	<%
	String msg = request.getParameter("msg");

	if (msg != null) {
		if (msg.equals("valid")) {
	%>
	<center>
		<font color="red" size="5">Successfully edited</font>
	</center>

	<%
	} else if (msg.equals("deleted")) {
	%>
	<center>
		<font color="red" size="5">Successfully Deleted</font>
	</center>

	<%
	}

	else if (msg.equals("invalid")) {
	%>
	<center>
		<font color="red" size="5">Something went wrong!! Try Again</font>
	</center>

	<%
	}
	}
	%>

	<center>
		<table id="customers">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Father's Name</th>
				<th>Mobile Number</th>
				<th>E-mail</th>
				<th>Blood Group</th>
				<th>Gender</th>
				<th>Adress</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<tr>
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from donor");

					while (rs.next()) {
				%>
				<td>
					<%
					out.print(rs.getInt(1));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(2));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(3));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(4));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(5));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(6));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(7));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString(8));
					%>
				</td>
				<td><a
					href="updateDonor.jsp?id=<%out.print(rs.getString(1));%>">Edit</a>
				<td><a
					href="deleteDonor.jsp?id=<%out.print(rs.getString(1));%>">Delete</a>
				</td>
			</tr>
			<%
			}
			} catch (Exception e) {

			}
			%>

		</table>
	</center>


	<br>
	<br>
	<br>
	<br>

</body>
</html>