<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="user-session-validate.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students List</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="<c:url value="/resources/images/icon_site.png"></c:url>">

<style>
* {
	margin: 0;
	padding: 0;
	font-family: "Poppins", sans-serif;
	box-sizing: border-box;
}

body {
	background: white;
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

.scroll {
	overflow-y: scroll;
	height: 400px;
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1%;
}

.scroll {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.scroll::-webkit-scrollbar {
	display: none;
}

table {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0;
	border-collapse: collapse;
	width: 500px;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	padding: 13px;
	font-size: 18px;
	border: 1px solid #ccc;
}

.demo_1_anchor {
	color: darkorange;
	border: 2px solid darkorange;
	background-color: transparent;
	font-size: 17px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 2.5%;
	font-weight: bolder;
	cursor: pointer;
	padding: 12px;
	text-decoration: none;
	transition: 0.34s ease;
	text-decoration: none;
}

.demo_1_anchor:hover {
	color: white;
	background: darkorange;
}

#delete {
	text-decoration: none;
	color: red;
	font-weight: 500;
	border: 2px solid red;
	transition-duration: .4s;
	padding: 5px;
	font-size: 16px;
}

#delete:hover {
	color: white;
	background: red;
}

#edit {
	text-decoration: none;
	color: dodgerblue;
	font-weight: 500;
	font-size: 16px;
	transition-duration: .4s;
	border: 2px solid dodgerblue;
	padding: 5px;
}

#edit:hover {
	background: dodgerblue;
	color: white;
}

.container {
	width: 500px;
	padding: 10px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
}

.container form {
	display: inline-block;
	width: 300px;
}

.container form input {
	border: 2px solid orange;
	padding: 10px;
	font-size: 15px;
	transition-duration: .4s;
	width: 60%;
	margin-left: 30px;
	float: left;
	outline: none;
}

.container form input::placeholder {
	color: orange;
}

.container form button {
	transition-duration: .4s;
	width: 20%;
	padding: 10px;
	background: orange;
	color: white;
	font-size: 15px;
	border: 2px solid orange;
	border-left: none;
	cursor: pointer;
}

.container form input:focus {
	border: 2px solid darkorange;
}

.container form button:hover {
	background: darkorange;
	border: 2px solid darkorange;
}

#new {
	text-decoration: none;
	color: darkorange;
	border: 2px solid darkorange;
	padding: 10px;
	font-size: 15px;
	transition-duration: .4s;
}

#new:hover {
	background: darkorange;
	color: white;
}

@media screen and (max-width: 600px) {
	.container {
		width: 320px;
	}
	
	.scroll {
		width: 320px;
	}
	
	.container form {
		width: 250px;
		display: inline;
	}
	
	.container form input {
		width: 40%;
		margin-left: 0;
		float: none;
	}
	
	#new {
		background: orange;
		color: white;
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
		<span><a href="${pageContext.request.contextPath }/student-form" id="new">Add Student</a></span> <span>
			<form action="${pageContext.request.contextPath }/student-search" method="get">
				<input type="text" placeholder="Search Student" name="student_name">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</span>
	</div>

	<div class="results">
		<div class="scroll">
			<table>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>DOB</th>
					<th>Action</th>
				</tr>

				<c:forEach var="student" items="${students }">

					<!-- Update Student link with student id -->
					<c:url var="updateLink" value="/student-update">
						<c:param name="studentId" value="${student.studentId }" />
					</c:url>

					<!-- Update Student link with student id -->
					<c:url var="DeleteLink" value="/student-delete">
						<c:param name="studentId" value="${student.studentId }" />
					</c:url>

					<tr>
						<td>${student.studentId }</td>
						<td>${student.firstName }</td>
						<td>${student.lastName }</td>
						<td>${student.address }</td>
						<td>${student.dob }</td>
						<td><a href="${updateLink }" id="edit">Update</a>&nbsp;<a href="${DeleteLink }" id="delete"
							onclick="if (!(confirm('Delete this student'))) return false">Delete</a>

						</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</div>

	<div class="div1">
		<form method="get"
			action="${pageContext.request.contextPath }/StudentManagementSystem">
			<button class="demo_1_anchor">Back Home</button>
		</form>
	</div>
</body>
</html>