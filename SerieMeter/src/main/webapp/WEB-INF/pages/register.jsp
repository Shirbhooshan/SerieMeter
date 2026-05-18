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
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<script src="${pageContext.request.contextPath}/javascript/register.js"></script>
</head>
<body>

	<div class="rg-page-scroll">

		<!-- Centered logo and tagline above the card -->
		<div class="rg-logo-section">
			<div>
				<a href="${pageContext.request.contextPath}/Explore"> <img
					src="assets/images/Logo.jpg" alt="SerieMeter" class="rg-logo-img">
				</a>
			</div>
			<p class="rg-tagline">Your Digital Archive</p>
		</div>

		<div class="rg-register-card">

			<div class="rg-card-header">
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

				<!-- Let the user pick a profile photo before filling out anything else -->
				<div class="rg-avatar-group">
					<span class="rg-avatar-group-label">Profile Photo</span> <label
						class="rg-avatar-label" for="profileImageInput">
						<div class="rg-avatar-circle">
							<img src="assets/icon/user.svg" alt="avatar" class="rg-user-icon">
						</div>
						<div class="rg-avatar-badge">+</div>
					</label> <span class="rg-avatar-hint">Click to upload (mandatory)</span> <input
						type="file" id="profileImageInput" name="user_profile"
						accept="image/*" onchange="previewAvatar(this)">
				</div>

				<div class="rg-input-group">
					<label>Full Name</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/user.svg" alt="" class="rg-icon-svg">
						<input type="text" name="full_name" class="rg-rounded-input"
							placeholder="e.g. John Doe" required autocomplete="off">
					</div>
				</div>

				<div class="rg-input-group">
					<label>Email Address</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="rg-icon-svg">
						<input type="email" name="email" class="rg-rounded-input"
							placeholder="e.g. john@gmail.com" required autocomplete="off">
					</div>
				</div>

				<div class="rg-input-group">
					<label>Username</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/envelope.svg" alt="" class="rg-icon-svg">
						<input type="text" name="username" class="rg-rounded-input"
							placeholder="Enter your username" required autocomplete="off">
					</div>
				</div>

				<!-- The eye icon on the right lets users reveal what they're typing -->
				<div class="rg-input-group">
					<label>Password</label>
					<div class="rg-input-wrapper">
						<img src="assets/icon/lock.svg" alt="" class="rg-icon-svg">
						<input type="password" name="password" id="passInput"
							class="rg-rounded-input" placeholder="••••••••" required>
						<img src="assets/icon/eye.svg" alt="Show"
							class="rg-icon-svg rg-eye-icon" onclick="togglePassword()"
							id="eyeIcon">
					</div>
				</div>

				<button type="submit" class="rg-submit-btn">
					Create Account <img src="assets/icon/right-arrow-white.svg" alt=""
						style="width: 16px;">
				</button>

				<p class="rg-terms-text">
					By creating an account, you agree to our <a href="#">Terms</a>.
				</p>

				<!-- Send existing users straight to the login page instead of creating a duplicate account -->
				<p class="rg-signup-text">
					Already have an account? <a
						href="${pageContext.request.contextPath}/Login"
						class="rg-signup-link">Sign in</a>
				</p>

			</form>
		</div>

		<!-- Go back button below the card -->
		<button type="button" class="rg-go-back-btn" onclick="history.back()"
			style="background: none; border: none; color: #535353; cursor: pointer; display: flex; align-items: center; gap: 6px; transition: opacity 0.2s ease;">
			<img src="assets/icon/left-arrow.svg" alt="" style="width: 14px;">
			Go Back
		</button>

		<br>

		<!-- Copyright footer -->
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

	<!-- Approval popup: shown only after a successful registration. -->

	<c:if test="${pendingApproval == true}">
		<div class="approval-popup-overlay">
			<div class="approval-popup">
				<h2>Thank you for registering!</h2>
				<p>Your account is pending admin approval. You will be able to
					log in once an admin has approved your account. In the meantime,
					feel free to browse our media.</p>
				<a href="${pageContext.request.contextPath}/Explore"
					class="explore-btn">Keep browsing medias</a>
			</div>
		</div>
	</c:if>

</body>
</html>
