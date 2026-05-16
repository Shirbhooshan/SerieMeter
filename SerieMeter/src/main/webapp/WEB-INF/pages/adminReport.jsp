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

<style>
/* --- Global Styles --- */
:root {
	--accent-orange: #e37329;
	--accent-green: #4ebc57;
}

.ad-body {
	font-family: 'Manrope', sans-serif;
	background-color: #010101;
	color: #ffffff;
	margin: 0;
	padding: 10px;
	height: 100vh;
	box-sizing: border-box;
	overflow: hidden;
}

* {
	box-sizing: border-box;
}

/* --- Layout --- */
.ad-layout-container {
	display: flex;
	height: 100%;
	gap: 10px;
}

.ad-sidebar {
	width: 260px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 15px 5px;
}

.ad-logo-container {
	padding: 0 10px 50px 10px;
}

.ad-logo-container img {
	max-width: 190px;
	height: auto;
}

.ad-nav-menu {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.ad-nav-item {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 12px 15px;
	text-decoration: none;
	color: #ffffff;
	font-weight: 500;
	font-size: 13px;
	border-radius: 10px;
	transition: all 0.2s ease;
}

.ad-nav-item.active {
	background-color: var(--accent-green);
	color: #1a1a1a;
}

.ad-nav-item.active .ad-nav-icon {
	filter: brightness(0) saturate(100%);
}

.ad-nav-icon {
	width: 18px;
	height: 18px;
}

.ad-logout-btn {
	display: flex;
	align-items: center;
	gap: 12px;
	text-decoration: none;
	color: #ffffff;
	font-weight: 500;
	font-size: 13px;
	padding: 12px 15px;
	border-radius: 10px;
}

/* --- Main Content --- */
.ad-main-content {
	flex: 1;
	background-color: #ffffff;
	color: #1a1a1a;
	border-radius: 16px;
	padding: 20px 30px;
	display: flex;
	flex-direction: column;
	overflow-y: auto;
}

.ad-top-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.ad-header-title {
	font-size: 16px;
	font-weight: 700;
	margin: 0;
}

/* Header adjustments */
.ad-top-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.ad-header-title {
	font-size: 16px;
	font-weight: 700;
	margin: 0;
}

.ad-profile-section {
	display: flex;
	align-items: center;
	gap: 10px;
}

.ad-profile-info {
	text-align: right;
}

.ad-profile-name {
	font-weight: 700;
	font-size: 13px;
	margin: 0;
}

.ad-profile-email {
	font-size: 11px;
	color: #666666;
	margin: 0;
}

.ad-profile-pic-label {
	width: 35px;
	height: 35px;
	background-color: #e0e0e0;
	border-radius: 50%;
	cursor: pointer;
}

.ad-section-title {
	font-size: 32px;
	font-weight: 800;
	margin: 0;
	letter-spacing: -0.8px;
}

.ad-text-orange {
	color: var(--accent-orange);
}

/* --- STATS CARDS --- */
.ad-stats-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 15px;
	margin: 25px 0;
}

