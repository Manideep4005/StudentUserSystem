<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
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

.container {
	top: 55%;
	left: 50%;
	transform: translate(-50%,-50%);
	position: absolute;
	width: 500px;
	box-shadow: 0 0 10px 0 darkorange;
	border-radius: 10px;
}

.form {
	padding: 20px;
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
	border: 2px solid darkorange;
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

input.invalid, textarea.invalid {
	border-color: red;
}

.button {
	position: relative;
	padding: 10px 16px;
	background: orange;
	border: none;
	outline: none;
	border-radius: 2px;
	cursor: pointer;
	width: 100%;
	margin: 12px 0;
	transition-duration: .4s;
}

.button:hover {
	background: darkorange;
}

.back_form {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
}

.back_btn {
	display: block;
	margin: 10px 0;
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

.

#error {
	color: red;
	margin: 0;
}

.button__text {
	font-size: 18px;
	font-weight: 700;
	color: white;
	transition: all 0.2s;
}

.button--loading .button__text {
	visibility: hidden;
	opacity: 0;
}

.button--loading::after {
	content: "";
	position: absolute;
	width: 16px;
	height: 16px;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	border: 6px solid white;
	border-top-color: grey;
	border-radius: 50%;
	animation: spin 1s linear infinite;
}
@keyframes spin{
	0% {
		transform: rotate(0deg);
	}
	25% {
	border-top-color:#168aaa;
	}
	50% {
	border-top-color:dodgerblue;
	}
	75% {
	border-top-color:skyblue;
	}
	100% {
		border-top-color:#3de3d7;
		transform: rotate(360deg);
	}
}

@media screen and (max-width: 600px) {
	.container {
		width: 320px;
	}
	.main p {
		font-size: 18px;
	}
	.back_form {
		width: 300px;
	}
	.back_btn {
		width: 80%;
	}
}

.header {
	padding: 10px;
	box-shadow: 0 0 5px orange;
	text-align: center;
}
</style>
</head>
<body>

	<div class="header">
		<h2>Student Management System</h2>
	</div>

	<div class="container">
		<div class="form">
			<form:form method="POST" cssClass="add"
				action="${pageContext.request.contextPath }/user-add"
				modelAttribute="user_model" onsubmit="return validateForm()">
				<form:hidden path="userId" />

				<form:input path="firstName" 
					placeholder="Fisrt name" required="required"/>

				<form:input path="lastName" placeholder="Last name"
					required="required" />

				<form:input path="email" placeholder="Email..." required="required"  pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"/>

				<form:input path="mobile" placeholder="Enter Mobile Number"
					required="required" maxlength="10" />

				<form:textarea path="address"
					placeholder="Enter address(400 characters)" required="required"/>

				<form:input path="" type="password" placeholder="Enter Password"
					id="pass" onkeyup="validatePassword()" required="required"/>

				<form:input path="password" type="password"
					placeholder="Re-Enter Password" id="repass"
					onkeyup="validatePassword()" required="required"/>
				<p id="error"></p>
				
				<button type="submit" class="button" id="add_btn"><span class="button__text">Register</span></button>
			</form:form>


		</div>
		<div class="back">
			<form action="${pageContext.request.contextPath }/" method="get"
				class="back_form">
				<button class="back_btn">Already have an account login</button>
			</form>
		</div>

	</div>

	<script type="text/javascript">
		function validatePassword() {
			var pass = document.getElementById('pass').value;
			var repass = document.getElementById('repass').value;
			var isValid = false;
			
			
			if (pass.length < 1 || repass.length < 1) {

				document.getElementById('error').innerHTML = '';
				isValid = false;
			} else if (pass.length <= 7 || repass.length <= 7) {
				document.getElementById('error').innerHTML = 'Password must be 8 characters';
				document.getElementById('error').style.color = 'red';
				isValid = false;
			}

			else if (pass.length != repass.length) {
				document.getElementById('error').innerHTML = 'Password doesn\'t match';
				document.getElementById('error').style.color = 'red';
				isValid = false;
			}

			else if (pass != repass) {
				document.getElementById('error').innerHTML = 'Password doesn\'t match';
				document.getElementById('error').style.color = 'red';
				isValid = false;
			} else {
				document.getElementById('error').innerHTML = 'Password matched';
				document.getElementById('error').style.color = 'green';
				isValid = true;
			}
			
			
			return isValid;
		}
		
		function validateForm() {
			
			var isValid = validatePassword();
			var btn = document.querySelector(".button");

	   		
		       
	   		if (isValid) {
	   			btn.classList.toggle("button--loading");
	   			btn.disabled = true;
	   		}
			
		}
		
		/*function validateForm() {
	        var y = document.getElementsByClassName("one");
	        var i,
	          valid = true;

	        for (i = 0; i < y.length; i++) {
	          if (y[i].value == "" ) {
	            y[i].className += " invalid";
	            valid = false;
	          }
	        }
	        
	        
	       var pass =  validatePassword();
	        
	       var final = valid && pass;
	       
	       var btn = document.querySelector(".button");

	   		
	       
	   		if (final) {
	   			btn.classList.toggle("button--loading");
	   			btn.disabled = true;
	   		}
	       
	   		return final ;
	      }
		
		document.getElementById('add_btn').addEventListener("click", () => {
			var x = document.getElementById("add_btn");
			x.classList.toggle('button--loading');
			x.disabled = true;
		});*/
	</script>

</body>
</html>