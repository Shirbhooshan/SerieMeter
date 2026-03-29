<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>

<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">

</head>
<body>
	<div class="title-container">
		<h1 class = "title-heading">SerieMeter</h1>
		<p class = "title-subtext" style="font-family: 'Manrope'; text-transform: uppercase; letter-spacing: 3px;">Your Digital Archive.</p>
	</div>
	
	<div class = "signup-container">
		<div class = "signup-box">
		
			<div class = "signup-details">
				
				<div class = "signup-subtext">
				
					<h3>Begin your journey.</h3>
					<p>Create your own profile to start saving and reviewing.</p>
				
				</div>
			
				<div class = "username">
					<p>Full Name</p>
					<input type="text" class="rounded-input" placeholder = "Enter your full name" autocomplete = off>
					
					<p>Email Address</p>
					<input type="text" class="rounded-input" placeholder = "e.g. seriemeter@gmail.com" autocomplete = off>
					
					<p>Password</p>
					<input type="text" class="rounded-input" placeholder = "Enter Password" autocomplete = off>
					<br>
					<button class = "create-account-but">Create Account</button>
					
					<p>By creating an account, you agree to our Terms.</p>
					
					<p>Already have an Account? Sign up </p>
				</div>
			</div>		
		</div>
			
		<p>Go Back</p>
		
		<div class = "short-footer" style="text-transform: uppercase;">
			<p>©2026 SerieMeter</p>
		</div>
	</div>
</body>
</html>