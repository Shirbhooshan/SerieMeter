<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

/* Turns the icon black when the navigation item is active */
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

/* Position the search icon on the right */
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
	padding: 9px 32px 9px 15px; /* Padding Right: 32px (Room for icon!) */
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
	table-layout: fixed; /* Ensures consistency */
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
					<a href="#" class="ad-nav-item active"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> Dashboard
					</a> <a href="#" class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> Content Management
					</a> <a href="#" class="ad-nav-item"> <img
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
				<h2 class="ad-header-title">View medias</h2>
				<div class="ad-profile-section">
					<div class="ad-profile-info">
						<p class="ad-profile-name">Adams</p>
						<p class="ad-profile-email">adams234@gmail.com</p>
					</div>
					<label for="pfp" class="ad-profile-pic-label"> <input
						type="file" id="pfp" style="display: none">
					</label>
				</div>
			</header>

			<h1 class="ad-section-title">
				Added <span class="ad-text-orange">medias</span>
			</h1>
			<p class="ad-section-subtitle">View all the added medias here</p>

			<div class="ad-controls">
				<select class="ad-sort-dropdown">
					<option>Sort by Date</option>
				</select>

				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search-ad-icon.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						class="ad-search-box" placeholder="Search for medias">
				</div>
			</div>

			<table class="ad-table">
				<thead>
					<tr>
						<th style="width: 40px">ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Genre</th>
						<th>Added Date</th>
						<th>Total Review</th>
						<th style="width: 60px">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 1; i <= 8; i++) {
					%>
					<tr>
						<td>#<%=i%></td>
						<td>Beauty and the Beast</td>
						<td>Movie</td>
						<td>Romance</td>
						<td>2026-4-15</td>
						<td><div class="ad-rating">
								8.5 <img
									src="${pageContext.request.contextPath}/assets/icon/star-ad-icon.svg"
									class="ad-star-icon">
							</div></td>
						<td><button
								style="background: none; border: none; cursor: pointer">
								<img
									src="${pageContext.request.contextPath}/assets/icon/trash-ad-icon.svg"
									class="ad-delete-icon">
							</button></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div class="ad-pagination">
				<a href="#" class="ad-page-num">&lt;</a> <a href="#"
					class="ad-page-num active">1</a> <a href="#" class="ad-page-num">2</a>
				<a href="#" class="ad-page-num">3</a> <a href="#"
					class="ad-page-num">&gt;</a>
			</div>
		</main>
	</div>
	======= pageEncoding="UTF-8" isELIgnored="false"%>

	<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Portal - Add Media</title>
</head>
<style>
/* Base Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

html, body {
	height: 100%; /* Set a fixed height to prevent scrolling */
	width: 100%; /* Set a fixed width to prevent horizontal scrolling */
	overflow: hidden; /* Disables browser-level scrolling */
	background-color: #000000;
}
/* Layout Wrapper */
.dashboard-wrapper {
	display: flex;
	height: 100vh; /* Exactly 100% of the screen height */
	width: 100vw;
	background-color: #000000;
}
/* Sidebar */
.sidebar {
	width: 250px;
	height: 100%; /* Fills the 100vh of the wrapper */
	flex-shrink: 0; /*It prevents the sidebar from shrinking */
	display: flex;
	flex-direction: column;
	padding: 25px 20px;
	background-color: #000000;
	border-right: 1px solid #222; /* Subtle separation */
}

.brand {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 40px;
}

.admin-profile-icon {
	font-size: 18px;
	color: #4b5563;
	background-color: #ffffff;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-left: 5px;
}

.brand h2 {
	font-size: 20px;
	font-weight: bold;
	color: white;
}

.navigation {
	flex-grow: 1;
	/*It allows the navigation to take up the remaining space */
}

.nav-item {
	display: block;
	text-decoration: none;
	color: #356D38;
	padding: 12px 20px;
	border-radius: 30px;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	margin-top: 60px;
}

.nav-item.active {
	background-color: #8DE586;
}

.user-profile {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 10px;
	background-color: #F09C6B;
	padding: 10px;
	border-radius: 30px;
}

.username {
	font-size: 15px;
	font-weight: bold;
	color: white;
}

