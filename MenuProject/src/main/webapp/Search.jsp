<%@page import="java.sql.ResultSet"%>
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
	<style type="text/css">

		/* Layout */
		body {
			min-width: 630px;
			
		}

		#container {
			padding-left: 200px;
			padding-right: 190px;
		}
		
		#container .column {
			position: relative;
			float: left;
		}
		
		#center {
			padding: 10px 20px;
			width: 100%;
			
		}
		
		#left {
			width: 180px;
			padding: 0 10px;
			right: 240px;
			margin-left: -100%;
		}
		
		/* #right {
			width: 130px;
			padding: 0 10px;
			margin-right: -100%;
		} */
		
		#footer {
			clear: both;
		}
		
		/* IE hack */
		* html #left {
			left: 150px;
		}

		/* Make the columns the same height as each other */
		#container {
			overflow: hidden;
			height: 550px;
		}

		#container .column {
			padding-bottom: 1001em;
			margin-bottom: -1000em;
		}

		/* Fix for the footer */
		* html body {
			overflow: hidden;
		}
		
		* html #footer-wrapper {
			float: left;
			position: relative;
			width: 100%;
			padding-bottom: 10010px;
			margin-bottom: -10000px;
			background: #fff;
		}

		/* Aesthetics */
		body {
			margin: 0;
			padding: 0;
			font-family:Sans-serif;
			line-height: 1.5em;
		}
		
		p {
			color: #555;
		}

		nav ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		
		nav ul a {
			color: darkgreen;
			text-decoration: none;
		}

		#header, #footer {
			font-size: large;
			text-align:center;
			padding: 0.3em;
			background: #BCCE98;
		}

		#left {
			background: #DAE9BC;
		}
		
		#right {
			background: #F7FDEB;
		}

		#center {
			background: #fff;
		}

		#container .column {
			padding-top: 1em;
		}
		
	</style>
</head>

<body>

	<header id="header"><p>Student</p></header>

	<div id="container">

		<main id="center" class="column">
			<article>
			<form action="Search" method="post">
			<select name="searchtype">
			<option value="na">--Select--</option>
			<option value="byid">Search By Id</option>
			<option value="bycourse">Search By Course</option>
			</select>
			<input type="text" name="search"/>
			<input type="submit" value="Search"/>
			</form>
			<%
			if(request.getAttribute("msg")!=null){
				out.println(request.getAttribute("msg"));
			}
			%>
			<%
			if(request.getAttribute("rs")!=null)
			{%>
				
			<table border="1" align="center">
			<tr><th>Id</th><th>Name</th><th>Age</th><th>City</th><th>State</th><th>Mobile</th><th>Course</th></tr>
		<%ResultSet rs=(ResultSet)request.getAttribute("rs");
		
		do{
			%>
			<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td></tr>
		</table>
		<%}while(rs.next()); 
		}%>
		
			</article>								
		</main>

		<nav id="left" class="column">
		<%@include file="Menu.jsp" %>
		</nav>
	</div>

	<div id="footer-wrapper">
		<footer id="footer"><p>Footer...</p></footer>
	</div>

</body>

</html>