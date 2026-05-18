<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
/* --- Global Reset (only box-sizing) --- */
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
	cursor: pointer;
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

/* --- Controls (search & sort) --- */
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

.ad-btn-matched {
	margin-top: 20px;
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 9px 20px;
	font-size: 12px;
	font-weight: 600;
	font-family: 'Manrope', sans-serif;
	outline: none;
	width: 160px;
	background: white;
	color: #1a1a1a;
	cursor: pointer;
	text-align: center;
	display: inline-block;
	transition: all 0.2s ease;
}

/* Green interactive hover state */
.ad-btn-matched:hover {
	background-color: #4ebc57;
	color: #FFFFFF;
	border-color: #4ebc57;
	/* Smoothly blends the border into the green background */
}

/* Optional active state when clicked */
.ad-btn-matched:active {
	transform: scale(0.98);
}
/* ----- Logout Modal Design ----- */
.logout-modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	justify-content: center;
	align-items: center;
	z-index: 10000;
}

.logout-modal {
	background: #ffffff;
	padding: 30px;
	border-radius: 16px;
	width: 340px;
	text-align: center;
	color: #1a1a1a;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

.logout-modal-title {
	font-size: 22px;
	font-weight: 800;
	margin: 0 0 10px 0;
}

.logout-modal-text {
	font-size: 14px;
	color: #555555;
	margin-bottom: 30px;
}

.logout-modal-actions {
	display: flex;
	gap: 12px;
}

.logout-action-btn {
	flex: 1;
	padding: 12px;
	border: none;
	border-radius: 10px;
	font-weight: 700;
	cursor: pointer;
	font-size: 14px;
	text-decoration: none;
	transition: background 0.2s;
	text-align: center;
}

.btn-no {
	background-color: #f0f0f0;
	color: #1a1a1a;
}

.btn-no:hover {
	background-color: #e5e5e5;
}

.btn-yes {
	background-color: #e75a55;
	color: #ffffff;
	display: inline-block;
}

.btn-yes:hover {
	background-color: #d64a45;
}

/* -- Media Queries -- */

/* Tablets and below (992px) */
@media ( max-width : 992px) {
	.ad-sidebar {
		width: 200px;
	}
	.ad-logo-container {
		padding-bottom: 30px;
	}
	.ad-logo-container img {
		max-width: 150px;
	}
	.ad-main-content {
		padding: 15px 20px;
	}
	.ad-section-title {
		font-size: 22px;
	}
}

/* Mobile Devices (768px) */
@media ( max-width : 768px) {
	body {
		height: auto;
		overflow: visible; /* Allow scrolling on mobile */
	}
	.ad-layout-container {
		flex-direction: column; /* Stack sidebar on top */
		height: auto;
	}
	.ad-sidebar {
		width: 100%;
		padding: 10px;
		justify-content: flex-start;
	}
	.ad-logo-container {
		padding-bottom: 15px;
		text-align: center;
	}
	.ad-nav-menu {
		flex-direction: row; /* Horizontal nav for mobile */
		flex-wrap: wrap;
		justify-content: center;
		gap: 10px;
	}
	.ad-nav-item {
		padding: 8px 12px;
		font-size: 12px;
	}
	.ad-logout-container {
		display: flex;
		justify-content: center;
		margin-top: 10px;
	}
	.ad-main-content {
		margin-top: 10px;
		border-radius: 12px;
		padding: 15px;
		overflow-x: auto; /* Allow table to scroll horizontally */
	}
	.ad-top-header {
		flex-direction: column;
		gap: 15px;
		align-items: flex-start;
	}
	.ad-profile-section {
		width: 100%;
		justify-content: space-between;
	}
	.ad-controls {
		flex-direction: column;
		align-items: stretch;
	}
	.ad-search-box {
		width: 100%;
	}

	/* Table responsivness: Allow scroll */
	.ad-table {
		display: block;
		width: 100%;
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
}

/* Extra Small Devices (480px) */
@media ( max-width : 480px) {
	.ad-section-title {
		font-size: 20px;
	}
	.ad-nav-menu {
		gap: 5px;
	}
	.ad-nav-item {
		font-size: 11px;
		padding: 6px 10px;
	}
}
</style>
</head>
<body>

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
					</a> <a href="${pageContext.request.contextPath}/Report"
						class="ad-nav-item"> <img
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
				<!--  Logout button links to the servlet -->
				<a
					href="${pageContext.request.contextPath}/Dashboard?action=logoutConfirm"
					class="ad-logout-btn"> <img
					src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg"
					class="ad-nav-icon"> Logout
				</a>
			</div>
		</aside>

		<main class="ad-main-content">

			<header class="ad-top-header">
				<h2 class="ad-header-title">View medias</h2>

				<%@ include file="/components/adminHeader.jsp"%>
			</header>

			<h1 class="ad-section-title">
				Added <span class="ad-text-orange">medias</span>
			</h1>
			<p class="ad-section-subtitle">View all the added medias here</p>

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

			<!-- Search and sort handled by the servlet (GET request). -->

			<form method="GET"
				action="${pageContext.request.contextPath}/Dashboard"
				class="ad-controls" id="filterForm">

				<select name="sort" class="ad-sort-dropdown"
					onchange="document.getElementById('filterForm').submit()">
					<option value="" ${empty sortValue ? 'selected' : ''}>Sort
						by Date</option>
					<option value="newest" ${sortValue == 'newest' ? 'selected' : ''}>Newest
						First</option>
					<option value="oldest" ${sortValue == 'oldest' ? 'selected' : ''}>Oldest
						First</option>
				</select>

				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search-ad-icon.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						name="search" class="ad-search-box"
						placeholder="Search for medias" value="${searchValue}">
				</div>

			</form>

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
									<td><c:choose>
											<c:when test="${media.avgRating > 0}">
            ★ <fmt:formatNumber value="${media.avgRating}"
													maxFractionDigits="1" />/10
        </c:when>
											<c:otherwise>
												<span style="color: #bbb; font-style: italic;">Not
													rated</span>
											</c:otherwise>
										</c:choose></td>
									<td><a
										href="${pageContext.request.contextPath}/Dashboard?action=deleteConfirm&mediaId=${media.mediaId}"
										class="ad-delete-btn"> <img
											src="${pageContext.request.contextPath}/assets/icon/trash-ad-icon.svg"
											class="ad-delete-icon">
									</a></td>
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

			<!-- Load more button -->
			<div style="text-align: center; padding: 15px;">
				<button class="ad-btn-matched" id="loadMoreBtn">Load More
					Medias</button>
			</div>

		</main>
	</div>

	<!-- Logout confirmation modal -->
	<div id="logoutModal" class="logout-modal-overlay"
		style="${showLogoutModal ? 'display:flex' : 'display:none'}">
		<div class="logout-modal">
			<h3 class="logout-modal-title">Logout</h3>
			<p class="logout-modal-text">Are you sure you want to log out?</p>
			<div class="logout-modal-actions">
				<!-- No = go back to the dashboard normally -->
				<a href="${pageContext.request.contextPath}/Dashboard"
					class="logout-action-btn btn-no">No</a>
				<!-- Yes = proceed to the Logout servlet which clears the session -->
				<a href="${pageContext.request.contextPath}/Logout"
					class="logout-action-btn btn-yes">Yes</a>
			</div>
		</div>
	</div>

	<!-- Delete confirmation modal -->
	<div id="deleteModal" class="logout-modal-overlay"
		style="${showDeleteModal ? 'display:flex' : 'display:none'}">
		<div class="logout-modal">
			<h3 class="logout-modal-title">Delete Media</h3>
			<p class="logout-modal-text">Are you sure you want to delete this
				media? This action cannot be undone.</p>
			<div class="logout-modal-actions">
				<!-- No = go back to the dashboard normally -->
				<a href="${pageContext.request.contextPath}/Dashboard"
					class="logout-action-btn btn-no">No</a>
				<!-- Yes = POST to the servlet with action=delete and the pending media ID -->
				<form method="post"
					action="${pageContext.request.contextPath}/Dashboard"
					style="flex: 1; margin: 0; padding: 0;">
					<input type="hidden" name="action" value="delete"> <input
						type="hidden" name="mediaId" value="${pendingDeleteId}">
					<button type="submit" class="logout-action-btn btn-yes"
						style="width: 100%; border: none; cursor: pointer;">Yes</button>
				</form>
			</div>
		</div>
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
	</script>

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const rows = document.querySelectorAll("#userTableBody tr");
	    const loadMoreBtn = document.getElementById("loadMoreBtn");
	    const rowsToShow = 5;
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