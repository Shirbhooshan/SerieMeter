<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | SerieMeter</title>

<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">

<style>

/* Global reset: remove default spacing and enforce border-box sizing */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

/* Full-viewport body with fixed background image */
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

/* Scrollable overlay layer so content scrolls while background stays fixed */
.rg-page-scroll {
	width: 100%;
	height: 100vh;
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	padding: 40px 16px 60px;
}

/* Centered logo block above the card */
.rg-logo-section {
	text-align: center;
	margin-bottom: 25px;
	width: 100%;
}

/* Responsive logo image capped at 220px */
.rg-logo-img {
	width: 100%;
	max-width: 220px;
	height: auto;
	margin-bottom: 10px;
}

/* Subtle uppercase tagline under the logo */
.rg-tagline {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 2px;
	color: #555;
	font-weight: 600;
}

/* Dark rounded card that wraps the registration form */
.rg-register-card {
	background: #28282B;
	padding: 45px 40px;
	border-radius: 24px;
	box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
	width: 90%;
	max-width: 380px;
	text-align: center;
	margin-bottom: 20px;
}

/* Left-aligned heading and subtext at the top of the card */
.rg-card-header {
	text-align: left;
	margin-bottom: 25px;
}

/* Card primary heading */
.rg-card-header h2 {
	color: white;
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 4px;
}

/* Card subtext */
.rg-card-header p {
	color: #999;
	font-size: 12px;
}

/* Column layout for the avatar upload section */
.rg-avatar-group {
	margin-bottom: 22px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 10px;
}

/* Small uppercase label above the avatar circle */
.rg-avatar-group-label {
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	color: #ccc;
	padding-left: 10px;
	letter-spacing: 0.5px;
}

/* Clickable label wrapper that sizes and positions the avatar and badge */
.rg-avatar-label {
	cursor: pointer;
	display: inline-block;
	position: relative;
	width: 90px;
	height: 90px;
	align-self: center;
}

