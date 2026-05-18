<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report & Analytics - SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/adminReport.css">
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
						class="ad-nav-item active"> <img
						src="${pageContext.request.contextPath}/assets/icon/report.svg"
						class="ad-nav-icon"> Report & Analytics
					</a> <a href="${pageContext.request.contextPath}/Feedback"
						class="ad-nav-item"> <img
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
				<h4 class="ad-header-title">Reports</h4>
				<%@ include file="/components/adminHeader.jsp"%>
			</header>

			<h1 class="ad-section-title">
				<span class="ad-text-orange">Report</span> & Analytics
			</h1>

			<div class="ad-stats-grid">
				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img
							src="${pageContext.request.contextPath}/assets/icon/users-report.svg">
					</div>
					<span class="ad-stat-label">Registered Users</span>
					<h2 class="ad-stat-value">${totalUsers}</h2>
				</div>
				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img
							src="${pageContext.request.contextPath}/assets/icon/review-report.svg">
					</div>
					<span class="ad-stat-label">Total Reviews</span>
					<h2 class="ad-stat-value">${totalReviews}</h2>
				</div>
				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img
							src="${pageContext.request.contextPath}/assets/icon/medias.svg">
					</div>
					<span class="ad-stat-label">Total Medias</span>
					<h2 class="ad-stat-value">${totalMedia}</h2>
				</div>
				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img
							src="${pageContext.request.contextPath}/assets/icon/star-report.svg">
					</div>
					<span class="ad-stat-label">Average Ratings</span>
					<h2 class="ad-stat-value">${avgRating}</h2>
				</div>
			</div>

			<div class="ad-chart-container">
				<div class="ad-chart-title">Review Distribution by Genre (%)</div>
				<div class="ad-bar-chart">
					<c:forEach var="entry" items="${genreCounts}">
						<div class="ad-bar-group">
							<c:set var="percentage"
								value="${(entry.value * 100.0) / totalGenreReviews}" />

							<div class="ad-bar ${entry.value == maxCount ? 'highlight' : ''}"
								style="height: ${percentage}%;"></div>
							<div class="ad-bar-label">
								${entry.key} <br> <span
									style="font-size: 10px; opacity: 0.7;">${entry.value}
									(${String.format("%.1f", percentage)}%)</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<section class="ad-table-section">
				<div class="ad-table-header-row">
					<div class="ad-table-info">
						<h3>Medias</h3>
						<p>Highest engaging titles</p>
					</div>
				</div>

				<table class="ad-media-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Category</th>
							<th>Genre</th>
							<th>Bookmarks</th>
							<th>Reviews</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${topMedia}">
							<tr>
								<td>#${item.mediaId}</td>
								<td>
									<div style="display: flex; align-items: center; gap: 12px;">
										<c:choose>
											<c:when test="${not empty item.mediaProfile}">
												<img class="ad-cover-thumb"
													src="${pageContext.request.contextPath}/getimage?name=${item.mediaProfile}&type=media"
													alt="${item.title}"
													onerror="this.style.opacity='0.3'; this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg';" />
											</c:when>
											<c:otherwise>
												<div class="ad-cover-thumb"
													style="background: #eee; border: 1px solid #ddd;"></div>
											</c:otherwise>
										</c:choose>
										<span>${item.title}</span>
									</div>
								</td>
								<td><c:choose>
										<c:when test="${item.categoryId == 1}">Movie</c:when>
										<c:otherwise>Series</c:otherwise>
									</c:choose></td>
								<td>${item.genreName}</td>
								<td>${item.bookmarkCount}</td>
								<td>${item.reviewCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Load more button -->
				<div style="text-align: center; padding: 15px;">
					<button class="ad-btn-matched" id="loadMoreBtn">Load More
						Medias</button>
				</div>

			</section>
		</main>
	</div>

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const rows = document.querySelectorAll(".ad-media-table tbody tr");
	    const loadMoreBtn = document.getElementById("loadMoreBtn");
	    const rowsToShow = 3;
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