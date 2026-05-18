<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us | SerieMeter</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/aboutUs.css">
</head>
<body>

	<%@ include file="/components/navbar.jsp"%>


	<div class="page-content">

		<!-- HERO -->
		<div class="hero">
			<h1>
				The Minds Behind <span class="green">the Screen.</span>
			</h1>
			<p>A team of second year undergraduate students.</p>
		</div>

		<div class="story-section">
			<div class="story-left">
				<p class="section-label">Our Story</p>
				<div class="orange-line"></div>
			</div>

			<div class="story-right">
				<div class="story-header">SerieMeter was born from a simple
					realization;</div>
				<div class="story-paras">
					<p class="story-para-1">Navigating the vast world of film and
						television can be overwhelming. With countless options at our
						fingertips, finding the perfect movie or series to suit your taste
						can feel like a daunting task. That's where SerieMeter comes in.</p>
					<p class="story-para-2">We envisioned a platform that not only
						provides ratings and reviews but also fosters a vibrant community
						of film enthusiasts. A place where users can connect, share their
						opinions, and discover hidden gems together. And so, SerieMeter
						was born.</p>
				</div>
			</div>
		</div>

		<div class="team-section">
			<div class="team-header-row">
				<p class="section-label">Our Team</p>
				<div class="orange-line"></div>
			</div>

			<div class="team-grid">
				<div class="team-box">
					<div class="image-placeholder">
						<img src="assets/images/aboutUs/Shirbhooshan.png"
							alt="Shirbhooshan">
					</div>
					<div class="name">Shirbhooshan</div>
					<div class="role">Team Lead</div>
					<div class="description">"Description of work done"</div>
				</div>

				<div class="team-box">
					<div class="image-placeholder">
						<img src="assets/images/aboutUs/Safiyah.png" alt="Safiyah">
					</div>
					<div class="name">Safiyah Malik</div>
					<div class="role">Role</div>
					<div class="description">"Description of work done"</div>
				</div>

				<div class="team-box">
					<div class="image-placeholder">
						<img src="assets/images/aboutUs/Shuvam.jpeg" alt="Shuvam">
					</div>
					<div class="name">Shuvam Karki</div>
					<div class="role">Role</div>
					<div class="description">"Description of work done"</div>
				</div>

				<div class="team-box">
					<div class="image-placeholder">
						<img src="assets/images/aboutUs/Avin.jpeg" alt="Avin">
					</div>
					<div class="name">Avin Subedi</div>
					<div class="role">Role</div>
					<div class="description">"Description of work done"</div>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>