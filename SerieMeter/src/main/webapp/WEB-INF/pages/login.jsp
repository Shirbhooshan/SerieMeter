<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css"/>
	
<script src="${pageContext.request.contextPath}/javascript/login.js"></script>

</head>
<body>

	<div class="login-card">
		<div class="logo-section">
			<div>
				<a href="${pageContext.request.contextPath}/Explore"> <img
					src="assets/images/Logo.jpg" alt="SerieMeter" class="logo-img">
				</a>
			</div>
			<p class="tagline">Your Digital Archive</p>
		</div>

		<form action="${pageContext.request.contextPath}/Login" method="POST">
			<div class="input-group">
				<c:if test="${not empty error}">
					<p style="color: red; font-size: 12px; margin-bottom: 10px;">${error}</p>
				</c:if>
				<label>Username / Email</label>
				<div class="input-wrapper">
					<img src="assets/icon/user.svg" alt="" class="icon-svg"> <input
						type="text" name="username" class="rounded-input"
						placeholder="Enter your email" value="${typedUser}" required
						autocomplete="off">
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

			<div
				style="display: flex; align-items: center; gap: 8px; padding-left: 10px; margin-bottom: 5px;">
				<input type="checkbox" name="rememberMe" id="rememberMe"
					style="width: 14px; height: 14px; accent-color: #34A853; cursor: pointer;">
				<label for="rememberMe"
					style="font-size: 12px; color: #666; cursor: pointer;">Remember
					me</label>
			</div>

			<button type="submit" class="login-but">
				Login <img src="assets/icon/right-arrow-white.svg" alt=""
					style="width: 16px;">
			</button>

			<p class="signup-text">
				Don't have an account? <a
					href="${pageContext.request.contextPath}/Register"
					class="signup-link">Sign up</a>
			</p>
		</form>
	</div>

	<button type="button" class="ep-go-back-btn" onclick="history.back()">
		<img src="assets/icon/left-arrow.svg" alt="" style="width: 14px;">
		Go Back
	</button>

	<br>

	<div class="footer-text">©2026 SERIEMETER</div>

</body>
</html>