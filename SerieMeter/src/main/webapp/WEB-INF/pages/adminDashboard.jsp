<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<style>
/* ----- Global Reset (only box-sizing) ----- */
* {
	box-sizing: border-box;
}

body {
	font-family: 'Manrope', sans-serif;
	background-color: #010101;
	color: #ffffff;
	margin: 0;
	padding: 10px;
	height: 100vh;
	overflow: hidden;
}

/* ----- Main Layout ----- */
.ad-layout-container {
	display: flex;
	height: 100%;
	gap: 10px;
}

/* ----- Sidebar ----- */
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

.ad-nav-item.active .ad-nav-icon {
	filter: brightness(0) saturate(100%);
}

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

/* ----- Main White Container ----- */
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
	background: transparent;
	color: #1a1a1a;
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
	background: transparent;
	color: #1a1a1a;
}

.ad-profile-email {
	font-size: 11px;
	color: #666666;
	margin: 0;
	background: transparent;
}

.ad-profile-pic-label {
	width: 35px;
	height: 35px;
	background-color: #e0e0e0;
	border-radius: 50%;
	cursor: pointer;
}

.ad-section-title {
	font-size: 28px;
	font-weight: 800;
	margin: 0;
	letter-spacing: -0.5px;
	background: transparent;
	color: #1a1a1a;
}

.ad-text-orange {
	color: #e37329;
	background: transparent;
}

.ad-section-subtitle {
	font-size: 13px;
	color: #555555;
	margin: 0 0 15px 0;
	background: transparent;
}

/* ----- Controls (search & sort) ----- */
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

.ad-search-box {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 9px 32px 9px 15px;
	font-size: 12px;
	outline: none;
	width: 220px;
	background: white;
	color: #1a1a1a;
}

.ad-sort-dropdown {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 8px 20px;
	font-size: 12px;
	color: #555;
	outline: none;
	background: white;
}

.ad-table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	background: white;
}

.ad-table th, .ad-table td {
	padding: 6px 5px;
	text-align: left;
	border-bottom: 1px solid #f2f2f2;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	background: white;
	color: #555555;
	font-size: 11px;
}

.ad-table th {
	font-weight: 600;
	color: #1a1a1a;
	font-size: 12px;
	border-bottom: 1px solid #e0e0e0;
	background: white;
}

.ad-rating {
	display: flex;
	align-items: center;
	gap: 3px;
	background: white;
	font-size: 11px;
}

.ad-star-icon {
	width: 11px;
	height: 11px;
}

.ad-delete-icon {
	width: 22px;
	height: 22px;
}

.ad-pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 12px;
	padding-top: 15px;
	font-size: 12px;
	background: white;
}

