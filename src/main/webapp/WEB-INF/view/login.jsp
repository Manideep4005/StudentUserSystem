<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png"
	href="<c:url value="/resources/images/icon_site.png"></c:url>">

<style type="text/css">
* {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: white;
}

label {
	font-size: 20px;
	color: black;
	font-weight: 200;
	display: block;
}

.input-field {
	width: 100%;
	margin: 12px 0;
	padding: 12px 20px;
	display: block;
	border: 2px solid #e6ebf0;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	background-color: transparent;
	transition: 0.34s ease;
	caret-color: #317ac7;
	font-size: 18px;
}

.input-field:focus {
	border: 2px solid #317ac7;
}

.input-field:focus::placeholder {
	opacity: 0.6;
}

.input-field::placeholder {
	color: grey;
}

.input-field:hover {
	box-shadow: 0px 0px 5px 0px #317ac7;
}

.main {
	box-shadow: 0 0 10px #ccc;
	border-radius: 10px;
	padding: 30px;
	width: 500px;
	border: 1px solid transparent;
}

.main:hover {
	border: 1px solid gainsboro;
}

.f1 {
	transition: 0.34s ease;
	background-color: white;
}

button {
	background-color: #4d81db;
	width: 100%;
	color: white;
	padding: 12px 10px;
	margin: 10px 0px;
	border: none;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.34s;
	font-size: 18px;
	font-weight: 500;
	transition-duration: 0.4;
}

button:hover {
	background: #317ac7;
	color: white;
}

.failed {
	color: red;
	font-size: 18px;
}

.logout_div {
	background-color: transparent;
	margin-bottom: 3%;
	color: darkorange;
	padding: 10px;
	font-size: 18px;
}

.new p {
	font-size: 20px;
	text-align: center;
	display: block;
	font-weight: 500;
}

.new a {
	font-weight: bolder;
	padding-left: 0px;
	color: #4d81db;
	text-decoration: none;
	transition: 0.34s;
	padding-left: 0px;
}

.new a:hover {
	text-decoration: underline;
}

.new a:active {
	transform: scale(1.2);
}

.main {
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
}

@media screen and (max-width: 600px) {
	.main {
		top: 45%;
		width: 330px;
		padding: 15px;
	}
	h1 {
		font-size: 20px;
	}
}

.show {
	font-size: 15px;
	display: flex;
	align-items: center;
	margin-left: .4em;
}

.show input {
	width: 15px;
	height: 15px;
	margin: 10px .4em 10px 0;
}

#forgot {
	padding: 10px;
	text-align: center;
}

#forgot a {
	text-decoration: none;
	color: #317ac7;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
}

#forgot a:hover {
	text-decoration: underline;
	transform: scale(1.5);
}

#success {
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

#error {
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
}

.header {
	background: white;
	padding: 20px;
	box-shadow: 0px 0px 5px 0px gainsboro;
}

.header h1 {
	text-align: center;
}

#error_user, #pass_user_error {
	color: red;
	margin: 0;
	padding-left: 12px;
}
</style>
</head>
<body>

	<div class="header">
		<h1>Student Management System</h1>
	</div>

	<div class="main">
		<form:form action="${pageContext.request.contextPath }/user-login"
			method="POST" class="f1" onsubmit="return validate()">

			<c:if test="${success != null}">
				<p id="success">${success}</p>
			</c:if>

			<!-- <c:if test="${newUserId != null}">
				<p id="success">${newUserId}</p>
			</c:if>-->

			<c:if test="${userIdnew != null}">
				<p id="success">User Id Generated is ${userIdnew}</p>
			</c:if>

			<c:if test="${userPasswordChangeSuccess != null}">
				<p id="success">${userPasswordChangeSuccess}</p>
			</c:if>

			<c:if test="${error != null}">
				<p id="error">${error }</p>
			</c:if>




			<input type="text" inputmode="numeric" maxlength="5"
				placeholder="Enter 5 digit id" name="userid" class="input-field" inputmode="numeric" pattern="[0-9]{5}"
				id="user_input" onkeyup="validateUserId()">
			<p id="error_user"></p>
			<input type="password" placeholder="Enter Password" name="password"
				class="input-field" id="password" onkeyup="validatePass()">
			<p id="pass_user_error"></p>

			<label class="show"> <input type="checkbox"
				onclick="showPassword()">Show Password
			</label>

			<div class="spinner" id="spin"></div>
			<button type="submit">Login</button>

		</form:form>

		<p id="forgot">
			<a href="${pageContext.request.contextPath }/user-forgot-password">forgot
				password?</a>
		</p>



		<div class="new">
			<p>
				Don't have a account <a
					href="${pageContext.request.contextPath }/user-register">Register</a>
			</p>
		</div>


	</div>

	<script>
		function showPassword() {
			var password = document.getElementById('password');

			if (password.type === 'password') {
				password.type = 'text';

			} else {
				password.type = 'password';
			}
		}

		function validate() {
			var x = document.getElementById('user_input').value;
			var password = document.getElementById('password').value;
			if (x.length == "" && password.length == "") {
				document.getElementById('error_user').innerHTML = "Enter User Id";
				document.getElementById('pass_user_error').innerHTML = "Please Enter password.";
				return false;
			} else if (x.length == "" && password.length != "") {
				document.getElementById('error_user').innerHTML = "Enter User Id";
				document.getElementById('pass_user_error').innerHTML = "";
				return false;
			} else if (x.length != "" && password.length == "") {
				document.getElementById('error_user').innerHTML = "";
				document.getElementById('pass_user_error').innerHTML = "Please Enter password.";
				return false;
			} else if (isNaN(x)) {
				document.getElementById('error_user').innerHTML = "Numeric input only";
				return false;
			} else if (x.length < 5) {
				document.getElementById('error_user').innerHTML = "Please Enter 5 digit id";
				return false;
			} else {
				return true;
			}
		}

		function validatePass() {
			var password = document.getElementById('password').value;
			if (password.length > 0) {
				document.getElementById('pass_user_error').innerHTML = "";
			}
		}

		function validateUserId() {
			var x = document.getElementById('user_input').value;
			if (isNaN(x)) {
				document.getElementById('error_user').innerHTML = "Numeric input only";
			} else if (x.length > 0 && x.length < 5) {
				document.getElementById('error_user').innerHTML = "Please Enter 5 digit id";
			} else if (x.length == "" || x.length == 5) {
				document.getElementById('error_user').innerHTML = "";
			}

		}
	</script>
</body>
</html>

