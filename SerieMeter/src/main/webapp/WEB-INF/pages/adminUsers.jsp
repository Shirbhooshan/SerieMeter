<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users - Seriemeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

<style>
/* --- Global Styles --- */
.ad-body {
	font-family: 'Manrope', sans-serif;
	background-color: #010101;
	color: #ffffff;
	margin: 0;
	padding: 10px;
	height: 100vh;
	box-sizing: border-box;
	overflow: hidden; /* Prevent body scroll */
}

* {
	box-sizing: border-box;
}

/* --- Main Layout --- */
.ad-layout-container {
	display: flex;
	height: 100%;
	gap: 10px;
}

/* --- Sidebar Styles --- */
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
	background-color: #4ebc57;
	color: #1a1a1a;
	opacity: 0.82;
}

.ad-nav-item:not(.active):hover {
	background-color: rgba(255, 255, 255, 0.1);
}

.ad-nav-icon {
	width: 18px;
	height: 18px;
	transition: filter 0.2s ease;
}

/* turns the icon black when the navigation item is active */
.ad-nav-item.active .ad-nav-icon {
	filter: brightness(0) saturate(100%);
}

/* Logout Button with hover design */
.ad-logout-container {
	padding: 0 5px;
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
	opacity: 0.82;
	transform: translateY(-2px);
}

.ad-logout-btn:hover .ad-nav-icon {
	filter: brightness(0) saturate(100%);
}

/* --- Main White Box  --- */
.ad-main-content {
	flex: 1;
	background-color: #ffffff;
	color: #1a1a1a;
	border-radius: 16px;
	padding: 20px 30px;
	display: flex;
	flex-direction: column;
	overflow: hidden; /* No scrolling in the box */
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

/* Content Area Titles */
.ad-section-title {
	font-size: 28px;
	font-weight: 800;
	margin: 0;
	letter-spacing: -0.5px;
}

.ad-text-orange {
	color: #e37329;
}

.ad-section-subtitle {
	font-size: 13px;
	color: #555555;
	margin: 0 0 15px 0;
}

/* Search & Sort */
.ad-controls {
	display: flex;
	justify-content: flex-end;
	gap: 8px;
	margin-bottom: 10px;
}

.ad-search-wrapper {
	position: relative;
	display: flex;
	align-items: center;
}

.ad-search-icon {
	position: absolute;
	right: 15px;
	width: 14px;
	height: 14px;
	opacity: 0.6;
	pointer-events: none;
}

/* padding in the search box */
.ad-search-box {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 9px 32px 9px 15px;
	font-size: 12px;
	outline: none;
	width: 220px;
}

.ad-sort-dropdown {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 8px 20px;
	font-size: 12px;
	color: #555;
	outline: none;
}

/* Table Density (Maximized for 8 rows) */
.ad-table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed; /* for consistency */
}

.ad-table th, .ad-table td {
	padding: 8px 5px; /* Extremely tight padding */
	text-align: left;
	border-bottom: 1px solid #f2f2f2;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.ad-table th {
	font-weight: 600;
	color: #1a1a1a;
	font-size: 12px;
	border-bottom: 1px solid #e0e0e0;
}

.ad-table td {
	font-size: 12px;
	color: #555555;
}

.ad-rating {
	display: flex;
	align-items: center;
	gap: 3px;
}

.ad-star-icon {
	width: 12px;
	height: 12px;
}

.ad-delete-icon {
	width: 16px;
	height: 16px;
}

/* Pagination (Fixed to bottom) */
.ad-pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 12px;
	padding-top: 15px;
	font-size: 12px;
}

.ad-page-num {
	color: #888888;
	text-decoration: none;
}

.ad-page-num.active {
	color: #1a1a1a;
	background-color: #f0f0f0;
	width: 24px;
	height: 24px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	font-weight: 700;
}

.sm_admin__toolbar {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	gap: 12px;
	margin-bottom: 24px;
}

.sm_admin__sort_select {
	appearance: none;
	-webkit-appearance: none;
	background: var(--white);
	border: 1px solid var(--gray-200);
	border-radius: 20px;
	padding: 9px 36px 9px 16px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	color: var(--text);
	cursor: pointer;
	background-repeat: no-repeat;
	background-position: right 14px center;
}

.sm_admin__sort_select:focus {
	outline: none;
}

.sm_admin__search {
	display: flex;
	align-items: center;
	border: 1px solid #dcdcdc;
	border-radius: 20px;
	padding: 9px 16px;
	gap: 8px;
	width: 260px;
	background: #ffffff;
}

.sm_admin__search input {
	background: transparent;
	border: none;
	outline: none;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	color: #1a1a1a;
	width: 100%;
}

.sm_admin__search input::placeholder {
	color: #aaaaaa;
}

.sm_admin__search img {
	width: 16px;
	height: 16px;
	opacity: 0.5;
}

