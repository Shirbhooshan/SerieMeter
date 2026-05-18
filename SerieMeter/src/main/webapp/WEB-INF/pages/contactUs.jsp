<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us | SerieMeter</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/contactUs.css">
</head>
<body>

	<%@ include file="/components/navbar.jsp"%>

	<div class="page-wrapper">
		<div class="contact-left">
			<h1 class="contact-heading">Contact Us</h1>
			<div class="visual-bg"></div>
		</div>

		<div class="contact-middle">

			<c:if test="${not empty successMessage}">
				<p
					style="color: #34A853; font-size: 14px; font-weight: 700; margin-bottom: 20px;">
					${successMessage}</p>
			</c:if>

			<c:if test="${not empty errorMessage}">
				<p
					style="color: #eb4034; font-size: 14px; font-weight: 700; margin-bottom: 20px;">
					${errorMessage}</p>
			</c:if>

			<form action="${pageContext.request.contextPath}/Contact"
				method="POST" class="contact-form">
				<div class="form-group">
					<label for="name">Full Name</label> <input type="text" id="name"
						name="fullName" placeholder="e.g. John Doe" required>
				</div>

				<div class="form-group">
					<label for="email">E-mail</label> <input type="email" id="email"
						name="email" placeholder="e.g. john@gmail.com" required>
				</div>

				<div class="form-group">
					<label for="message">Message</label>
					<textarea id="message" name="message"
						placeholder="Write your message here..." required></textarea>
				</div>

				<button type="submit" class="submit-btn">Contact Us</button>
			</form>
		</div>

		<aside class="contact-right">
			<div class="info-label">Contact</div>
			<a href="mailto:seriemeter@gmail.com" class="info-email">seriemeter@gmail.com</a>

			<div class="social-links">
				<a href="#"><img src="assets/icon/facebook.svg" alt="FB"></a>
				<a href="#"><img src="assets/icon/instagram.svg" alt="IG"></a>
				<a href="#"><img src="assets/icon/linkedin.svg" alt="LI"></a>
			</div>
		</aside>
	</div>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>