.ad-page-num {
	color: #888888;
	text-decoration: none;
	background: white;
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

.ad-msg-success {
	color: green;
	font-size: 12px;
	margin-bottom: 8px;
	background: white;
	transition: opacity 0.5s ease;
}

.ad-msg-error {
	color: red;
	font-size: 12px;
	margin-bottom: 8px;
	background: white;
	transition: opacity 0.5s ease;
}

.ad-delete-form {
	margin: 0;
	padding: 0;
	display: inline;
	background: white;
}

.ad-delete-btn {
	background: none;
	border: none;
	cursor: pointer;
	padding: 0;
}
</style>
</head>
<body>

	<div class="ad-layout-container">

		<!-- Sidebar -->
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
					</a> <a href="${pageContext.request.contextPath}/Report"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/report.svg"
						class="ad-nav-icon"> Report & Analytics
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

		<!-- Main Content -->
		<main class="ad-main-content">

			<header class="ad-top-header">
				<h2 class="ad-header-title">View medias</h2>

				<!-- Only render this section if a user session exists -->
				<%@ include file="/components/adminHeader.jsp"%>
			</header>

			<h1 class="ad-section-title">
				Added <span class="ad-text-orange">medias</span>
			</h1>
			<p class="ad-section-subtitle">View all the added medias here</p>

			<!-- Success / Error Messages -->
			<c:if test="${not empty message}">
				<p class="ad-msg-success" id="successMsg">
					<c:out value="${message}" />
				</p>
			</c:if>
			<c:if test="${not empty error}">
				<p class="ad-msg-error" id="errorMsg">
					<c:out value="${error}" />
				</p>
			</c:if>

			<!-- Search & Sort Controls -->
			<div class="ad-controls">
				<select id="sortDropdown" class="ad-sort-dropdown"
					onchange="sortTable()">
					<option value="default">Sort by Date</option>
					<option value="newest">Newest First</option>
					<option value="oldest">Oldest First</option>
				</select>
				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search-ad-icon.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						id="searchInput" class="ad-search-box"
						placeholder="Search for medias" onkeyup="filterTable()">
				</div>
			</div>

			<!-- Media Table -->
			<table class="ad-table">
				<thead>
					<tr>
						<th style="width: 40px">ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Genre</th>
						<th>Added Date</th>
						<th>Average Rating</th>
						<th style="width: 60px">Action</th>
					</tr>
				</thead>
				<tbody id="userTableBody">
					<c:choose>
						<c:when test="${not empty mediaList}">
							<c:forEach var="media" items="${mediaList}">
								<tr>
									<td>#<c:out value="${media.mediaId}" /></td>
									<td><c:out value="${media.title}" /></td>
									<td>${media.categoryId == 1 ? 'Movie' : 'Series'}</td>
									<td>${media.genreId == 1 ? 'Action' :
                         media.genreId == 2 ? 'Comedy' :
                         media.genreId == 3 ? 'Horror' :
                         media.genreId == 4 ? 'Drama' :
                         media.genreId == 5 ? 'Sci-Fi' :
                         media.genreId == 6 ? 'Thriller' : 'Romance'}</td>
									<td>${fn:substring(media.releaseDate, 0, 10)}</td>
									<td>-</td>
									<td>
										<form class="ad-delete-form"
											action="${pageContext.request.contextPath}/Dashboard"
											method="post">
											<input type="hidden" name="action" value="delete"> <input
												type="hidden" name="mediaId" value="${media.mediaId}">
											<button type="submit" class="ad-delete-btn">
												<img
													src="${pageContext.request.contextPath}/assets/icon/trash-ad-icon.svg"
													class="ad-delete-icon">
											</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7"
									style="text-align: center; padding: 20px; color: #999;">
									No media found.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<!-- Pagination (static placeholder) -->
			<div class="ad-pagination">
				<a href="#" class="ad-page-num">&lt;</a> <a href="#"
					class="ad-page-num active">1</a> <a href="#" class="ad-page-num">2</a>
				<a href="#" class="ad-page-num">3</a> <a href="#"
					class="ad-page-num">&gt;</a>
			</div>

		</main>
	</div>

	<script>
	// ---------- Auto-hide messages after 5 seconds ----------
	document.addEventListener("DOMContentLoaded", function() {
		const successMsg = document.getElementById("successMsg");
		const errorMsg = document.getElementById("errorMsg");
		
		if (successMsg) {
			setTimeout(function() {
				successMsg.style.opacity = "0";
				setTimeout(function() {
					successMsg.style.display = "none";
				}, 500); // wait for fade transition
			}, 5000);
		}
		
		if (errorMsg) {
			setTimeout(function() {
				errorMsg.style.opacity = "0";
				setTimeout(function() {
					errorMsg.style.display = "none";
				}, 500);
			}, 5000);
		}
	});

	// ---------- Search / Filter ----------
	function filterTable() {
		const input = document.getElementById("searchInput");
		const filter = input.value.toLowerCase();
		const tbody = document.getElementById("userTableBody");
		const rows = tbody.getElementsByTagName("tr");

		for (let i = 0; i < rows.length; i++) {
			// Skip rows that are not actual data rows (e.g., "No media found" has only 1 cell)
			if (rows[i].cells.length < 2) continue;
			const rowText = rows[i].textContent || rows[i].innerText;
			rows[i].style.display = rowText.toLowerCase().indexOf(filter) > -1 ? "" : "none";
		}
	}

	// ---------- Sort by Release Date (client-side) ----------
	function sortTable() {
		const sortValue = document.getElementById("sortDropdown").value;
		
		// If default "Sort by Date" is selected, do nothing
		if (sortValue === "default") return;
		
		const tbody = document.getElementById("userTableBody");
		const rows = Array.from(tbody.getElementsByTagName("tr"));

		// Filter out the "no media found" row if present (has colspan)
		const dataRows = rows.filter(row => row.cells.length >= 2);

		// Sort based on the date column (index 4 = Added Date)
		dataRows.sort((rowA, rowB) => {
			const dateA = rowA.cells[4].textContent.trim();
			const dateB = rowB.cells[4].textContent.trim();
			if (sortValue === "newest") {
				return dateB.localeCompare(dateA); // newer first
			} else {
				return dateA.localeCompare(dateB); // older first
			}
		});

		// Re-append sorted rows
		for (let row of dataRows) {
			tbody.appendChild(row);
		}

		// Re-apply current search filter (so hidden rows remain hidden)
		filterTable();
	}
</script>

</body>
</html>