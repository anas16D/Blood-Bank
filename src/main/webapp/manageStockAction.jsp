<%@page import="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>



<%
	String bloodGroup = request.getParameter("bloodGroup");
	String change = request.getParameter("incdec");
	String Stringunits = request.getParameter("units");
	int units = Integer.parseInt(Stringunits);
	
	try{
		Connection con = ConnectionProvider.getCon();
		//PreparedStatement ps = con.prepareStatement("update donor set units=? where bloodgroup="+bloodGroup);
		Statement st = con.createStatement();
		

		if(change.equals("increase"))
		{
			st.executeUpdate("update stock set units=units+'"+units+"' where bloodgroup='"+bloodGroup+"'");
		}
		if(change.equals("decrease"))
		{
			st.executeUpdate("update stock set units=units-'"+units+"' where bloodgroup='"+bloodGroup+"'");
			
		}
	
        
		
		
		response.sendRedirect("manageStock.jsp?msg=valid");
		
	
	}
	
	catch(Exception e){
		
		%>
		<div> exception: <%out.print(e); %></div>
		<%
		response.sendRedirect("manageStock.jsp?msg=invalid");
	}
	%>