/* Circular container for the avatar image or placeholder icon */
.rg-avatar-circle {
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

/* Default placeholder icon — inverted to appear white on the dark circle */
.rg-avatar-circle .rg-user-icon {
	width: 88px;
	height: 88px;
	filter: brightness(0) invert(1);
	opacity: 0.55;
	margin-bottom: -10px;
	flex-shrink: 0;
}

/* Green "+" badge anchored to the bottom-right of the avatar */
.rg-avatar-badge {
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

/* Small helper text below the avatar */
.rg-avatar-hint {
	font-size: 10px;
	color: #666;
	align-self: center;
}

/* Hidden native file input — triggered via the avatar label click */
#profileImageInput {
	display: none;
}

/* Labeled input field wrapper with bottom spacing */
.rg-input-group {
	text-align: left;
	margin-bottom: 20px;
}

/* Uppercase micro-label above each input */
.rg-input-group label {
	display: block;
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	margin-bottom: 8px;
	color: #ccc;
	padding-left: 10px;
}

/* Relative wrapper so icons can be absolutely positioned inside inputs */
.rg-input-wrapper {
	position: relative;
	display: flex;
	align-items: center;
}

/* Absolute left icon inside each input field */
.rg-icon-svg {
	position: absolute;
	left: 18px;
	width: 16px;
	height: 16px;
	pointer-events: none;
	filter: brightness(0);
	opacity: 0.45;
}

/* Eye icon floats to the right edge of the password input */
.rg-eye-icon {
	left: auto;
	right: 18px;
	cursor: pointer;
	pointer-events: all;
}

/* Pill-shaped text input with left padding reserved for the icon */
.rg-rounded-input {
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

/* Muted placeholder color */
.rg-rounded-input::placeholder {
	color: #aaa;
}

/* Green focus ring on active input */
.rg-rounded-input:focus {
	border-color: #008a00;
	background: #fff;
	box-shadow: 0 0 0 4px rgba(0, 138, 0, 0.12);
}

/* Full-width green pill submit button */
.rg-submit-btn {
	width: 100%;
	padding: 14px;
	margin-top: 25px;
	border-radius: 50px;
	border: none;
	background-color: #008a00;
	color: white;
	font-weight: 700;
	font-size: 16px;
	font-family: 'Manrope', sans-serif;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	transition: transform 0.2s, background 0.2s;
}

/* Slight lift on hover */
.rg-submit-btn:hover {
	background-color: #007000;
	transform: translateY(-1px);
}

/* Reset lift on click */
.rg-submit-btn:active {
	transform: translateY(0px);
}

/* Small terms disclaimer below the submit button */
.rg-terms-text {
	font-size: 11px;
	color: #666;
	margin-top: 20px;
	text-align: center;
}

/* Green link inside the terms text */
.rg-terms-text a {
	color: #34A853;
	text-decoration: none;
}

/* "Already have an account?" prompt */
.rg-signup-text {
	font-size: 13px;
	color: #666;
	margin-top: 15px;
	text-align: center;
}

/* Green bold sign-in link */
.rg-signup-link {
	color: #34A853;
	text-decoration: none;
	font-weight: 700;
}

/* Underline on hover */
.rg-signup-link:hover {
	color: #2e9649;
	text-decoration: underline;
}

/* Text link styled as a subtle back navigation */
.rg-back-link {
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

/* Fade on hover */
.rg-back-link:hover {
	opacity: 0.7;
}

/* Copyright line pinned to the bottom of the viewport */
.rg-footer-text {
	position: static;
	font-size: 11px;
	color: #bbb;
	letter-spacing: 1.5px;
	text-transform: uppercase;
}

/* Go-back button fades on hover */
.rg-go-back-btn:hover {
	opacity: 0.75;
}

/* Underline for the text portion of the go-back button */
.rg-go-back-btn .rg-link-text {
	text-decoration: underline;
}

/* ── Media Queries */

/* Tablet / half-screen: tighten spacing and shrink card padding */
@media (max-width: 768px) {

	/* Allow page body to scroll at smaller heights */
	body {
		overflow: auto;
		height: auto;
	}

	/* Reduce top/bottom padding on the scroll wrapper */
	.rg-page-scroll {
		padding: 28px 14px 80px;
		justify-content: flex-start;
	}

	/* Less breathing room below logo */
	.rg-logo-section {
		margin-bottom: 18px;
	}

	/* Slightly smaller logo */
	.rg-logo-img {
		max-width: 170px;
	}

	/* Tighter card padding and softer border-radius */
	.rg-register-card {
		padding: 32px 26px;
		border-radius: 18px;
		width: 95%;
		max-width: 360px;
	}

	/* Slightly smaller card heading */
	.rg-card-header h2 {
		font-size: 18px;
	}

	/* Reduce gap between input fields */
	.rg-input-group {
		margin-bottom: 16px;
	}

	/* Tighter input padding and smaller font */
	.rg-rounded-input {
		padding: 12px 12px 12px 44px;
		font-size: 13px;
	}

	/* Slimmer submit button */
	.rg-submit-btn {
		padding: 12px;
		font-size: 15px;
		margin-top: 20px;
	}

	/* Shrink avatar circle */
	.rg-avatar-label,
	.rg-avatar-circle {
		width: 76px;
		height: 76px;
	}

	/* Scale avatar icon proportionally */
	.rg-avatar-circle .rg-user-icon {
		width: 74px;
		height: 74px;
	}

	/* Detach footer from viewport so it doesn't overlap the card */
	.rg-footer-text {
		position: static;
		margin-top: 18px;
		display: block;
		text-align: center;
	}
}

/* Mobile: further compress all elements for narrow screens */
@media (max-width: 480px) {

	/* Minimal horizontal padding */
	.rg-page-scroll {
		padding: 20px 10px 70px;
	}

	/* Compact logo */
	.rg-logo-img {
		max-width: 140px;
	}

	/* Tighter tagline letter-spacing */
	.rg-tagline {
		font-size: 10px;
		letter-spacing: 1.5px;
	}

	/* Full-width card with minimal padding */
	.rg-register-card {
		padding: 26px 18px;
		border-radius: 14px;
		width: 100%;
	}

	/* Smaller heading on narrow screens */
	.rg-card-header h2 {
		font-size: 16px;
	}

	/* Smaller subtext */
	.rg-card-header p {
		font-size: 11px;
	}

	/* Compact input field */
	.rg-rounded-input {
		padding: 11px 11px 11px 40px;
		font-size: 13px;
	}

	/* Shift icon left to match reduced input padding */
	.rg-icon-svg {
		left: 13px;
		width: 14px;
		height: 14px;
	}

	/* Slim submit button */
	.rg-submit-btn {
		font-size: 14px;
		padding: 11px;
	}

	/* Smaller disclaimer text */
	.rg-terms-text,
	.rg-signup-text {
		font-size: 11px;
	}

	/* Smaller avatar on mobile */
	.rg-avatar-label,
	.rg-avatar-circle {
		width: 64px;
		height: 64px;
	}

	/* Scale icon inside avatar */
	.rg-avatar-circle .rg-user-icon {
		width: 62px;
		height: 62px;
	}

	/* Shrink the green badge proportionally */
	.rg-avatar-badge {
		width: 22px;
		height: 22px;
		font-size: 15px;
	}
}
</style>
</head>
<body>

	<script>
		/* Replace avatar placeholder with the selected image preview */
		function previewAvatar(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var circle = document.querySelector('.rg-avatar-circle');
					circle.innerHTML = '<img src="' + e.target.result + '" '
						+ 'style="width:100%; height:100%; object-fit:cover; border-radius:50%;">';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<div class="rg-page-scroll">

		<!-- Centered logo and tagline above the card -->
		<div class="rg-logo-section">
			<div>
				<a href="${pageContext.request.contextPath}/Explore">
					<img src="assets/images/Logo.jpg" alt="SerieMeter" class="rg-logo-img">
				</a>
			</div>
			<p class="rg-tagline">Your Digital Archive</p>
		</div>

		<div class="rg-register-card">

			<%-- Card heading and subtext --%>
			<div class="rg-card-header">
				<h2>Begin your journey</h2>
				<p>Create your profile to start building lists</p>
			</div>

			<form action="${pageContext.request.contextPath}/Register"
				method="POST" enctype="multipart/form-data">

				<%-- Avatar upload with circular preview --%>
				<div class="rg-avatar-group">
					<span class="rg-avatar-group-label">Profile Photo</span>
					<label class="rg-avatar-label" for="profileImageInput">
						<div class="rg-avatar-circle">
							<img src="assets/icon/user.svg" alt="avatar" class="rg-user-icon">
						</div>
						<div class="rg-avatar-badge">+</div>
					</label>
					<span class="rg-avatar-hint">Click to upload (mandatory)</span>
					<input type="file" id="profileImageInput" name="user_profile"
						accept="image/*" onchange="previewAvatar(this)">
				</div>

				<%-- Full Name field --%>
				<div class="rg-input-group">
					<label>Full Name</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/user.svg" alt="" class="rg-icon-svg">
						<input type="text" name="full_name" class="rg-rounded-input"
							placeholder="e.g. John Doe" required autocomplete="off">
					</div>
				</div>

				<%-- Email address field --%>
				<div class="rg-input-group">
					<label>Email Address</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="rg-icon-svg">
						<input type="email" name="email" class="rg-rounded-input"
							placeholder="e.g. john@gmail.com" required autocomplete="off">
					</div>
				</div>

				<%-- Username field --%>
				<div class="rg-input-group">
					<label>Username</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="rg-icon-svg">
						<input type="text" name="username" class="rg-rounded-input"
							placeholder="Enter your username" required autocomplete="off">
					</div>
				</div>

				<%-- Password field with toggle visibility button --%>
				<div class="rg-input-group">
					<label>Password</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/lock.svg" alt="" class="rg-icon-svg">
						<input type="password" name="password" id="passInput"
							class="rg-rounded-input" placeholder="••••••••" required>
						<img src="assets/icon/eye.svg" alt="Show"
							class="rg-icon-svg rg-eye-icon"
							onclick="togglePassword()" id="eyeIcon">
					</div>
				</div>

				<%-- Submit button --%>
				<button type="submit" class="rg-submit-btn">
					Create Account
					<img src="assets/icon/right-arrow-white.svg" alt="" style="width: 16px;">
				</button>

				<%-- Terms agreement note --%>
				<p class="rg-terms-text">
					By creating an account, you agree to our <a href="#">Terms</a>.
				</p>

				<%-- Sign-in redirect for existing users --%>
				<p class="rg-signup-text">
					Already have an account?
					<a href="${pageContext.request.contextPath}/Login" class="rg-signup-link">Sign in</a>
				</p>

			</form>
		</div>

		<%-- Go back button below the card --%>
		<button type="button" class="rg-go-back-btn" onclick="history.back()"
			style="background: none; border: none; color: #535353; cursor: pointer; display: flex; align-items: center; gap: 6px; transition: opacity 0.2s ease;">
			<img src="assets/icon/left-arrow.svg" alt="" style="width: 14px;">
			Go Back
		</button>

		<%-- Copyright footer --%>
		<div class="rg-footer-text">©2026 SERIEMETER</div>

	</div>

	<script>
		/* Toggle password field between text and password type */
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
