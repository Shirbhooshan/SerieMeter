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

/* --- Sidebar --- */
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
	transition: all 0.2s ease;
}

.ad-logout-btn:hover {
	background-color: #e75a55;
	color: #1a1a1a;
}

/* --- Main Content White Box --- */
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

/* --- REFINED STATS CARDS (MATCHING IMAGE 2) --- */
.ad-stats-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 15px;
	margin: 25px 0;
}

.ad-stat-card {
	background: #ffffff;
	border: 1.5px solid #f2f2f2;
	border-radius: 40px; /* High rounding per image 2 */
	padding: 30px;
	display: flex;
	flex-direction: column;
	align-items: flex-start; /* Vertical stack */
	transition: all 0.3s ease;
}

.ad-stat-card:hover {
	border-color: #e0e0e0;
	transform: translateY(-4px);
}

.ad-stat-icon {
	width: 32px;
	height: 32px;
	margin-bottom: 15px;
}

.ad-stat-icon img {
	width: 100%;
	height: 100%;
	opacity: 0.8;
}

.ad-stat-label {
	font-size: 11px;
	font-weight: 800;
	color: #aaaaaa;
	text-transform: uppercase; /* Uppercase caption */
	letter-spacing: 0.8px;
	margin-bottom: 5px;
}

.ad-stat-value {
	font-size: 48px; /* Large value per image 2 */
	font-weight: 800;
	margin: 0;
	color: #1a1a1a;
	line-height: 1;
}

/* --- Chart Section --- */
.ad-chart-container {
	border: 1px solid #f0f0f0;
	border-radius: 24px;
	padding: 20px;
	margin-bottom: 25px;
}

.ad-chart-title {
	font-size: 14px;
	font-weight: 700;
	color: #888;
	text-transform: uppercase;
	margin-bottom: 20px;
}

.ad-bar-chart {
	display: flex;
	align-items: flex-end;
	justify-content: space-around;
	height: 120px;
	background: #fcfcfc;
	border-radius: 12px;
	padding: 20px 10px 10px 10px;
	gap: 10px;
}

.ad-bar-group {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 1;
	gap: 8px;
}

.ad-bar {
	width: 100%;
	background: #e0e0e0;
	border-radius: 8px;
	max-width: 40px;
}

.ad-bar.highlight {
	background: var(--accent-green);
}

.ad-bar-label {
	font-size: 9px;
	font-weight: 700;
	color: #bbbbbb;
	text-transform: uppercase;
}

/* --- Medias Table --- */
.ad-table-header-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 15px;
}

.ad-table-info h3 {
	font-size: 18px;
	margin: 0;
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
						class="ad-nav-item active"> <img
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
					<h2 class="ad-stat-value">4</h2>
				</div>

				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img src="${pageContext.request.contextPath}/assets/icon/review-report.svg">
					</div>
					<span class="ad-stat-label">Total Reviews</span>
					<h2 class="ad-stat-value">16</h2>
				</div>

				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img
							src="${pageContext.request.contextPath}/assets/icon/media-report.svg">
					</div>
					<span class="ad-stat-label">Total Medias</span>
					<h2 class="ad-stat-value">20</h2>
				</div>

				<div class="ad-stat-card">
					<div class="ad-stat-icon">
						<img src="${pageContext.request.contextPath}/assets/icon/star-report.svg">
					</div>
					<span class="ad-stat-label">Average Ratings</span>
					<h2 class="ad-stat-value">6.8</h2>
				</div>
			</div>

			<div class="ad-chart-container">
				<div class="ad-chart-title">Ratings Over Genres</div>
				<div class="ad-bar-chart">
					<div class="ad-bar-group">
						<div class="ad-bar" style="height: 60%;"></div>
						<div class="ad-bar-label">Action</div>
					</div>
					<div class="ad-bar-group">
						<div class="ad-bar highlight" style="height: 90%;"></div>
						<div class="ad-bar-label">Horror</div>
					</div>
					<div class="ad-bar-group">
						<div class="ad-bar" style="height: 40%;"></div>
						<div class="ad-bar-label">Sci-Fi</div>
					</div>
					<div class="ad-bar-group">
						<div class="ad-bar" style="height: 75%;"></div>
						<div class="ad-bar-label">Drama</div>
					</div>
					<div class="ad-bar-group">
						<div class="ad-bar" style="height: 55%;"></div>
						<div class="ad-bar-label">Comedy</div>
					</div>
					<div class="ad-bar-group">
						<div class="ad-bar" style="height: 30%;"></div>
						<div class="ad-bar-label">Thriller</div>
					</div>
				</div>
			</div>

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
						<th>NAME</th>
						<th>CATEGORY</th>
						<th>GENRE</th>
						<th>TOTAL BOOKMARK</th>
						<th>TOTAL REVIEW</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>#1</td>
						<td style="display: flex; align-items: center; gap: 10px;">
							<div class="ad-media-thumb"></div> Interstellar
						</td>
						<td>Movie</td>
						<td>Sci-Fi</td>
						<td>52</td>
						<td>120</td>
					</tr>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>