<%@page import="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>



<%
	String name = request.getParameter("name");
	String mobileNumber = request.getParameter("mobileNumber");
	String email = request.getParameter("email");
	String bloodGroup = request.getParameter("bloodGroup");
	String status = "pending";
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into bloodrequest values(?,?,?,?,?)");
	
		ps.setString(1, name);
		ps.setString(2, mobileNumber);
		ps.setString(3, email);
		ps.setString(4, bloodGroup);
		ps.setString(5, status);
		ps.executeUpdate();
        
		
		
		response.sendRedirect("index.jsp?msg=valid");
		
	
	}
	
	catch(Exception e){
		
		response.sendRedirect("index.jsp?msg=invalid");
	}
%>