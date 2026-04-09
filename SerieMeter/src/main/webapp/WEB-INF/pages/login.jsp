<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-image: url('assets/images/login-background.jpg');
	background-size: cover; /* Scales the image to fill the screen */
	background-position: center; /* Centers the image */
	background-repeat: no-repeat;
	/* Prevents the image from tiling/repeating */
	overflow: hidden; /* Prevents scrollbars if the image is large */
}

.login-card {
	background: white;
	padding: 45px 40px; /* Increased padding for better breathing room */
	border-radius: 24px;
	box-shadow: 0 15px 50px rgba(0, 0, 0, 0.08);
	width: 90%;
	max-width: 380px; /* Wider card for a professional feel */
	text-align: center;
	margin-bottom: 20px;
}

.logo-section {
	margin-bottom: 30px;
}

.logo-img {
	width: 100%;
	max-width: 220px; /* Prevents logo from being too overwhelming */
	height: auto;
	margin-bottom: 12px;
}

.tagline {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 2px;
	color: #999;
	margin-top: -5px;
}

.input-group {
	text-align: left;
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	margin-bottom: 8px;
	color: #444;
	padding-left: 10px;
}

.input-wrapper {
	position: relative;
	display: flex;
	align-items: center;
}

.icon-svg {
	position: absolute;
	left: 18px;
	width: 16px;
	height: 16px;
	opacity: 0.6;
	pointer-events: none;
}

.eye-icon {
	left: auto;
	right: 18px;
	cursor: pointer;
	pointer-events: all;
}

.rounded-input {
	width: 100%;
	padding: 14px 14px 14px 48px; /* Room for the icon */
	border-radius: 50px;
	border: 1px solid #efefef;
	background: #fafafa;
	font-size: 14px; /* Much more readable than 0.5rem */
	outline: none;
	transition: all 0.3s ease;
}

.rounded-input:focus {
	border-color: #34A853;
	background: #fff;
	box-shadow: 0 0 0 4px rgba(52, 168, 83, 0.1);
}

.forgot-password {
	display: block;
	text-align: right;
	font-size: 12px;
	color: #4a90e2; /* Blue to make it clickable */
	text-decoration: none;
	margin-top: 8px;
	padding-right: 5px;
}

.login-but {
	width: 100%;
	padding: 14px;
	margin-top: 25px;
	border-radius: 50px;
	border: none;
	background-color: #34A853;
	color: white;
	font-weight: 700;
	font-size: 16px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	transition: transform 0.2s, background 0.2s;
}

.login-but:hover {
	background-color: #2e9649;
	transform: translateY(-1px);
}

.login-but:active {
	transform: translateY(0px);
}

.back-link {
	color: #333;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
	display: flex;
	align-items: center;
	gap: 8px;
	margin-top: 10px;
	transition: opacity 0.2s;
}

.back-link:hover {
	opacity: 0.7;
}

.footer-text {
	position: absolute;
	bottom: 30px;
	font-size: 11px;
	color: #bbb;
	letter-spacing: 1.5px;
	text-transform: uppercase;
}
</style>
</head>
<body>

	<div class="login-card">
		<div class="logo-section">
			<img src="assets/images/Logo.jpg" alt="SerieMeter" class="logo-img">
			<p class="tagline">Your Digital Archive</p>
		</div>

		<form action="${pageContext.request.contextPath}/Login" method="POST">
			<div class="input-group">
				<c:if test="${not empty error}">
					<p style="color: red; font-size: 12px; margin-bottom: 10px;">${error}</p>
				</c:if>
				<label>Username / Email</label>
				<div class="input-wrapper">
					<img src="assets/icon/user.svg" alt="" class="icon-svg"> 
					<input
						type="text" name="username" class="rounded-input"
						placeholder="Enter your email" value="${typedUse}" required autocomplete="off">
				</div>
			</div>

			<div class="input-group">
				<label>Password</label>
				<div class="input-wrapper">
					<img src="assets/icon/lock.svg" alt="" class="icon-svg"> <input
						type="password" name="password" id="passInput"
						class="rounded-input" placeholder="••••••••" required
						autocomplete="off"> <img src="assets/icon/eye.svg"
						alt="Show" id="eyeIcon" class="icon-svg eye-icon"
						onclick="togglePassword()">
				</div>
				<a href="#" class="forgot-password">Forgot password?</a>
			</div>

			<button type="submit" class="login-but">
				Login <img src="assets/icon/right-arrow-white.svg" alt=""
					style="width: 16px;">
			</button>
		</form>
	</div>

	<a href="#" class="back-link"> <img
		src="assets/icon/left-arrow.svg" alt="" style="width: 14px;"> Go
		Back
	</a>

	<div class="footer-text">©2026 SERIEMETER</div>

	<script>
		function togglePassword() {
			var passwordField = document.getElementById("passInput");
			var eyeIcon = document.getElementById("eyeIcon");

			if (passwordField.type === "password") {
				passwordField.type = "text";
				eyeIcon.src = "assets/icon/eye-black.svg";
			} else {
				passwordField.type = "password";
				eyeIcon.src = "assets/icon/eye.svg";
			}
		}
	</script>

</body>
</html>