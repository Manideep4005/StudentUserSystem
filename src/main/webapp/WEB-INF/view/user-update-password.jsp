<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="user-session-validate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
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
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	padding: 20px;
	box-shadow: 0 0 5px orange;
	border-radius: 5px;
}

.form {
	padding: 10px;
}

input {
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

input:hover {
	box-shadow: 0 0 5px darkorange;
	border: 2px solid transparent;
}

input:focus {
	border: 2px solid darkorange;
}

input::placeholder {
	color: grey;
}

input:focus::placeholder {
	opacity: 0.5;
}

#error, #error1 {
	margin: 0;
	color: red;
}

.form button {
	font-size: 17px;
	width: 100%;
	color:white;
	background: orange;
	padding: 10px;
	margin: 12px 0;
	outline: none;
	border: 2px solid orange;
	transition-duration: .4s;
	cursor: pointer;
}

.form button:hover {
	background: darkorange;
	color: white;
}

.form button:active {
	transform: scale(1.1);
}

.back {
	width: 150px;
	margin: 12px auto;
}
.back a {
	display: block;
	text-align: center;
	border: 2px solid orange;
	color: orange;
	padding: 10px;
	text-decoration: none;
	transition-duration: .4s;
}

.back a:hover {
	background: darkorange;
	color: white;
}

@media screen and (max-width: 600px) {
	.container {
		width: 300px;
		top: 50%;
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


	<div class="container">
		<div class="f1">
			<form action="update-user-password" method="POST" class="form"
				onsubmit="return validate()">	
				<input type="hidden" value="${currentUserId }" name="user_id">
				<input type="password" id="pass" placeholder="Enter Password..."
					onkeyup="validatePassword()"> <input type="password"
					id="repass" placeholder="Re-Enter Password..." name="upassword"
					onkeyup="validatePassword()">
				<p id="error"></p><p id="error1"></p>
				<button type="submit">Update</button>
			</form>
		</div>

		<div class="back">
			<a href="user-details?id=${currentUserId}">Back</a>
		</div>
	</div>

	<script type="text/javascript">
		function validatePassword() {
			var pass = document.getElementById('pass').value;
			var repass = document.getElementById('repass').value;
	
			
			 if (pass.length == 0 || repass.length == 0) {

				document.getElementById('error').innerHTML = '';
				return false;
			} else if (pass.length <= 7 || repass.length <= 7) {
				document.getElementById('error').innerHTML = 'Password must be 8 characters';
				return false;
			}

			else if (pass.length != repass.length) {
				document.getElementById('error').innerHTML = 'Password doesn\'t match';
				document.getElementById('error').style.color = 'red';
				return false;
			}

			else if (pass != repass) {
				document.getElementById('error').innerHTML = 'Password doesn\'t match';
				document.getElementById('error').style.color = 'red';
				return false;
			} else {
				document.getElementById('error').innerHTML = 'Password matched';
				document.getElementById('error').style.color = 'green';
				return true;
			}
		}
		
		function validate() {
			var isValid = false;
	
			var pass = document.getElementById('pass').value;
			var repass = document.getElementById('repass').value;
	
			if (pass.length == 0 || repass.length == 0) {
				document.getElementById('error1').innerHTML = 'Please Enter Password';
				isValid =  false;
			}  else if(pass.length > 0 || repass.length > 0) {
				document.getElementById('error1').innerHTML = '';
				isValid = true;
			}
			
			var validatePass = validatePassword();
			
			var ans = isValid && validatePass;
			
			return ans;
			
		}
		
		function vanish() {
			document.getElementById('error1').innerHTML = '';
		}
		
		setTimeout(vanish, 2000);
	</script>

</body>
</html>