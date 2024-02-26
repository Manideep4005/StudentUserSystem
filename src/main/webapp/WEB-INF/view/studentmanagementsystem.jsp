<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="user-session-validate.jsp" %>

<% Integer userId = (Integer)session.getAttribute("currentUserId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management System</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="<c:url value="/resources/images/icon_site.png"></c:url>">

<style>
* {
	margin: 0;
	padding: 0;
	font-family: "Poppins", sans-serif;
}

body {
	background: white;
}

.div1 {
	padding: 25px;
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.demo_1_anchor {
	display: block;
	text-align: center;
	font-size: 18px;
	background-color: dodgerblue;
	text-decoration: none;
	color: white;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	border: 2px solid dodgerblue;
	border-radius: 5px;
	cursor: pointer;
	transition-duration: .4s;
}

.demo_1_anchor:hover {
	background-color: transparent;
	color: dodgerblue;
}

.main {
	display: grid;
	grid-template-columns: auto auto;
	align-content: center;
	justify-content: space-evenly;
	transition-duration: 0.4s;
	gap: 50px;
	padding: 20px;
}

h3 {
	text-align: center;
	text-transform: capitalize;
	font-size: 20px;
	font-weight: 800;
	margin-top: 5%;
}

 

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	
	box-shadow: 0px 0px 10px 10px #e3e3e3;
}

li {
	float: left;
}

li a {
	display: inline-block;
	text-align: center;
	padding: 10px 16px;
	text-decoration: none;
	font-weight: 600;
	transition-duration: .4s;
	border-radius: 5px;
	color: black;
}

li a:hover, .dropdown:hover {
	background-color: darkorange;
	color: white;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -90px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 10px;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 300;
}

.dropdown-content a:hover {
	background-color: darkorange;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 38px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
}

.dropbtn span {
	color: black;
}

.dropbtn span:hover {
	color: white;
}

a img {
	height: auto;
	width: 1em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 1px 5px;
	height: 100%;
	font-weight: 600;
}

.button-icon {
	font-size: 1.5em;
}

 
</style>
</head>
<body>
	
	
	<div class="topnav">
		<ul>
			<li><a href="${pageContext.request.contextPath }/StudentManagementSystem">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 10px;"><a
				class="dropbtn" class="button-icon"> 
				<span class="button-icon"><img src="<c:url value="/resources/images/user.png"></c:url>"></span><span class="button-text">${currentUserName }</span>
			</a>


				<div class="dropdown-content">
					<a href="user-details?id=${currentUserId}">My Account</a> <a
						href="${pageContext.request.contextPath }/user-login">Logout</a>
				</div></li>
		</ul>
	</div>
	
	
	<h3>Student Management System</h3>




	<div class="div1">
		<form method="GET" action="students-list">
			<button class="demo_1_anchor">Students List</button>
		</form>

	</div>
	
	<div class="div1">
		<form method="GET" action="${pageContext.request.contextPath }/student-form">
			<button class="demo_1_anchor">New Student</button>
		</form>

	</div>
	
	<div class="div1">
		<form method="GET" action="list-users">
			<button class="demo_1_anchor">list users</button>
		</form>

	</div>
	
</body>
</html>