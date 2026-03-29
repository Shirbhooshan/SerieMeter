<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<<<<<<< HEAD
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
=======
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | SerieMeter</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    
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
            background-image: url('assets/bg-pattern.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            overflow: hidden;
        }

        .login-card {
            background: white;
            padding: 35px 30px; /* Thinner padding for a compact look */
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.06);
            width: 90%;
            max-width: 300px; 
            text-align: center;
            margin-bottom: 20px;
        }

        .logo-section {
            margin-bottom: 25px;
        }

        .logo-img {
            width: 230px; 
            height: auto;
            margin-bottom: 8px;
        }

        .tagline {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 5%;
			margin-top: -10px;
            color: #808080;
        }

        .input-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-size: 0.65rem;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 5px;
            color: #333;
            padding-left: 5px;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .icon-svg {
            position: absolute;
            left: 15px;
            width: 15px;
            height: 15px;
            pointer-events: none;
        }

        .eye-icon {
            left: auto;
            right: 15px;
            cursor: pointer;
            pointer-events: all;
        }

        .rounded-input {
            width: 100%;
            padding: 11px 11px 11px 40px;
            border-radius: 50px;
            border: 1px solid #f2f2f2;
            background: #fafafa;
            font-size: 0.5rem;
            outline: none;
            transition: 0.2s ease;
        }

        .rounded-input:focus {
            border-color: #34A853;
            background: #fff;
        }

        .forgot-password {
            display: block;
            text-align: right;
            font-size: 0.6rem;
            color: #777;
            text-decoration: none;
            margin-top: 5px;
            padding-right: 5px;
        }

        .login-but {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border-radius: 50px;
            border: none;
            background-color: #34A853;
            color: white;
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: 0.2s;
        }

        .login-but:hover {
            filter: brightness(1.05);
        }

        .back-link {
            color: black;
            font-size: 0.75rem;
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .footer-text {
            position: absolute;

            bottom: 30px; 
            font-size: 0.65rem;
            color: #ccc;
            letter-spacing: 1px;
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

        <form action="${pageContext.request.contextPath}/Home" method="POST">
            <div class="input-group">
                <label>Username / Email</label>
                <div class="input-wrapper">
                    <img src="assets/icon/user.svg" alt="" class="icon-svg">
                    <input type="text" name="username" class="rounded-input" placeholder="Enter your email" required autocomplete = off>
                </div>
            </div>

            <div class="input-group">
                <label>Password</label>
                <div class="input-wrapper">
                    <img src="assets/icon/lock.svg" alt="" class="icon-svg">
                    <input type="password" name="password" class="rounded-input" placeholder="•••••" required autocomplete = off>
                    <img src="assets/icon/eye.svg" alt="Show" class="icon-svg eye-icon">
                </div>
                <a href="#" class="forgot-password">Forgot password?</a>
            </div>

            <button type="submit" class="login-but">
                Login 
                <img src="assets/icon/right-arrow-white.svg" alt="" style="width: 14px;">
            </button>
        </form>
    </div>

    <a href="#" class="back-link">
        <img src="assets/icon/left-arrow.svg" alt="" style="width: 12px;">
        Go Back
    </a>

    <div class="footer-text">
        ©2026 SERIEMETER
    </div>
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git

</body>
</html>