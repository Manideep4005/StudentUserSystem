<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="user-session-validate.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png"
	href="<c:url value="/resources/images/icon_site.png"></c:url>">

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
	color: black;
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

.display {
	width: 500px;
	margin: 2% auto 2% auto;
	box-shadow: 0 0 10px 0 darkorange;
	border-radius: 5px;
	padding: 20px;
}

table {
	width: 450px;
	margin: auto;
	padding: 20px;
	border-spacing: 0;
	border-collapse: collapse;
	border-radius: 5px;
}

th, td {
	padding: 10px;
	text-align: left;
	font-size: 17px;
}

th {
	background: #f2f2f2;
}

td {
	background: #f9f9f9;
}

.back {
	width: 200px;
	margin: auto;
}

.back a {
	display: block;
	text-align: center;
	text-decoration: none;
	border: 2px solid darkorange;
	color: darkorange;
	font-size: 17px;
	padding: 12px;
	transition-duration: .4s;
}

.back a:hover {
	color: white;
	background: darkorange;
}

.operations {
	width: 200px;
	margin: 0 auto;
}

.operations a {
	display: block;
	text-align: center;
	margin: 12px 0;
	text-decoration: none;
	border: 2px solid darkorange;
	padding: 12px 0;
	font-size: 17px;
	color: white;
	background: darkorange;
	transition-duration: .4s;
}

.operations a:hover {
	background: orange;
	border-color: orange;
}

.heading {
	width: 500px;
	margin: 2% auto;
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

@media screen and (max-width: 600px) {
	.display {
		width: 300px;
		top: 50%;
		box-shadow: none;
	}
	table {
		width: 300px;
	}
	.heading {
		width: 300px;
	}
}
</style>
</head>
<body>


	<div class="topnav">
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/StudentManagementSystem">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 10px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="<c:url value="/resources/images/user.png"></c:url>"></span><span
					class="button-text">${currentUserName }</span>
			</a>


				<div class="dropdown-content">
					<a
						href="${pageContext.request.contextPath }/StudentManagementSystem">Home</a>
					<a href="user-details?id=${currentUserId}">My Account</a> <a
						href="${pageContext.request.contextPath }/user-login">Logout</a>
				</div></li>
		</ul>
	</div>

	<c:if test="${passwordUserUpdate != null}">
		<div class="heading">${passwordUserUpdate }</div>
	</c:if>

	<c:if test="${profileUpdateUser != null}">
		<div class="heading">${profileUpdateUser }</div>
	</c:if>


	<div class="display">
		<table>

			<c:forEach var="user" items="${usersList }">



				<tr>
					<th>Id</th>
					<td>${user.userId }</td>
				<tr>
				<tr>
					<th>First Name</th>
					<td>${user.firstName }</td>
				<tr>
				<tr>
					<th>Last Name</th>
					<td>${user.lastName }</td>
				<tr>
				<tr>
					<th>Email</th>
					<td>${user.email }</td>
				<tr>
				<tr>
					<th>Mobile</th>
					<td>${user.mobile }</td>
				<tr>
				<tr>
					<th>Address</th>
					<td>${user.address }</td>
				<tr>
				<tr>
					<th>Password</th>
					<td>${user.password }</td>
				<tr>

					<c:url var="updateUser"
						value="/user-update-form">
						<c:param name="userId" value="${user.userId }" />
					</c:url>
			</c:forEach>

		</table>
	</div>



	<div class="operations">
		<a href="${pageContext.request.contextPath }/user-update-password">Update
			Password</a> <a href="${updateUser}">Update Profile</a>
	</div>

	<div class="back">
		<a href="${pageContext.request.contextPath }/StudentManagementSystem">Back
			to Home</a>
	</div>

</body>
</html>