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
	
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminDashboard.css">

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
	    const rowsToShow = 10;
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