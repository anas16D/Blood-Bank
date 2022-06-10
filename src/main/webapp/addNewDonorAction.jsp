<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String fatherName = request.getParameter("fatherName");
	String mobileNumber = request.getParameter("mobileNumber");
	String email = request.getParameter("email");
	String bloodGroup = request.getParameter("bloodGroup");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into donor values(?,?,?,?,?,?,?,?)");
		
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, fatherName);
		ps.setString(4, mobileNumber);
		ps.setString(5, email);
		ps.setString(6, bloodGroup);
		ps.setString(7, gender);
		ps.setString(8, address);
		
		ps.executeUpdate();
		response.sendRedirect("addNewDonor.jsp?msg=valid");
		
	}
	
	catch(Exception e){
		response.sendRedirect("addNewDonor.jsp?msg=invalid");
	}
%>