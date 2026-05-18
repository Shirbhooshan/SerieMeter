<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Page</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
	
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
	

</head>
<body class="er-error-body">

	<%@ include file="/components/navbar.jsp"%>

	<main class="er-main-layout">
		<div class="er-error-container">

			<div class="er-left-side">
				<p class="er-error-code">Error Code</p>
				<div class="er-error-number">
					<c:out value="${errorCode}" />
				</div>
			</div>

			<div class="er-right-side">

				<c:choose>

					<c:when test="${errorCode == 404}">
						<h1 class="er-title">Scene Not Found.</h1>
						<p class="er-description">This chapter of your cinematic
							journey doesn't exist. The script has reached an unexpected end.</p>
					</c:when>

					<c:when test="${errorCode == 500}">
						<h1 class="er-title">Something Went Wrong.</h1>
						<p class="er-description">The projector has stopped working on
							our end. Our team is looking into it — please try again shortly.</p>
					</c:when>

					<c:when test="${errorCode == 403}">
						<h1 class="er-title">Access Denied.</h1>
						<p class="er-description">You don't have permission to view
							this page. Please log in or return to the homepage.</p>
					</c:when>

					<c:otherwise>
						<h1 class="er-title">Unexpected Error.</h1>
						<p class="er-description">Something went wrong on our end.
							Please return home and try again.</p>
					</c:otherwise>

				</c:choose>

				<div class="er-buttons-group">
					<a href="${pageContext.request.contextPath}/Home"
						class="er-btn er-btn-green">Return home</a> <a
						href="${pageContext.request.contextPath}/Explore"
						class="er-btn er-btn-outline">Search library</a>
				</div>

			</div>

		</div>
	</main>

	<footer class="er-footer">&copy;2026 SERIEMETER</footer>

</body>
</html>