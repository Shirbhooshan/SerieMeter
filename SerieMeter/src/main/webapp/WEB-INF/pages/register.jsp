<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | SerieMeter</title>

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
	background-image: url('assets/images/registerBackground.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	overflow: hidden;
}

/* Scrollable inner layer — background stays pinned */
.page-scroll {
	width: 100%;
	height: 100vh;
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	padding: 40px 16px 60px;
}

/* --- Logo above card (centered) --- */
.logo-section {
	text-align: center;
	margin-bottom: 25px;
	width: 100%;
}

.logo-img {
	width: 100%;
	max-width: 220px;
	height: auto;
	margin-bottom: 10px;
}

.tagline {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 2px;
	color: #555;
	font-weight: 600;
}

/* --- Card --- */
.register-card {
	background: #28282B;
	padding: 45px 40px;
	border-radius: 24px;
	box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
	width: 90%;
	max-width: 380px;
	text-align: center;
	margin-bottom: 20px;
}

/* --- Card header text --- */
.card-header {
	text-align: left;
	margin-bottom: 25px;
}

.card-header h2 {
	color: white;
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 4px;
}

.card-header p {
	color: #999;
	font-size: 12px;
}

/* --- Avatar Upload --- */
.avatar-group {
	margin-bottom: 22px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 10px;
}

.avatar-group-label {
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	color: #ccc;
	padding-left: 10px;
	letter-spacing: 0.5px;
}

.avatar-label {
	cursor: pointer;
	display: inline-block;
	position: relative;
	width: 90px;
	height: 90px;
	align-self: center;
}

.avatar-circle {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	background-color: #3a3a3a;
	border: 3px solid #4a4a4a;
	overflow: hidden;
	display: flex;
	align-items: flex-end;
	justify-content: center;
}

/* Force the black SVG to render white */
.avatar-circle .user-icon {
	width: 88px;
	height: 88px;
	filter: brightness(0) invert(1);
	opacity: 0.55;
	margin-bottom: -10px;
	flex-shrink: 0;
}

/* Badge sits OUTSIDE avatar-circle, positioned on the label wrapper */
.avatar-badge {
	position: absolute;
	bottom: 0;
	right: 0;
	width: 26px;
	height: 26px;
	background: #008a00;
	border-radius: 50%;
	border: 2px solid #28282B;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	font-weight: 300;
	color: white;
	line-height: 1;
}

.avatar-hint {
	font-size: 10px;
	color: #666;
	align-self: center;
}

#profileImageInput {
	display: none;
}

/* --- Input Groups --- */
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
	color: #ccc;
	padding-left: 10px;
}

.input-wrapper {
	position: relative;
	display: flex;
	align-items: center;
}

/* All form icons forced black to show on white inputs */
.icon-svg {
	position: absolute;
	left: 18px;
	width: 16px;
	height: 16px;
	pointer-events: none;
	filter: brightness(0);
	opacity: 0.45;
}

.eye-icon {
	left: auto;
	right: 18px;
	cursor: pointer;
	pointer-events: all;
}

.rounded-input {
	width: 100%;
	padding: 14px 14px 14px 48px;
	border-radius: 50px;
	border: 1px solid #3a3a3a;
	background: #fafafa;
	font-size: 14px;
	outline: none;
	color: #1a1a1a;
	transition: all 0.3s ease;
}

.rounded-input::placeholder {
	color: #aaa;
}

.rounded-input:focus {
	border-color: #008a00;
	background: #fff;
	box-shadow: 0 0 0 4px rgba(0, 138, 0, 0.12);
}

/* --- Button --- */
.submit-but {
	width: 100%;
	padding: 14px;
	margin-top: 25px;
	border-radius: 50px;
	border: none;
	background-color: #008a00;
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

.submit-but:hover {
	background-color: #007000;
	transform: translateY(-1px);
}

.submit-but:active {
	transform: translateY(0px);
}

.terms-text {
	font-size: 11px;
	color: #666;
	margin-top: 20px;
	text-align: center;
}

.terms-text a {
	color: #34A853;
	text-decoration: none;
}

.signup-text {
	font-size: 13px;
	color: #666;
	margin-top: 15px;
	text-align: center;
}

.signup-link {
	color: #34A853;
	text-decoration: none;
	font-weight: 700;
}

.signup-link:hover {
	color: #2e9649;
	text-decoration: underline;
}

/* --- Below card --- */
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
	font-size: 11px;
	color: #bbb;
	letter-spacing: 1.5px;
	text-transform: uppercase;
}

