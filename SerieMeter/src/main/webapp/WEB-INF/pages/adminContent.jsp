<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Content Management</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

body {
	font-family: 'Manrope', sans-serif;
	background-color: #010101;
	color: #ffffff;
	margin: 0;
	padding: 10px;
	height: 100vh;
	box-sizing: border-box;
	overflow: hidden;
}

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

/* --- Main White Container --- */
.ad-main-content {
	flex: 1;
	border-radius: 16px;
	background-color: #ffffff;
	padding: 20px 30px;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.ad-top-header {
	margin-bottom: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.ad-top-header h3 {
	font-size: 16px;
	font-weight: 700;
	color: #1a1a1a;
	margin: 0;
}

/* --- Profile section --- */
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
	color: #1a1a1a;
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
	overflow: hidden;
	display: block;
}

/* --- Form Grid --- */
.adm-content-grid {
	display: flex;
	gap: 30px;
	justify-content: space-between;
	align-items: flex-start;
}

.adm-form-column {
	flex: 2;
	max-width: 650px;
}

.adm-titles {
	margin-bottom: 20px;
}

.adm-titles h1 {
	font-size: 34px;
	font-weight: 700;
	color: #0F172A;
	line-height: 1.1;
}

.adm-titles .adm-subtitle {
	font-size: 16px;
	font-weight: 400;
	color: #0F172A;
}

.adm-input-group {
	margin-bottom: 12px;
}

.adm-input-group label {
	display: block;
	font-size: 13px;
	font-weight: bold;
	color: #4b5563;
	margin-bottom: 4px;
	text-transform: uppercase;
}

.adm-form-control {
	width: 100%;
	margin-bottom: 4px;
	padding: 10px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 12px;
	outline: none;
	font-size: 14px;
}

.adm-form-control-category {
	width: 100%;
	margin-bottom: 4px;
	padding: 10px;
	font-size: 14px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 12px;
	outline: none;
	appearance: none;
	background-image: url(assets/icon/drop-down.svg);
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.adm-form-control-genre {
	width: 40%;
	padding: 10px;
	font-size: 14px;
	background-color: #f3f6f9;
	border: 1px solid transparent;
	border-radius: 12px;
	outline: none;
	appearance: none;
	background-image: url(assets/icon/drop-down.svg);
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.adm-form-control:focus, .adm-form-control-category:focus,
	.adm-form-control-genre:focus {
	border: 1px solid #4ebc57;
	background-color: #ffffff;
}

.adm-row-3-cols {
	display: flex;
	gap: 15px;
}

.adm-row-3-cols .adm-input-group {
	flex: 1;
}

.adm-synopsis-box {
	resize: none;
	min-height: 250px;
	width: 100%;
	padding: 12px;
	background-color: #f3f6f9;
	border-radius: 12px;
	border: 1px solid #e0e0e0;
	font-size: 14px;
	outline: none;
}

.adm-synopsis-box:focus {
	border: 1px solid #4ebc57;
	background-color: #ffffff;
}

.adm-media-column {
	flex: 1;
	max-width: 300px;
	display: flex;
	flex-direction: column;
}

.adm-media-header h4 {
	font-size: 16px;
	font-weight: 400;
	margin-bottom: 4px;
	color: #0F172A;
}

.adm-media-header p {
	font-size: 13px;
	font-weight: 400;
	color: #0F172A;
	line-height: 1.5;
	margin-bottom: 15px;
}

.adm-poster-upload-area {
	width: 100%;
	margin-bottom: 2px;
}

.adm-poster-preview {
	width: 100%;
	height: 380px;
	border-radius: 16px;
	background-color: #f3f6f9;
	border: 2px dashed #d1d5db;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	transition: border-color 0.2s ease, background-color 0.2s ease;
	position: relative;
	overflow: hidden;
}

.adm-poster-preview:hover {
	border-color: #4ebc57;
	background-color: #f0fdf1;
}

.adm-poster-preview img#posterImage {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 14px;
	display: none;
	position: absolute;
	top: 0;
	left: 0;
}

.adm-upload-placeholder {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
	pointer-events: none;
}

.adm-upload-placeholder span {
	font-size: 13px;
	font-weight: 600;
	color: #4ebc57;
}

.adm-upload-placeholder p {
	font-size: 11px;
	color: #9ca3af;
	margin: 0;
}

#posterFileInput {
	display: none;
}

.adm-genre-group {
	width: 100%;
	margin-top: 10px;
}

.adm-publish-button-container {
	display: flex;
	justify-content: flex-end;
	padding-top: 3px;
}

.adm-publish-btn {
	background-color: #008000;
	color: white;
	border: none;
	padding: 10px 30px;
	border-radius: 30px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.adm-publish-btn:hover {
	background-color: #008000da;
}

.ad-text-orange {
	color: #e37329;
}

/* Desktop: hide the responsive-only top row in media column */
.adm-media-top-row {
	display: none;
}

/* Media Queries  */
@media ( max-width : 768px) {
	body {
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

	/* Sidebar turns into the matched 2-column grid system */
	.ad-sidebar {
		width: 100%;
		padding: 20px 15px 15px 15px;
		gap: 15px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
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

	/* --- Main White Container (KEPT EXACTLY AS IS) --- */
	.ad-main-content {
		overflow: auto;
		padding: 16px 18px;
		border-radius: 12px;
	}

	/* Keep form and media side by side on tablet */
	.adm-content-grid {
		flex-direction: row;
		flex-wrap: wrap;
		gap: 20px;
		align-items: flex-start;
	}
	.adm-form-column {
		flex: 1 1 55%;
		max-width: none;
	}
	.adm-titles h1 {
		font-size: 26px;
	}
	.adm-titles .adm-subtitle {
		font-size: 14px;
	}

	/* Hide Director and Category from left form column on tablet */
	.adm-input-group--director {
		display: none;
	}
	.adm-input-group--category {
		display: none;
	}

	/* Media column: right side, full flex column */
	.adm-media-column {
		flex: 1 1 38%;
		max-width: none;
		display: flex;
		flex-direction: column;
		gap: 12px;
	}

	/* Show Director + Category row at top of media column */
	.adm-media-top-row {
		display: flex;
		gap: 10px;
	}
	.adm-media-top-row .adm-input-group {
		flex: 1;
		margin-bottom: 0;
	}
	.adm-media-header {
		width: 100%;
	}
	.adm-poster-preview {
		height: 260px;
	}

	/* Genre + publish button side by side */
	.adm-genre-group {
		margin-top: 0;
	}
	.adm-form-control-genre {
		width: 100%;
	}

	/* 3-col row: Release Date and Total Time stack vertically (Category hidden) */
	.adm-row-3-cols {
		flex-direction: column;
		gap: 0;
	}
	.adm-synopsis-box {
		min-height: 160px;
	}
}

/* Small mobile (~480px) */
@media ( max-width : 480px) {
	/* Stack form and media column vertically on small mobile */
	.adm-content-grid {
		flex-direction: column;
	}

	/* Restore Director and Category in left form column on small mobile */
	.adm-input-group--director {
		display: block;
	}
	.adm-input-group--category {
		display: block;
	}

	/* Hide the media-top-row on small mobile since fields are back in form */
	.adm-media-top-row {
		display: none;
	}
	.adm-titles h1 {
		font-size: 22px;
	}
	.adm-media-column {
		flex-direction: column;
		width: 100%;
	}
	.adm-poster-preview {
		height: 220px;
	}
	.adm-genre-group {
		width: 100%;
	}
	.adm-publish-button-container {
		justify-content: stretch;
	}
	.adm-publish-btn {
		width: 100%;
		text-align: center;
	}

	/* Restore 3-col row layout on small mobile */
	.adm-row-3-cols {
		flex-direction: row;
		gap: 15px;
	}
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
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> <span>Dashboard</span>
					</a> <a href="${pageContext.request.contextPath}/AdminContent"
						class="ad-nav-item active"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> <span>Content Management</span>
					</a> <a href="${pageContext.request.contextPath}/Edit"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/edit.svg"
						class="ad-nav-icon"> <span>Edit</span>
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
						class="ad-nav-icon"> <span>Users</span>
					</a>
				</nav>
			</div>

			<div class="ad-logout-container">
				<a href="${pageContext.request.contextPath}/Logout"
					class="ad-logout-btn"> <img
					src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg"
					class="ad-nav-icon"> <span>Logout</span>
				</a>
			</div>
		</aside>

		<!-- Main Content -->
		<main class="ad-main-content">
			<header class="ad-top-header">
				<h3>Add new media</h3>
				<%@ include file="/components/adminHeader.jsp"%>
			</header>

			<form action="${pageContext.request.contextPath}/AdminContent"
				method="POST" enctype="multipart/form-data" class="adm-content-grid">

				<!-- LEFT: Form Column -->
				<div class="adm-form-column">
					<div class="adm-titles">
						<h1>
							Create a <span class="ad-text-orange">cinematic<br>masterpiece
							</span>
						</h1>
						<p class="adm-subtitle">Fill in the technical details below</p>
					</div>

					<div class="adm-input-group">
						<label>Movie Title</label> <input type="text" name="title"
							class="adm-form-control" required>
					</div>

					<!-- Hidden on tablet (768px); shown in media column instead -->
					<div class="adm-input-group adm-input-group--director">
						<label>Director's Name</label> <input type="text"
							name="directorName" class="adm-form-control">
					</div>

					<div class="adm-row-3-cols">
						<div class="adm-input-group">
							<label>Release Date</label> <input type="date"
								name="release_date" class="adm-form-control" required>
						</div>

						<!-- Hidden on tablet (768px); shown in media column instead -->
						<div class="adm-input-group adm-input-group--category">
							<label>Category</label> <select name="category_id"
								class="adm-form-control-category">
								<option value="" disabled selected></option>
								<option value="1">Movie</option>
								<option value="2">Series</option>
							</select>
						</div>

						<div class="adm-input-group">
							<label>Total Time</label> <input type="text" name="total_time"
								class="adm-form-control" required>
						</div>
					</div>

					<div class="adm-input-group">
						<label>Synopsis</label>
						<textarea name="description"
							class="adm-form-control adm-synopsis-box"></textarea>
					</div>
				</div>

				<!-- RIGHT: Media Column -->
				<div class="adm-media-column">

					<!-- Tablet-only: Director + Category moved here -->
					<div class="adm-media-top-row">
						<div class="adm-input-group">
							<label>Director's Name</label> <input type="text"
								name="directorName" class="adm-form-control">
						</div>
						<div class="adm-input-group">
							<label>Category</label> <select name="category_id"
								class="adm-form-control-category">
								<option value="" disabled selected></option>
								<option value="1">Movie</option>
								<option value="2">Series</option>
							</select>
						</div>
					</div>

					<div class="adm-media-header">
						<h4>Visual identity</h4>
						<p>
							Upload high quality poster.<br>Recommended ratio 2:3
						</p>
					</div>

					<div class="adm-poster-upload-area">
						<div class="adm-poster-preview" id="posterPreview"
							onclick="document.getElementById('posterFileInput').click()">
							<div class="adm-upload-placeholder" id="uploadPlaceholder">
								<span style="color: #94A3B8;">Drop poster here</span>
								<p style="color: #94A3B8;">Browse for local files</p>
							</div>
							<img id="posterImage" src="#" alt="Poster Preview">
						</div>
						<input type="file" id="posterFileInput" name="media_profile"
							accept="image/*" required>
					</div>

					<div class="adm-input-group adm-genre-group">
						<label>Genre</label> <select name="genre_id"
							class="adm-form-control-genre" required>
							<option value=""></option>
							<option value="1">Action</option>
							<option value="2">Comedy</option>
							<option value="3">Horror</option>
							<option value="4">Drama</option>
							<option value="5">Sci-Fi</option>
							<option value="6">Thriller</option>
							<option value="7">Romance</option>
						</select>
					</div>

					<div class="adm-publish-button-container">
						<button type="submit" class="adm-publish-btn">Publish</button>
					</div>
				</div>

			</form>
		</main>
	</div>

	<script>
		document.getElementById('posterFileInput').addEventListener(
				'change',
				function(e) {
					const file = e.target.files[0];
					if (!file)
						return;

					const reader = new FileReader();
					reader.onload = function(event) {
						const img = document.getElementById('posterImage');
						const placeholder = document
								.getElementById('uploadPlaceholder');
						const preview = document
								.getElementById('posterPreview');

						img.src = event.target.result;
						img.style.display = 'block';
						placeholder.style.display = 'none';
						preview.style.border = 'none';
					};
					reader.readAsDataURL(file);
				});
	</script>
</body>
</html>
