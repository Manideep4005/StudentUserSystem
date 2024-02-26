<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="user-session-validate.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Form</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png"
	href="<c:url value="/resources/images/icon_site.png"></c:url>">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: "Poppins", sans-serif;
	box-sizing: border-box;
}

body {
	background: white;
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

.container {
	top: 52%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	width: 500px;
	box-shadow: 0 0 10px 0 darkorange;
	border-radius: 10px;
	padding: 25px;
}

input, textarea {
	display: block;
	margin: 12px 0;
	padding: 10px 8px;
	width: 100%;
	border-radius: 5px;
	transition-duration: .4s;
	border: 2px solid orange;
	background: transparent;
	font-size: 17px;
	outline: none;
	color: grey;
}

input:hover, textarea:hover {
	box-shadow: 0 0 5px orange;
	border: 2px solid transparent;
}

input:focus, textarea:focus {
	border: 2px solid orange;
}

input::placeholder, input[type="date"], textarea::placeholder {
	color: grey;
}

input:focus::placeholder, textarea:focus::placeholder {
	opacity: 0.5;
}

input[type='file']::file-selector-button {
	color: grey;
	background: white;
	border: 2px solid darkorange;
}

textarea {
	resize: none;
}

.btn_add {
	display: block;
	margin: 12px auto;
	padding: 10px 8px;
	width: 100%;
	border-radius: 5px;
	transition-duration: .4s;
	border: 2px solid orange;
	font-size: 17px;
	outline: none;
	font-weight: 500;
	background: orange;
	color: white;
	cursor: pointer;
}

.btn_add:hover {
	background: darkorange;
}

.back_form {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}

.back_btn {
	display: block;
	margin: 20px 0;
	padding: 10px 8px;
	width: 80%;
	border-radius: 5px;
	transition-duration: .4s;
	border: 2px solid orange;
	background: transparent;
	font-size: 17px;
	outline: none;
	color: orange;
	font-weight: 500;
	cursor: pointer;
	margin-left: auto;
	margin-right: auto;
}

.back_btn:hover {
	background: darkorange;
	color: white;
}

@media screen and (max-width: 769px) {
	.container {
		width: 320px;
	}
	.main p {
		font-size: 18px;
	}
	.back_form {
		width: 250px;
	}
	.back_btn {
		width: 80%;
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
					<a href="user-details?id=${currentUserId}">My Account</a> <a
						href="${pageContext.request.contextPath }/user-login">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="container">
		<div class="form">
			<form:form method="POST" cssClass="add"
				action="${pageContext.request.contextPath }/student-add"
				modelAttribute="student">
				<form:hidden path="studentId" />

				<form:input path="firstName" required="required"
					placeholder="Fisrt name" />

				<form:input path="lastName" placeholder="Last name"
					required="required" />

				<form:textarea path="Address"
					placeholder="Enter address(400 characters)" required="required" />

				<form:input type="text" placeholder="MM/DD/YYYY (Enter DOB)" onblur="(this.type='text')"
					onfocus="(this.type='date')" path="dob"
					required="required" />




				<button type="submit" class="btn_add">Save</button>
			</form:form>

			<div class="back">
				<form
					action="${pageContext.request.contextPath }/StudentManagementSystem"
					method="get" class="back_form">
					<button class="back_btn">Back Home</button>
				</form>
			</div>
		</div>


	</div>


</body>
</html>