<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="style.css" rel='stylesheet' >
</head>
<body>
<%
session=request.getSession(false);
if(session!=null && session.getAttribute("usertype")!=null){
	if(session.getAttribute("usertype").equals("admin"))
				{
response.sendRedirect("Home.jsp");}
}
else{
%>
<form action="auth" method="post">
    <div class="logo"></div>
	<div class="login-block">
  <h1>Login</h1>
  <input class="input" type="text" placeholder="Username" name="username" />
  <input class="input" type="password" placeholder="Password" name="password" />
  <input class="button" type="submit" value="Submit"/>
  <label class="label">Not registered?<a href="Register.html">Registered Now</a></label>
  <%}

if(request.getAttribute("msg")!=null)
	  {
	  out.println(request.getAttribute("msg"));
	  }%>
</div>
</form>

</body>

</html>