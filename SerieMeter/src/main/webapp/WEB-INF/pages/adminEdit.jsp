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

<style>
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

.ad-layout-container {
	display: flex;
	height: 100%;
	gap: 10px;
}

/* Sidebar */
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

/* Main White Box */
.ad-main-content {
	flex: 1;
	background-color: #ffffff;
	color: #1a1a1a;
	border-radius: 16px;
	padding: 20px 30px;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

/* Top header */
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

.ad-profile-pic {
	width: 35px;
	height: 35px;
	background-color: #e0e0e0;
	border-radius: 50%;
	overflow: hidden;
	object-fit: cover;
}

/* Heading */
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

/* Controls */
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
	font-family: 'Manrope', sans-serif;
}

.ad-sort-dropdown {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 8px 20px;
	font-size: 12px;
	color: #555;
	outline: none;
	font-family: 'Manrope', sans-serif;
}

/* Table */
.ad-table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.ad-table th, .ad-table td {
	padding: 10px 8px;
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

/* Poster thumbnail */
.ad-cover-thumb {
	width: 40px;
	height: 56px;
	border-radius: 6px;
	background-color: #e8e8e8;
	object-fit: cover;
	display: block;
}

/* Edit button */
.ad-edit-btn {
	background-color: #4ebc57;
	color: #ffffff;
	border: none;
	border-radius: 6px;
	padding: 6px 14px;
	font-size: 11px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background 0.2s;
}

.ad-edit-btn:hover {
	background-color: #3aa844;
}

/* Empty state */
.ad-empty-state {
	text-align: center;
	padding: 40px 20px;
	color: #aaaaaa;
	font-size: 13px;
}

/* Pagination  */
.ad-pagination {
	margin-top: auto;
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
	cursor: pointer;
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
</style>
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

			<!-- Sort + Search -->
			<div class="ad-controls">
				<select class="ad-sort-dropdown">
					<option>Sort by Date</option>
					<option>Sort by Name</option>
					<option>Sort by Category</option>
				</select>
				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						id="searchInput" class="ad-search-box"
						placeholder="Search for medias" onkeyup="filterTable()">
				</div>
			</div>

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

			<div class="ad-empty-state" id="emptyState" style="display: none;">
				No media entries yet. Add media from Content Management.</div>

			<div class="ad-pagination" id="paginationControls"></div>

		</main>
	</div>

	<script>
		const rowsPerPage = 5;
		let currentPage = 1;

		window.onload = function() {
			updateDisplay();
		};

		function updateDisplay() {
			const rows = Array.from(document.querySelectorAll('#tableBody tr'));
			const totalPages = Math.ceil(rows.length / rowsPerPage);

			rows.forEach((row, i) => {
				const isVisible = i >= (currentPage - 1) * rowsPerPage && i < currentPage * rowsPerPage;
				row.style.display = isVisible ? '' : 'none';
			});

			const container = document.getElementById('paginationControls');
			if (totalPages <= 1) { container.innerHTML = ''; return; }

			let buttons = '<button onclick="changePage(' + (currentPage - 1) + ')" ' + (currentPage === 1 ? 'disabled' : '') + '>&lt;</button>';
			for (let i = 1; i <= totalPages; i++) {
				buttons += '<button class="' + (i === currentPage ? 'active' : '') + '" onclick="changePage(' + i + ')">' + i + '</button>';
			}
			buttons += '<button onclick="changePage(' + (currentPage + 1) + ')" ' + (currentPage === totalPages ? 'disabled' : '') + '>&gt;</button>';
			container.innerHTML = buttons;
		}

		function changePage(page) {
			currentPage = page;
			updateDisplay();
		}

		function filterTable() {
			const input = document.getElementById("searchInput");
			const filter = input.value.toLowerCase();
			const tbody = document.getElementById("tableBody");
			const rows = tbody.getElementsByTagName("tr");

			for (let i = 0; i < rows.length; i++) {
				if (rows[i].cells.length < 2) continue;
				const rowText = rows[i].textContent || rows[i].innerText;
				rows[i].style.display = rowText.toLowerCase().indexOf(filter) > -1 ? "" : "none";
			}
			currentPage = 1;
			updateDisplay();
		}
	</script>

</body>
</html>