/* --- Users Table Styling --- */
.ad-user-table-container {
	flex: 1;
	overflow-y: auto; /* Allows table scrolling if many users are added */
}

.ad-user-table {
	width: 100%;
	border-collapse: collapse;
}

.ad-user-table th {
	text-align: left;
	font-size: 11px;
	font-weight: 700;
	color: black;
	padding: 12px 10px;
	border-bottom: 1px solid #f0f0f0;
	letter-spacing: 0.5px;
	padding: 12px 10px;
}

.ad-user-table td {
	padding: 15px 10px;
	font-size: 13px;
	color: #1a1a1a;
	border-bottom: 1px solid #f9f9f9;
	vertical-align: middle;
}

/* User Details Cell (#1 + Avatar) */
.ad-user-id-cell {
	display: flex;
	align-items: center;
	gap: 15px;
}

.ad-user-avatar-small {
	width: 32px;
	height: 32px;
	background-color: #e0e0e0;
	border-radius: 50%;
	object-fit: cover;
	flex-shrink: 0;
}

/* Name/Username Stack */
.ad-user-name-info {
	display: flex;
	flex-direction: column;
}

.ad-username-bold {
	font-weight: 700;
	font-size: 13px;
}

.ad-username-gray {
	font-size: 11px;
	color: #aaaaaa;
}

/* Role Badge Style */
.ad-user-role-text {
	font-size: 12px;
	color: #555555;
}

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
	.sm_admin__toolbar {
		justify-content: center;
		width: 100%;
	}
	.sm_admin__search {
		width: 100%;
	}
	.ad-user-table-container {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
	.ad-user-table {
		min-width: 650px;
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
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/report.svg"
						class="ad-nav-icon"> Report & Analytics
					</a> <a href="${pageContext.request.contextPath}/Feedback"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/feedback.svg"
						class="ad-nav-icon"> Feedbacks
					</a> <a href="${pageContext.request.contextPath}/Users"
						class="ad-nav-item active"> <img
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
				<h2 class="ad-header-title">View Users</h2>

				<!-- Only render this section if a user session exists -->
				<%@ include file="/components/adminHeader.jsp"%>

			</header>

			<h1 class="ad-section-title">
				<span class="ad-text-orange">Connected</span> users
			</h1>
			<p class="ad-section-subtitle">View and search for all users
				here.</p>

			<!-- Toolbar: Pushes search to the right -->
			<div class="sm_admin__toolbar">
				<div class="sm_admin__search">
					<input type="text" placeholder="Search for users" id="searchInput"
						onkeyup="filterTable()" /> <img src="assets/icon/search.svg"
						alt="Search" />
				</div>
			</div>

			<!-- Users Table -->
			<div class="ad-user-table-container">
				<table class="ad-user-table">
					<thead>
						<tr>
							<th>USER DETAILS</th>
							<th>NAME</th>
							<th>EMAIL ADDRESS</th>
							<th>TOTAL REVIEW</th>
							<th>ROLE</th>
						</tr>
					</thead>
					<tbody id="userTableBody">
						<c:choose>
							<c:when test="${empty users}">
								<tr>
									<td colspan="5"
										style="text-align: center; padding: 30px; color: #aaa;">
										No users found.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="u" items="${users}" varStatus="status">
									<tr>
										<td>
											<div class="ad-user-id-cell">
												<img
													src="${pageContext.request.contextPath}/getimage?name=${u.userName}&type=user"
													alt="avatar" class="ad-user-avatar-small"
													onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile.jpg'">
												<span>#${u.userId}</span>
											</div>
										</td>
										<td>
											<div class="ad-user-name-info">
												<span class="ad-username-bold">${u.fullName}</span> <span
													class="ad-username-gray">@${u.userName}</span>
											</div>
										</td>
										<td>${u.email}</td>
										<td>${reviewCounts[status.index]}</td>
										<td class="ad-user-role-text">${u.role}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</main>
	</div>

	<script>
		function filterTable() {
			// Get the search input value and convert to lowercase
			const input = document.getElementById("searchInput");
			const filter = input.value.toLowerCase();

			// Get the table body and all rows within it
			const tbody = document.getElementById("userTableBody");
			const rows = tbody.getElementsByTagName("tr");

			// Loop through all table rows
			for (let i = 0; i < rows.length; i++) {
				// We skip the "No users found" row if it exists
				if (rows[i].cells.length < 2)
					continue;

				// Get the text content of the entire row
				const rowText = rows[i].textContent || rows[i].innerText;

				// If the text matches the filter, show it; otherwise, hide it
				if (rowText.toLowerCase().indexOf(filter) > -1) {
					rows[i].style.display = "";
				} else {
					rows[i].style.display = "none";
				}
			}
		}
	</script>
</body>
</html>