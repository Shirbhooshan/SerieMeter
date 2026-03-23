<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | SerieMeter</title>

<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
	<style>
		* {
			font-family: 'Manrope';
		}
	</style>

</head>
<body>
	<div class="title-container">
		<h1 class = "title-heading">SerieMeter</h1>
		<p class = "title-subtext" style="font-family: 'Manrope'; text-transform: uppercase; letter-spacing: 3px;">Your Digital Archive.</p>
	</div>
	
	<div class = "login-container">
		<div class = "login-box">
		
			<div class = "login-details">
			
				<div class = email>
					<p>Username/Email</p>
					<input type="text" class="rounded-input" placeholder = "Enter your username" autocomplete = off>
					
					<p>Password</p>
					<input type="text" class="rounded-input" placeholder = "Enter your password" autocomplete = off>
					<p class="forgot-password">Forgot password?</p>
					<button class = "login-but">Login</button>
				</div>
				
			</div>		
		</div>
			
		<p class = "back-but"><a href="#">Go Back</a></p>
		
		<div class = "short-footer" style="text-transform: uppercase;">
			<p>©2026 SerieMeter</p>
		</div>
	</div>
</body>
</html>