.ad-stat-card {
	background: #ffffff;
	border: 1.5px solid #dedddd;
	border-radius: 40px;
	padding: 25px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.ad-stat-icon {
	width: 32px;
	height: 32px;
	margin-bottom: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f9f9f9;
	border-radius: 10px;
}

.ad-stat-icon img {
	width: 20px;
	height: 20px;
	object-fit: contain;
	opacity: 0.9;
}

.ad-stat-label {
	font-size: 11px;
	font-weight: 800;
	color: #aaaaaa;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	margin-bottom: 4px;
}

.ad-stat-value {
	font-size: 48px;
	font-weight: 800;
	margin: 0;
	color: #1a1a1a;
	line-height: 1;
}

.ad-chart-container {
	border: 1.5px solid #f2f2f2;
	border-radius: 24px;
	padding: 25px;
	margin-bottom: 20px;
}

.ad-chart-title {
	font-size: 18px;
	font-weight: 800;
	margin-bottom: 20px;
}

.ad-bar-chart {
	display: flex;
	align-items: flex-end; /* Keeps everything pinned to the bottom */
	justify-content: center;
	height: 300px; /* Increased height for better visibility */
	background: #fcfcfc;
	border-radius: 12px;
	padding: 40px 20px 20px 20px;
	gap: 40px;
	border: 1px solid #eee;
}

.ad-bar-group {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-end; /* Pushes the label to the very bottom */
	width: 80px;
	height: 100%;
	gap: 8px;
}

.ad-bar {
	width: 40px;
	background: #e0e0e0;
	border-radius: 6px 6px 0 0; /* Only round the top corners */
	min-height: 4px;
	transition: height 0.6s cubic-bezier(0.4, 0, 0.2, 1);
}

.ad-bar.highlight {
	background: var(--accent-green);
}

.ad-bar-label {
	font-size: 10px;
	font-weight: 700;
	color: #999;
	text-transform: uppercase;
	text-align: center;
	line-height: 1.3;
}

/* --- NEW TABLE SECTION RECTANGLE --- */
.ad-table-section {
	border: 1.5px solid #f2f2f2;
	border-radius: 24px;
	padding: 25px;
	margin-bottom: 20px;
}

.ad-table-header-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 20px;
}

.ad-table-info h3 {
	font-size: 18px;
	margin: 0;
	font-weight: 800;
}

.ad-table-info p {
	font-size: 12px;
	color: #888;
	margin: 2px 0 0 0;
}

.ad-media-table {
	width: 100%;
	border-collapse: collapse;
}

.ad-media-table th {
	text-align: left;
	font-size: 10px;
	color: #aaa;
	padding: 10px;
	border-bottom: 1px solid #f0f0f0;
	text-transform: uppercase;
}

.ad-media-table td {
	padding: 12px 10px;
	font-size: 13px;
	font-weight: 600;
	border-bottom: 1px solid #f9f9f9;
}

/* Fixed Thumbnails */
.ad-cover-thumb {
	width: 35px;
	height: 48px;
	background: #eee;
	border-radius: 6px;
	object-fit: cover;
}

/* ── media tags ── */
@media ( max-width : 768px) {
	.ad-body {
		padding: 0;
		height: auto;
		min-height: 100vh;
		overflow: auto;
	}
	.ad-layout-container {
		flex-direction: column;
		gap: 0;
		height: auto;
		min-height: 100vh;
	}
	.ad-sidebar {
		width: 100%;
		padding: 20px 15px 15px 15px;
		gap: 15px;
	}
	.ad-sidebar>div {
		display: flex;
		flex-direction: column;
		gap: 15px;
		width: 100%;
	}
	.ad-logo-container {
		padding: 0;
		display: flex;
		justify-content: center;
		width: 100%;
	}
	.ad-logo-container img {
		max-width: 150px;
	}
	.ad-nav-menu {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		gap: 8px;
		width: 100%;
	}
	.ad-nav-item {
		justify-content: center;
		padding: 10px 5px;
		font-size: 12px;
		text-align: center;
	}
	.ad-logout-container {
		padding: 0;
		width: 100%;
	}
	.ad-logout-btn {
		justify-content: center;
		padding: 10px;
		font-size: 12px;
		background-color: rgba(231, 90, 85, 0.08);
		border: 1px solid rgba(231, 90, 85, 0.2);
	}
	.ad-main-content {
		width: 100%;
		height: auto;
		flex: 1;
		overflow: visible;
		padding: 25px 20px;
		border-radius: 24px 24px 0 0;
	}
	.ad-stats-grid {
		grid-template-columns: repeat(2, 1fr);
		gap: 12px;
		margin: 20px 0;
	}
	.ad-stat-card {
		border-radius: 24px;
		padding: 15px;
	}
	.ad-stat-value {
		font-size: 32px;
	}
	.ad-bar-chart {
		gap: 15px;
		padding: 20px 10px 10px 10px;
		overflow-x: auto;
		justify-content: flex-start;
	}
	.ad-bar-group {
		min-width: 60px;
	}
	.ad-table-section {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
		padding: 15px;
	}
	.ad-media-table {
		min-width: 600px;
	}
}
</style>
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
			</section>
		</main>
	</div>
</body>
</html>