/* "Go Back" button */
.ep-go-back-btn:hover {
	opacity: 0.75;
}

.ep-go-back-btn .ep-link-text {
	text-decoration: underline;
}
</style>
</head>
<body>

	<script>
		function previewAvatar(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					// Replace the entire avatar-circle content with the preview image
					var circle = document.querySelector('.avatar-circle');
					circle.innerHTML = '<img src="'
							+ e.target.result
							+ '" '
							+ 'style="width:100%; height:100%; object-fit:cover; border-radius:50%;">';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<div class="page-scroll">

		<!-- Logo — centered above card -->
		<div class="logo-section">
			<div>
				<a href="${pageContext.request.contextPath}/Explore"> <img
					src="assets/images/Logo.jpg" alt="SerieMeter" class="logo-img">
				</a>
			</div>
			<p class="tagline">Your Digital Archive</p>
		</div>

		<div class="register-card">

			<%-- Card heading --%>
			<div class="card-header">
				<h2>Begin your journey</h2>
				<p>Create your profile to start building lists</p>
			</div>

			<c:if test="${not empty errorMessage}">
				<div
					style="background: #fff0f0; border: 1px solid #ffb3b3; border-radius: 10px; padding: 10px 14px; margin-bottom: 16px; font-size: 12px; color: #cc0000;">
					<c:out value="${errorMessage}" />
				</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/Register"
				method="POST" enctype="multipart/form-data">

				<!-- Avatar Upload -->
				<div class="avatar-group">
					<span class="avatar-group-label">Profile Photo</span> <label
						class="avatar-label" for="profileImageInput">
						<div class="avatar-circle">
							<img src="assets/icon/user.svg" alt="avatar" class="user-icon">
						</div>
						<div class="avatar-badge">+</div>
					</label> <span class="avatar-hint">Click to upload (mandatory)</span> <input
						type="file" id="profileImageInput" name="user_profile"
						accept="image/*" onchange="previewAvatar(this)">
				</div>

				<%-- Full Name --%>
				<div class="input-group">
					<label>Full Name</label>
					<div class="input-wrapper">
						<img src="assets/icon/user.svg" alt="" class="icon-svg"> <input
							type="text" name="full_name" class="rounded-input"
							placeholder="e.g. John Doe" required autocomplete="off">
					</div>
				</div>

				<div class="input-group">
					<label>Email Address</label>
					<div class="input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="icon-svg">
						<input type="email" name="email" class="rounded-input"
							placeholder="e.g. john@gmail.com" required autocomplete="off">
					</div>
				</div>

				<div class="input-group">
					<label>Username</label>
					<div class="input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="icon-svg">
						<input type="text" name="username" class="rounded-input"
							placeholder="Enter your username" required autocomplete="off">
					</div>
				</div>

				<div class="input-group">
					<label>Password</label>
					<div class="input-wrapper">
						<img src="assets/icon/lock.svg" alt="" class="icon-svg"> <input
							type="password" name="password" id="passInput"
							class="rounded-input" placeholder="••••••••" required> <img
							src="assets/icon/eye.svg" alt="Show" class="icon-svg eye-icon"
							onclick="togglePassword()" id="eyeIcon">
					</div>
				</div>

				<button type="submit" class="submit-but">
					Create Account <img src="assets/icon/right-arrow-white.svg" alt=""
						style="width: 16px;">
				</button>

				<p class="terms-text">
					By creating an account, you agree to our <a href="#">Terms</a>.
				</p>

				<p class="signup-text">
					Already have an account? <a
						href="${pageContext.request.contextPath}/Login"
						class="signup-link">Sign in</a>
				</p>

			</form>
		</div>

		<button type="button" class="ep-go-back-btn" onclick="history.back()"
			style="background: none; border: none; color: #535353; cursor: pointer; display: flex; align-items: center; gap: 6px; transition: opacity 0.2s ease;">
			<img src="assets/icon/left-arrow.svg" alt="" style="width: 14px;">
			Go Back
		</button>

		<br> 
		
		<div class="footer-text">©2026 SERIEMETER</div>

	</div>

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