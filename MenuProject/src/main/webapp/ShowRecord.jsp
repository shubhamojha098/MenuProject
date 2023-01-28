<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.db.DBService"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int i =0; %>
<%
	try{
	session=request.getSession(false);
	if(!(session!=null&&session.getAttribute("usertype").equals("admin")))
	{
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		String msg="<center><font color=red>Login First to Acess this page</font></center>";
		request.setAttribute("msg", msg);
		rd.forward(request, response);
	}
	}catch(Exception e)
{
	response.sendRedirect("Login.jsp");
}
Connection con=DBService.getConnection();
PreparedStatement pst=con.prepareStatement("select * from student");
ResultSet rs=pst.executeQuery();
%>
<a href="lg">Logout</a>
<a href="Register.jsp">Add New</a>
<table border="1">
<tr><th>Id</th><th>Name</th><th>Age</th><th>City</th><th>State</th><th>Mobile</th><th>Course</th><th>Delete</th></tr>

<%while(rs.next()){ %>
<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
	<td><a href=dr?sid=<%=rs.getInt(1) %>>Delete</a></td>
</tr>
<%} %>
</table>
</body>
</html>