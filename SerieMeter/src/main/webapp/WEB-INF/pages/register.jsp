<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

     <!-- Ensures responsiveness on mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up - Seriemeter</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Manrope', sans-serif;
}

body {
    min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	background-image: url('assets/images/registerBackground.png');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	padding-top: 30px;
}

/* Main container for centering content */
.rg-container {
    width: 100%;
    max-width: 480px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 10px 15px;
}

/* --- Logo & Header --- */
.rg-logo-section {
    text-align: center;
    margin-bottom: 20px;
}

/* Main logo */
.rg-logo {
    height: 30px; 
    margin-bottom: 6px;
}
/* Small icons */
.rg-logos {
    height: 14px;
    width: 14px;
    margin-right: 5px;
}
.rg-right-arrow {
    height: 14px;
    width: 14px;
}
.rg-left-arrow {
    height: 14px;
    width: 14px;
}

.rg-subtitle {
    font-size: 10px;
    font-weight: 400;
    letter-spacing: 1px;
    color: #000000;
}

/* --- Main Dark Card --- */
.rg-card {
    background-color: #28282B;
    width: 100%;
    border-radius: 16px;
    padding: 25px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15); /*It provides a subtle shadow for depth */
    color: white;
    margin-bottom: 15px;
}

/* Card header text */
.rg-card-header {
    margin-bottom: 15px;
}

.rg-card-header h2 {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 3px;
}

.rg-card-header p {
    font-size: 14px;
    font-weight: 400;
    color: #b0b0b0;
}

/* --- Form Fields --- */
.rg-form-group {
    margin-bottom: 14px;
}

/* Labels for inputs */
.rg-form-group label {
    display: block;
    font-size: 12px;
    font-weight: 400;
    margin-bottom: 4px;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Input container with icon */
.rg-input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    background-color: white;
    border-radius: 30px;
    padding: 5px 14px;
}

/* Eye icon for password toggle */
.rg-eye-icon {
	position: absolute;
    right: 14px;
    height: 14px;
    width: 14px;
    cursor: pointer;
}

.rg-input-wrapper input {
    border: none;
    outline: none;
    width: 100%;
    padding: 8px 0;
    font-size: 14px;
    font-weight: 400;
    color: #333;
    background: transparent;
}

/* --- Submit Button --- */
.rg-btn-submit {
    width: 100%;
    background-color: #008a00;
    color: white;
    border: none;
    border-radius: 25px;
    padding: 12px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
    margin-top: 10px;
}

.rg-btn-submit:hover {
    background-color: #006b00;
}

/* --- Card Footer Links --- */
.rg-card-footer {
    text-align: center;
    margin-top: 15px;
    font-size: 11px;
}

.rg-terms {
    color: #a0a0a0;
    margin-bottom: 20px;
    font-size: 12px;
    font-weight: 400;
}

.rg-terms a, .rg-login-link a {
    color: #008a00;
    text-decoration: none;
}

.rg-login-link {
    color: #d0d0d0;
    font-size: 14px;
    font-weight: 400;
}

/* --- Bottom Page Links --- */
.rg-back-link {
	margin-top: 15px;
    margin-bottom: 20px;
}

.rg-back-link a {
    color: #777;
    text-decoration: none;
    font-size: 14px;
    font-weight: 400;
    display: flex;
    align-items: center;
    gap: 6px;
}

.rg-back-link a:hover {
    color: #333;
}

footer p {
    color: #999;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 0.5px; /*Space for the text*/
}
</style>
<body>
    <div class="rg-container">
        <!-- Logo Section -->
        <header class="rg-logo-section">
            <img src="assets/images/Logo.jpg" alt="Seriemeter Logo" class="rg-logo">
            <p class="rg-subtitle">YOUR DIGITAL ARCHIVE</p>
        </header>

         <!-- Registration form card -->
        <div class="rg-card">
            <div class="rg-card-header">
                <h2>Begin your journey</h2>
                <p>Create your profile to start building lists</p>
            </div>

            <!-- Form submits data to RegisterServlet -->
            <form action="RegisterServlet" method="POST">
                
                <div class="rg-form-group">
                    <label for="fullName">FULL NAME</label>
                    <div class="rg-input-wrapper">
                        <img src="assets/icon/user.svg" alt="user icon" class="rg-logos">
                        <input type="text" id="fullName" name="fullName" placeholder="Random Name" required>
                    </div>
                </div>

                <div class="rg-form-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <div class="rg-input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="email-logo" class="rg-logos">
                        <input type="email" id="email" name="email" placeholder="random@gmail.com" required>
                    </div>
                </div>

                <div class="rg-form-group">
                    <label for="username">USERNAME</label>
                    <div class="rg-input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="user-logo" class="rg-logos">
                        <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                </div>

                <div class="rg-form-group">
                    <label for="password">PASSWORD</label>
                    <div class="rg-input-wrapper">
                        <img src="assets/icon/lock.svg" alt="lock-logo" class="rg-logos">
                        <input type="password" id="password" name="password" placeholder="*****" required>
                       <img src="assets/icon/eye-black.svg" 
     						alt="toggle-password" 
     						id="eyeIcon"
    	 					class="rg-eye-icon" 
     						onclick="togglePassword()">
                    </div>
                </div>

                  <!-- Submit button -->
                <button type="submit" class="rg-btn-submit">
                    Create Account <img src="assets/icon/arrow-right.svg" alt="arrow-logo" class="rg-right-arrow">
                </button>
            </form>

             <!-- Footer inside card -->
            <div class="rg-card-footer">
                <p class="rg-terms">By creating an account, you agree to our <a href="#">Terms</a>.</p>
                <p class="rg-login-link">Already have a profile? <a href="login.jsp">Sign in</a></p>
            </div>
        </div>

        <!-- Back to login -->
        <div class="rg-back-link">
            <a href="${pageContext.request.contextPath}/Login"><img src="assets/icon/arrow-left.svg" alt="arrow-logo" class="rg-left-arrow"> Go Back</a>
        </div>

         <!-- Footer -->
        <footer>
            <p>&copy;2026 SERIEMETER</p>
        </footer>
    </div>

     <!-- JavaScript: Toggle password visibility -->
    <script>
		function togglePassword() {
			var passwordField = document.getElementById("password");
			var eyeIcon = document.getElementById("eyeIcon");

			if (passwordField.type === "password") {
				passwordField.type = "text";
				eyeIcon.src = "assets/icon/eye.svg";
			} else {
				passwordField.type = "password";
				eyeIcon.src = "assets/icon/eye-black.svg";
			}
		}
	</script>
</body>
</html>