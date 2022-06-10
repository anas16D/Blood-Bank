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

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("delete from donor where id= " + id);
	
	ps.executeUpdate();
	response.sendRedirect("editDeleteList.jsp?msg=deleted");

}

catch (Exception e) {
}
%>