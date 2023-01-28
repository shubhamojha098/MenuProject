<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>3 Column Layout</title>
</head>
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
}%>
<body>

			<ul>
				<li><a href="Home.jsp">Home</a></li>
				<li><a href="ShowStudentRecord.jsp">Show Record</a></li>
				<li><a href="RegisterPage.jsp">Add Record</a></li>
				<li><a href="Search.jsp">Search Record</a></li>
				<li><a href="lg">Logout</a></li>
			</ul>

</body>

</html>