/* Main Content */
.main-content {
	flex-grow: 1;
	height: 100vh;
	background-color: #ffffff;
	padding: 30px 50px;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.page-header {
	margin-bottom: 20px;
}

.page-header h3 {
	font-size: 24px;
	font-weight: bold;
}

.content-grid {
	display: flex;
	gap: 120px;
}
/* Form column left side */
.form-column {
	flex: 2; /*It takes up 2 parts of the available space */
	max-width: 600px;
}

.titles {
	margin-bottom: 50px;
}

.titles h1 {
	font-size: 48px;
	font-weight: bold;
	color: #111827;
	margin-bottom: 5px;
}

.titles .subtitle {
	font-size: 20px;
	font-weight: 400;
	color: #6b7280;
}

.input-group {
	margin-bottom: 5px;
}

.input-group label {
	display: block;
	font-size: 16px;
	font-weight: bold;
	color: #4b5563;
	margin-bottom: 10px;
	letter-spacing: 0.5px;
}

.form-control {
	width: 100%;
	margin-bottom: 10px;
	padding: 14px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 8px;
	outline: none; /*It removes the default focus outline */
}

.form-control-category {
	width: 100%;
	margin-bottom: 10px;
	padding: 14px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 8px;
	outline: none; /*It removes the default focus outline */
	appearance: none; /*It removes the default dropdown arrow */
	background-image: url(assets/icon/drop-down.svg);
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.form-control-genre {
	width: 40%;
	padding: 14px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 8px;
	outline: none; /*It removes the default focus outline */
	appearance: none; /*It removes the default dropdown arrow */
	background-image: url(assets/icon/drop-down.svg);
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.form-control:focus {
	border: 1px solid #00a3ff;
}

.form-control-genre:focus {
	border: 1px solid #00a3ff;
}

.row-3-cols {
	display: flex;
	gap: 15px;
}

.row-3-cols .input-group {
	flex: 1; /*It takes up 1 part of the available space */
}

.synopsis-box {
	resize: none;
	min-height: 70px; /* Reduced from 250px to fit on laptop screens */
	width: 100%;
	padding: 12px;
	background-color: #f3f6f9;
	border-radius: 12px;
	border: 1px solid #e0e0e0;
}

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 15px;
}

.publish-btn {
	background-color: #008000;
	color: white;
	border: none;
	padding: 14px 60px;
	border-radius: 30px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.publish-btn:hover {
	background-color: #008000da;
}
/* Media column right side */
.media-column {
	flex: 1;
	max-width: 300px;
}

.media-header h4 {
	font-size: 20px;
	font-weight: 400;
	margin-bottom: 4px;
}

.media-header p {
	font-size: 16px;
	font-weight: 400;
	color: #6b7280;
	line-height: 1.5;
	margin-bottom: 15px;
}

.poster-upload-area img {
	width: 100%;
	height: 380px;
	/* Reduced from 450px to ensure it fits without scrolling */
	object-fit: cover;
	border-radius: 16px;
}

.genre-group {
	width: 100%;
	margin-top: 10px;
}
</style>
<body>



	<!-- Dashboard -->
	<div class="dashboard-wrapper">

		<aside class="sidebar">
			<div class="brand">
				<img class="admin-profile-icon" src="assets/icon/admin-logo.svg"
					alt="Logo">
				<h2>Admin Portal</h2>
			</div>

			<nav class="navigation">
				<a href="#" class="nav-item active">Content<br>Management
				</a>
			</nav>

			<div class="user-profile">
				<img class="admin-profile-icon" src="assets/icon/admin-logo.svg"
					alt="Logo"> <span class="username">@Adminuser</span>
			</div>
		</aside>

		<!-- Main Content -->
		<main class="main-content">

			<header class="page-header">
				<h3>Add new media</h3>
			</header>

			<div class="content-grid">

				<div class="form-column">
					<div class="titles">
						<h1>Create a cinematic masterpiece</h1>
						<p class="subtitle">Fill in the technical details below</p>
					</div>

					<form action="index.jsp" method="POST">
						<div class="input-group">
							<label>MOVIE TITLE</label> <input type="text" name="movieTitle"
								class="form-control" required>
						</div>

						<div class="input-group">
							<label>DIRECTOR'S NAME</label> <input type="text"
								name="directorName" class="form-control" required>
						</div>

						<div class="row-3-cols">
							<div class="input-group">
								<label>RELEASE DATE</label> <input type="date"
									name="releaseDate" class="form-control" required>
							</div>
							<div class="input-group">
								<label>CATEGORY</label> <select name="category"
									class="form-control-category" required>
									<option value=""></option>
									<option value="movie">Movies</option>
									<option value="series">Series</option>
								</select>
							</div>
							<div class="input-group">
								<label>TOTAL TIME</label> <input type="text" name="totalTime"
									class="form-control" required>
							</div>
						</div>

						<div class="input-group">
							<label>SYNOPSIS</label>
							<textarea name="synopsis" class="form-control synopsis-box"></textarea>
						</div>

						<div class="button-container">
							<button type="submit" class="publish-btn">Publish</button>
						</div>
					</form>
				</div>

				<div class="media-column">
					<div class="media-header">
						<h4>Visual identity</h4>
						<p>
							Upload high quality poster.<br>Recommended ratio 2:3
						</p>
					</div>

					<div class="poster-upload-area">
						<img src="assets/images/intersteller.jpg" alt="Upload Icon">
					</div>

					<div class="input-group genre-group">
						<label>GENRE</label> <select name="genre"
							class="form-control-genre" required>
							<option value=""></option>
							<option value="action">Action</option>
							<option value="thriller">Thriller</option>
						</select>
					</div>
				</div>

			</div>
		</main>
	</div>



	>>>>>>> refs/remotes/origin/safiyah
</body>
</html>