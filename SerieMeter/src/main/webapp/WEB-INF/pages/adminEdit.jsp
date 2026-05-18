<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Medias – SerieMeter Admin</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminedit.css">

</head>

<body class="ad-body">
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
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> Dashboard
					</a> <a href="${pageContext.request.contextPath}/AdminContent"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> Content Management
					</a> <a href="${pageContext.request.contextPath}/Edit"
						class="ad-nav-item active"> <img
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
				<a href="${pageContext.request.contextPath}/Logout"
					class="ad-logout-btn"> <img
					src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg"
					class="ad-nav-icon"> Logout
				</a>
			</div>
		</aside>

		<!-- Main White Box -->
		<main class="ad-main-content">


			<header class="ad-top-header">
				<h2 class="ad-header-title">Edit medias</h2>

				<!-- Only render this section if a user session exists -->
				<%@ include file="/components/adminHeader.jsp"%>

			</header>

			<h1 class="ad-section-title">
				Edit <span class="ad-text-orange">Medias</span>
			</h1>
			<p class="ad-section-subtitle">Update media details here</p>

			<!-- Sort & Search GET form so servlet handles the logic here -->
			<form action="${pageContext.request.contextPath}/Edit" method="get"
				class="ad-controls">
				<select class="ad-sort-dropdown" name="sort"
					onchange="this.form.submit()">
					<option value="date" ${currentSort == 'date'     ? 'selected' : ''}>Sort
						by Date</option>
					<option value="name" ${currentSort == 'name'     ? 'selected' : ''}>Sort
						by Name</option>
					<option value="category"
						${currentSort == 'category' ? 'selected' : ''}>Sort by
						Category</option>
				</select>


				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						name="query" class="ad-search-box" placeholder="Search for medias"
						value="${not empty searchQuery ? searchQuery : ''}">
				</div>
			</form>

			<!-- Media Table -->
			<table class="ad-table" id="mediaTable">
				<thead>
					<tr>
						<th style="width: 40px">ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Genre</th>
						<th>Release Date</th>
						<th style="width: 70px">Cover</th>
						<th style="width: 70px">Action</th>
					</tr>
				</thead>
				<tbody id="tableBody">

					<c:forEach var="media" items="${mediaList}">
						<tr>
							<td>${media.mediaId}</td>
							<td>${media.title}</td>
							<td>${media.categoryId == 1 ? 'Movie' : 'Series'}</td>
							<td>${media.genreId == 1 ? 'Action' :
       media.genreId == 2 ? 'Comedy' :
       media.genreId == 3 ? 'Horror' :
       media.genreId == 4 ? 'Drama' :
       media.genreId == 5 ? 'Sci-Fi' :
       media.genreId == 6 ? 'Thriller' :
       'Romance'}</td>
							<td>${fn:substring(media.releaseDate, 0, 10)}</td>
							<td><c:choose>
									<c:when test="${not empty media.mediaProfile}">
										<img class="ad-cover-thumb"
											src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
											alt="${media.title}" onerror="this.style.opacity='0.3'" />
									</c:when>
									<c:otherwise>
										<div class="ad-cover-thumb"></div>
									</c:otherwise>
								</c:choose></td>
							<td>
								<!-- Links to /Edit?id=X so servlet loads that media for the form  -->
								<a
								href="${pageContext.request.contextPath}/Edit?id=${media.mediaId}"
								class="ad-edit-btn">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Load more button -->
			<div style="text-align: center; padding: 15px;">
				<button class="ad-btn-matched" id="loadMoreBtn">Load More
					Medias</button>
			</div>

			<div class="ad-empty-state" id="emptyState" style="display: none;">
				No media entries yet. Add media from Content Management.</div>



		</main>
	</div>

	<script src="${pageContext.request.contextPath}/assets/javascript/pagination.js">
		
	</script>
	
</body>
</html>