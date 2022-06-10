	<%@page import="project.ConnectionProvider"%>
	<%@page import="java.sql.*"%>
	
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
			PreparedStatement ps = con.prepareStatement("update donor set name=?, fathername=?, mobilenumber=?, email=?, bloodgroup=?, gender=?, address=? where id=?");
			
			
			
			ps.setString(1, name);
			ps.setString(2, fatherName);
			ps.setString(3, mobileNumber);
			ps.setString(4, email);
			ps.setString(5, bloodGroup);
			ps.setString(6, gender);
			ps.setString(7, address);
			ps.setString(8, id);
			
			ps.executeUpdate();
			response.sendRedirect("editDeleteList.jsp?msg=valid");
			
		}
		
		catch(Exception e){
			
			response.sendRedirect("editDeleteList.jsp?msg=invalid");
		}
		
	%>