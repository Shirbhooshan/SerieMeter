<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Messages - Seriemeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/adminFeedback.css">
</head>
<body class="ad-body">

	<div class="ad-layout-container">

		<aside class="ad-sidebar">
			<div>
				<div class="ad-logo-container">
					<a href="${pageContext.request.contextPath}/Explore"> <img
						src="${pageContext.request.contextPath}/assets/images/LogoBlack.jpg"
						alt="Logo">
					</a>
				</div>
				<nav class="ad-nav-menu">
					<a href="${pageContext.request.contextPath}/Dashboard"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> Dashboard
					</a> <a href="${pageContext.request.contextPath}/AdminContent"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> Content Management
					</a> <a href="${pageContext.request.contextPath}/Edit"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/edit.svg"
						class="ad-nav-icon"> Edit
					</a> <a href="${pageContext.request.contextPath}/Report"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/report.svg"
						class="ad-nav-icon"> Report & Analytics
					</a> <a href="${pageContext.request.contextPath}/Feedback"
						class="ad-nav-item active"> <img
						src="${pageContext.request.contextPath}/assets/icon/feedback.svg"
						class="ad-nav-icon"> Feedbacks
					</a> <a href="${pageContext.request.contextPath}/Users"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/users-ad-icon.svg"
						class="ad-nav-icon"> Users
					</a>
				</nav>
			</div>

			<div class="ad-logout-container">
				<a href="${pageContext.request.contextPath}/Logout"
					class="ad-logout-btn"> <img
					src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg"
					class="ad-nav-icon"> Logout
				</a>
			</div>
		</aside>

		<main class="ad-main-content">
			<header class="ad-top-header">
				<h2 class="ad-header-title">View Feedbacks</h2>

				<!-- Only render this section if a user session exists -->
				<%@ include file="/components/adminHeader.jsp"%>

			</header>

			<h1 class="ad-section-title">
				<span class="ad-text-orange">Received</span> feedbacks
			</h1>
			<p class="ad-section-subtitle">View all the feedback messages,
				here.</p>

			<!-- Toolbar: Pushes search to the right -->
			<div class="sm_admin__toolbar">
				<div class="sm_admin__search">
					<input type="text" placeholder="Search for feedbacks"
						id="searchInput" onkeyup="filterTable()" /> <img
						src="assets/icon/search.svg" alt="Search" />
				</div>
			</div>

			<!-- Feedback Table -->
			<div class="ad-user-table-container">
				<table class="ad-user-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>EMAIL ADDRESS</th>
							<th>MESSAGE</th>
						</tr>
					</thead>
					<tbody id="userTableBody">
						<c:choose>
							<c:when test="${empty feedbacks}">
								<tr>
									<td colspan="4"
										style="text-align: center; padding: 30px; color: #aaa;">
										No feedback messages found.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="f" items="${feedbacks}">
									<tr>
										<td>#${f.feedbackNo}</td>
										<td><span class="ad-username-bold">${f.name}</span></td>
										<td>${f.email}</td>
										<td
											style="white-space: normal; line-height: 1.4; max-width: 400px;">
											${f.message}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

				<!-- Load more button -->
				<div style="text-align: center; padding: 15px;">
					<button class="ad-btn-matched" id="loadMoreBtn">Load More
						Medias</button>
				</div>

			</div>
		</main>
	</div>

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const rows = document.querySelectorAll("#userTableBody tr");
	    const loadMoreBtn = document.getElementById("loadMoreBtn");
	    const rowsToShow = 1;
	    let currentCount = rowsToShow;

	    // Initially hide rows beyond the first batch
	    rows.forEach((row, i) => {
	        if (i >= rowsToShow) row.style.display = "none";
	    });

	    // Hide button if total rows are less than the initial batch
	    if (rows.length <= rowsToShow) loadMoreBtn.style.display = "none";

	    loadMoreBtn.addEventListener("click", function() {
	        let nextBatch = currentCount + rowsToShow;
	        
	        rows.forEach((row, i) => {
	            if (i >= currentCount && i < nextBatch) {
	                row.style.display = ""; // Reveal row
	            }
	        });

	        currentCount = nextBatch;

	        // Hide button if we reached the end of the data
	        if (currentCount >= rows.length) {
	            loadMoreBtn.style.display = "none";
	        }
	    });
	});
	</script>

</body>
</html>