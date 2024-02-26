<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<title>User Password Change</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png"
	href="<c:url value="/resources/images/icon_site.png"></c:url>">


<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: white;
	transition-duration: .4s;
}

.header {
	padding: 20px;
	background: #fffff7;
	box-shadow: 0 0 5px orange;
}

.header p {
	text-align: center;
	font-size: 25px;
	font-weight: 800;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 0 0 5px orange;
	width: 500px;
	padding: 10px 5px;
	border-radius: 2px;
}

form {
	width: 400px;
	margin: 0px auto;
}

input {
	display: block;
	margin: 12px 0;
	padding: 10px 8px;
	width: 100%;
	border-radius: 2px;
	transition-duration: .4s;
	border: 2px solid orange;
	background: transparent;
	font-size: 17px;
	outline: none;
}

input:hover {
	box-shadow: 0 0 5px orange;
	border: 2px solid transparent;
}

input:focus, textarea:focus {
	border: 2px solid orange;
}

input::placeholder {
	color: grey;
}

input:focus::placeholder {
	opacity: 0.5;
}

button {
	display: block;
	margin: 12px 0;
	padding: 10px 8px;
	width: 100%;
	border-radius: 2px;
	transition-duration: .4s;
	border: 2px solid orange;
	background: orange;
	color: white;
	font-size: 17px;
	cursor: pointer;
	outline: none;
}

button:hover {
	background: darkorange
}

.back {
	width: 200px;
	margin: 0px auto;
	padding: 5px;
}

.back a {
	text-decoration: none;
	display: block;
	text-align: center;
	font-size: 18px;
	border: 2px solid orange;
	color: orange;
	transition-duration: .4s;
	padding: 10px;
}

.back a:hover {
	background: orange;
	color: white;
}

@media screen and (max-width:600px) {
	.container {
		width: 320px;
	}
	form {
		width: 300px;
	}
	.header p {
		font-size: 18px;
	}
}

#error {
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
	width: 300px;
	margin: auto;
}
</style>

</head>

<body>

	<div class="header">
		<p>Student Management System</p>
	</div>

	<div class="container">
		<c:if test="${InvalidUserId != null}">
			<p id="error">${InvalidUserId }</p>
		</c:if>
		
		<c:if test="${OtpMailNotSent != null}">
			<p id="error">${OtpMailNotSent }</p>
		</c:if>
		<div class="form">
			<form action="change-user-password-form" method="POST">
				<input type="text" maxlength="5"
					placeholder="Enter your 5 digit user id" required="required"
					name="user_id">
				<button>Submit</button>
			</form>
		</div>

		<div class="back">
			<a href="${pageContext.request.contextPath }/">Login</a>
		</div>

	</div>

</body>

</html>