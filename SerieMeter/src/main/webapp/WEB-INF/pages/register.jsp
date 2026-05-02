<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

=======
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up - Seriemeter</title>
</head>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
<style>
	/* Reset default browser margins */
* {
<<<<<<< HEAD
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
=======
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Manrope', sans-serif;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

body {
<<<<<<< HEAD
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
=======
    background-color: #FAF9F6; /* Light gray background */
    display: flex;
    justify-content: center;
    align-items: center;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* --- Logo above card (centered) --- */
.logo-section {
	text-align: center;
	margin-bottom: 25px;
	width: 100%;
=======
.container {
    width: 100%;
    max-width: 420px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.logo-img {
	width: 100%;
	max-width: 220px;
	height: auto;
	margin-bottom: 10px;
=======
/* --- Logo & Header --- */
.logo-section {
    text-align: center;
    margin-bottom: 25px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.tagline {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 2px;
	color: #555;
	font-weight: 600;
=======
.logo {
    height: 35px; 
    margin-bottom: 8px;
}
.logos {
    height: 14px;
    width: 14px;
    margin-right: 5px;
}
.right-arrow {
    height: 14px;
    width: 14px;
    /* color: white;  */
}
.left-arrow {
    height: 14px;
    width: 14px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
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
=======
.subtitle {
    font-size: 11px;
    letter-spacing: 1.2px;
    color: #555;
    text-transform: uppercase;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* --- Card header text --- */
.card-header {
	text-align: left;
	margin-bottom: 25px;
=======
/* --- Main Dark Card --- */
.card {
    background-color: #2b2b2b; /* Dark gray/black card */
    width: 100%;
    border-radius: 16px;
    padding: 35px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    color: white;
    margin-bottom: 30px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.card-header h2 {
	color: white;
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 4px;
=======
.card-header {
    margin-bottom: 25px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.card-header p {
	color: #999;
	font-size: 12px;
=======
.card-header h2 {
    font-size: 22px;
    font-weight: 500;
    margin-bottom: 4px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* --- Avatar Upload --- */
.avatar-group {
	margin-bottom: 22px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 10px;
=======
.card-header p {
    font-size: 12px;
    color: #b0b0b0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.avatar-group-label {
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	color: #ccc;
	padding-left: 10px;
	letter-spacing: 0.5px;
=======
/* --- Form Fields --- */
.form-group {
    margin-bottom: 18px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.avatar-label {
	cursor: pointer;
	display: inline-block;
	position: relative;
	width: 90px;
	height: 90px;
	align-self: center;
=======
.form-group label {
    display: block;
    font-size: 11px;
    margin-bottom: 6px;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 0.5px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
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
=======
.input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    background-color: white;
    border-radius: 25px; /* Pill shape */
    padding: 4px 15px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
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
=======
.input-wrapper i {
    color: #000000;
    font-size: 14px;
    margin-right: 12px;
}

.input-wrapper .toggle-password {
    margin-right: 0;
    margin-left: auto;
    cursor: pointer;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.avatar-hint {
	font-size: 10px;
	color: #666;
	align-self: center;
=======
.input-wrapper input {
    border: none;
    outline: none;
    width: 100%;
    padding: 10px 0;
    font-size: 13px;
    color: #333;
    background: transparent;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
#profileImageInput {
	display: none;
=======
/* --- Submit Button --- */
.btn-submit {
    width: 100%;
    background-color: #008a00; /* Green button */
    color: white;
    border: none;
    border-radius: 25px; /* Pill shape */
    padding: 14px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    margin-top: 15px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* --- Input Groups --- */
.input-group {
	text-align: left;
	margin-bottom: 20px;
=======
.btn-submit:hover {
    background-color: #006b00; /* Darker green on hover */
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.input-group label {
	display: block;
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	margin-bottom: 8px;
	color: #ccc;
	padding-left: 10px;
=======
/* --- Card Footer Links --- */
.card-footer {
    text-align: center;
    margin-top: 20px;
    font-size: 11px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.input-wrapper {
	position: relative;
	display: flex;
	align-items: center;
=======
.terms {
    color: #a0a0a0;
    margin-bottom: 20px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* All form icons forced black to show on white inputs */
.icon-svg {
	position: absolute;
	left: 18px;
	width: 16px;
	height: 16px;
	pointer-events: none;
	filter: brightness(0);
	opacity: 0.45;
=======
.terms a, .login-link a {
    color: #008a00;
    text-decoration: none;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.eye-icon {
	left: auto;
	right: 18px;
	cursor: pointer;
	pointer-events: all;
=======
.login-link {
    color: #d0d0d0;
    font-size: 12px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
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
=======
/* --- Bottom Page Links --- */
.back-link {
    margin-bottom: 30px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.signup-link {
	color: #34A853;
	text-decoration: none;
	font-weight: 700;
=======
.back-link a {
    color: #777;
    text-decoration: none;
    font-size: 13px;
    display: flex;
    align-items: center;
    gap: 6px;
    transition: color 0.3s;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.signup-link:hover {
	color: #2e9649;
	text-decoration: underline;
=======
.back-link a:hover {
    color: #333;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
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
	margin-top: 20px;
=======
footer p {
    color: #999;
    font-size: 11px;
    letter-spacing: 0.5px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}
</style>
</head>
<body>
<<<<<<< HEAD
=======
    <div class="container">
        <header class="logo-section">
            <img src="assets/images/Logo.jpg" alt="Seriemeter Logo" class="logo">
            <p class="subtitle">YOUR DIGITAL ARCHIVE</p>
        </header>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
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
=======
        <div class="card">
            <div class="card-header">
                <h2>Begin your journey</h2>
                <p>Create your profile to start building lists</p>
            </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
	<div class="page-scroll">
=======
            <form action="${pageContext.request.contextPath}/Register" method="POST" class="register-form">
                
                <div class="form-group">
                    <label for="fullName">FULL NAME</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/user.svg" alt="user-logo" class="logos">
                        <input type="text" id="fullName" name="full_name" placeholder="e.g. John" required>
                    </div>
                </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		<%-- Logo — centered above card --%>
		<div class="logo-section">
			<img src="assets/images/Logo.jpg" alt="SerieMeter" class="logo-img">
			<p class="tagline">Your Digital Archive</p>
		</div>
=======
                <div class="form-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="email-logo" class="logos">
                        <input type="email" id="email" name="email" placeholder="e.g. john@gmail.com" required>
                    </div>
                </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		<div class="register-card">
=======
                <div class="form-group">
                    <label for="username">USERNAME</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="user-logo" class="logos">
                        <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
			<%-- Card heading --%>
			<div class="card-header">
				<h2>Begin your journey</h2>
				<p>Create your profile to start building lists</p>
			</div>
=======
                <div class="form-group">
                    <label for="password">PASSWORD</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/lock.svg" alt="lock-logo" class="logos">
                        <input type="password" id="password" name="password" placeholder="*****" required>
                        <img src="assets/icon/eye-logo.svg" alt="toggle-password" class="logos" class="toggle-password">
                    </div>
                </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
			<form action="${pageContext.request.contextPath}/Register"
				method="POST" enctype="multipart/form-data">
=======
                <button type="submit" class="btn-submit">
                    Create Account <img src="assets/icon/arrow-right.svg" alt="arrow-logo" class="right-arrow">
                </button>
            </form>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
				<%-- Avatar Upload --%>
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
=======
            <div class="card-footer">
                <p class="terms">By creating an account, you agree to our <a href="#">Terms</a>.</p>
                <p class="login-link">Already have a profile? <a href="login.jsp">Sign in</a></p>
            </div>
        </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
				<%-- Full Name --%>
				<div class="input-group">
					<label>Full Name</label>
					<div class="input-wrapper">
						<img src="assets/icon/user.svg" alt="" class="icon-svg"> <input
							type="text" name="full_name" class="rounded-input"
							placeholder="e.g. John Doe" required autocomplete="off">
					</div>
				</div>
=======
        <div class="back-link">
            <a href="index.jsp"><img src="assets/icon/arrow-left.svg" alt="arrow-logo" class="left-arrow"> Go Back</a>
        </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
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
							onclick="togglePassword()" id ="eyeIcon">
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

		<a href="${pageContext.request.contextPath}/Login" class="back-link">
			<img src="assets/icon/left-arrow.svg" alt="" style="width: 14px;">
			Go Back
		</a>

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

=======
        <footer>
            <p>&copy;2026 SERIEMETER</p>
        </footer>
    </div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
</body>
</html>