<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home | SerieMeter</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css" />
	
</head>
<body>

	<%@ include file="components/home_nav.jsp"%>

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

				<a href="${pageContext.request.contextPath}/Explore" class="cta-btn">Start
					Exploring!</a>

			</div>
		</div>

		<footer class="footer">
			<div class="footer-logo">
				<img src="assets/images/Logo.jpg" alt="SerieMeter">
			</div>

			<nav class="footer-links">
				<a href="${pageContext.request.contextPath}/About">About</a> <a
					href="${pageContext.request.contextPath}/Contact">Contact</a><a
					href="https://github.com/Shirbhooshan/SerieMeter">Documentation</a>
			</nav>

			<div class="footer-copy">
				&copy; 2026 SERIEMETER.<br> ALL RIGHTS RESERVED.
			</div>
		</footer>

	</div>

</body>
</html>