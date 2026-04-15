<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home | SerieMeter</title>
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

html, body {
	height: 100%;
	overflow: hidden;
}

.page {
	display: flex;
	flex-direction: column;
	height: 100vh;
	background-color: #fff;
}

/* ── HERO SECTION ── */
.hero-wrapper {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fff;
	position: relative;
	
	/* Modify this part for background image */
	background-image: url('assets/images/home-background.jpg');
	background-size: cover; 
	background-position: center; 
	background-repeat: no-repeat;
}

.hero-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	max-width: 650px;
	padding: 20px;
}

.badge {
	display: inline-block;
	border: 1px solid #D1D5DB;
	border-radius: 999px;
	padding: 6px 18px;
	font-size: 10px;
	font-weight: 700;
	letter-spacing: 1.5px;
	text-transform: uppercase;
	color: #34A853;
	margin-bottom: 30px;
}

.hero-title {
	font-size: 80px;
	font-weight: 800;
	line-height: 0.9;
	letter-spacing: -3px;
	margin-bottom: 24px;
	color: #000;
}

.hero-title .orange {
	color: #FE7032;
	display: block;
	/* Forces 'obsession' to its own line */
}

.hero-sub {
	font-size: 15px;
	color: #6B7280;
	line-height: 1.5;
	max-width: 420px;
	margin-bottom: 35px;
}

.cta-btn {
	background-color: #34A853;
	color: #fff;
	border: none;
	border-radius: 999px;
	padding: 16px 45px;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	text-decoration: none;
	margin-bottom: 25px;
	box-shadow: 0 4px 14px rgba(52, 168, 83, 0.3);
}

.sql-badge {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 10px;
	font-weight: 700;
	letter-spacing: 1.2px;
	text-transform: uppercase;
	color: #9CA3AF;
}

.sql-icon-svg {
	width: 16px;
	height: 16px;
	opacity: 0.6;
}

/* ── FOOTER SECTION ── */
.footer {
	flex-shrink: 0;
	background-color: #fff; /* Changed to white */
	border-top: 1px solid #E5E7EB; /* Light grey top border */
	padding: 30px 80px; 
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.footer-logo img {
	height: 28px;
	width: auto;
}

.footer-links {
	display: flex;
	gap: 40px;
}

.footer-links a {
	font-size: 12px;
	font-weight: 600;
	color: #6B7280;
	text-decoration: none;
	letter-spacing: 1px;
	text-transform: uppercase; /* All caps links */
}

.footer-copy {
	font-size: 11px;
	font-weight: 600;
	color: #9CA3AF;
	text-align: right;
	letter-spacing: 1px;
	text-transform: uppercase; /* All caps copyright */
	line-height: 1.4;
}
</style>
</head>
<body>

	<div class="page">

		<div class="hero-wrapper">
			<div class="hero-content">
				<span class="badge">Introducing Seriemeter</span>

				<h1 class="hero-title">
					Find your next <span class="orange">obsession.</span>
				</h1>

				<p class="hero-sub">The ultimate platform for curated ratings
					and reviews. Discover hidden gems and cinematic masterpieces
					through a lens of true expertise.</p>

				<a href="${pageContext.request.contextPath}/Explore" class="cta-btn">Start Exploring</a>

				<div class="sql-badge">
					<img src="assets/icon/sql.svg" alt="SQL" class="sql-icon-svg">
					SQL Integration
				</div>
			</div>
		</div>

		<footer class="footer">
			<div class="footer-logo">
				<img src="assets/images/Logo.jpg" alt="SerieMeter">
			</div>

			<nav class="footer-links">
				<a href="${pageContext.request.contextPath}/About">About</a> 
				<a href="#">Contact</a> <a href="#">Privacy</a>
				<a href="#">Documentation</a>
			</nav>

			<div class="footer-copy">
				&copy; 2026 SERIEMETER.<br> ALL RIGHTS RESERVED.
			</div>
		</footer>

	</div>

</body>
</html>