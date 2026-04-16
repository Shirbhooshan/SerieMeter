<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up - Seriemeter</title>
</head>
<style>
	/* Reset default browser margins */
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
	background-size: cover; /* Scales the image to fill the screen */
	background-position: center; /* Centers the image */
	background-repeat: no-repeat;
	/* Prevents the image from tiling/repeating */
	padding-top: 60px;
}

.container {
    width: 100%;
    max-width: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

/* --- Logo & Header --- */
.logo-section {
    text-align: center;
    margin-bottom: 35px;
}

.logo {
    height: 35px; 
    margin-bottom: 8px;
}
.logos {
    height: 24px;
    width: 24px;
    margin-right: 5px;
}
.right-arrow {
    height: 24px;
    width: 24px;
    /* color: white;  */
}
.left-arrow {
    height: 24px;
    width: 24px;
}

.subtitle {
    font-size: 20px;
    font-weight: 400;
    letter-spacing: 1.5px;
    color: #000000;
}

/* --- Main Dark Card --- */
.card {
    background-color: #28282B;
    width: 100%;
    border-radius: 16px;
    padding: 35px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    color: white;
    margin-bottom: 30px;
}

.card-header {
    margin-bottom: 25px;
}

.card-header h2 {
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 4px;
}

.card-header p {
    font-size: 16px;
    font-weight: 400;
    color: #b0b0b0;
}

/* --- Form Fields --- */
.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 6px;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    background-color: white;
    border-radius: 30px; /* Pill shape */
    padding: 6px 16px;
}

.input-wrapper .toggle-password {
    margin-right: 0;
    margin-left: auto;
    cursor: pointer;
}

.input-wrapper input {
    border: none;
    outline: none;
    width: 100%;
    padding: 10px 0;
    font-size: 15px;
    font-weight: 400;
    color: #333;
    background: transparent;
}

/* --- Submit Button --- */
.btn-submit {
    width: 100%;
    background-color: #008a00; /* Green button */
    color: white;
    border: none;
    border-radius: 25px; /* Pill shape */
    padding: 14px;
    font-size: 20px;
    font-weight: 400;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    margin-top: 15px;
}

.btn-submit:hover {
    background-color: #006b00; /* Darker green on hover */
}

/* --- Card Footer Links --- */
.card-footer {
    text-align: center;
    margin-top: 20px;
    font-size: 11px;
}

.terms {
    color: #a0a0a0;
    margin-bottom: 60px;
    font-size: 15px;
    font-weight: 400;
}

.terms a, .login-link a {
    color: #008a00;
    text-decoration: none;
}

.login-link {
    color: #d0d0d0;
    font-size: 20px;
    font-weight: 400;
}

/* --- Bottom Page Links --- */
.back-link {
	margin-top: 30px;
    margin-bottom: 60px;
}

.back-link a {
    color: #777;
    text-decoration: none;
    font-size: 20px;
    font-weight: 400;
    display: flex;
    align-items: center;
    gap: 6px;
    transition: color 0.3s;
}

.back-link a:hover {
    color: #333;
}

footer p {
    color: #999;
    font-size: 20px;
    font-weight: 400;
    letter-spacing: 0.5px;
}
</style>
<body>
    <div class="container">
        <header class="logo-section">
            <img src="assets/images/Logo.jpg" alt="Seriemeter Logo" class="logo">
            <p class="subtitle">YOUR DIGITAL ARCHIVE</p>
        </header>

        <div class="card">
            <div class="card-header">
                <h2>Begin your journey</h2>
                <p>Create your profile to start building lists</p>
            </div>

            <form action="RegisterServlet" method="POST" class="register-form">
                
                <div class="form-group">
                    <label for="fullName">FULL NAME</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/user.svg" alt="user-logo" class="logos">
                        <input type="text" id="fullName" name="fullName" placeholder="Random Name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="email-logo" class="logos">
                        <input type="email" id="email" name="email" placeholder="random@gmail.com" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username">USERNAME</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/envelope.svg" alt="user-logo" class="logos">
                        <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">PASSWORD</label>
                    <div class="input-wrapper">
                        <img src="assets/icon/lock.svg" alt="lock-logo" class="logos">
                        <input type="password" id="password" name="password" placeholder="*****" required>
                        <img src="assets/icon/eye-logo.svg" alt="toggle-password" class="logos" class="toggle-password">
                    </div>
                </div>

                <button type="submit" class="btn-submit">
                    Create Account <img src="assets/icon/arrow-right.svg" alt="arrow-logo" class="right-arrow">
                </button>
            </form>

            <div class="card-footer">
                <p class="terms">By creating an account, you agree to our <a href="#">Terms</a>.</p>
                <p class="login-link">Already have a profile? <a href="login.jsp">Sign in</a></p>
            </div>
        </div>

        <div class="back-link">
            <a href="#"><img src="assets/icon/arrow-left.svg" alt="arrow-logo" class="left-arrow"> Go Back</a>
        </div>

        <footer>
            <p>&copy;2026 SERIEMETER</p>
        </footer>
    </div>
</body>
</html>