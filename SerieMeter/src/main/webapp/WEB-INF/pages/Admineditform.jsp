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
<title>${editMedia.title}- Edit Media</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
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
	overflow: auto;
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
	overflow: auto;
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
	display: block;
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

.adm-error-msg {
	color: red;
	font-size: 12px;
	margin-bottom: 8px;
}

@media ( max-width : 1024px) {
	.adm-form-column {
		max-width: 55%;
	}
	.adm-media-column {
		max-width: 40%;
	}
}

@media ( max-width : 768px) {
	.ad-sidebar {
		display: none;
	}
	.ad-layout-container {
		gap: 6px;
		padding: 6px;
	}
	.ad-main-content {
		padding: 16px 14px;
		border-radius: 10px;
		overflow-y: auto;
	}
	.adm-content-grid {
		flex-direction: column;
		overflow-y: visible;
	}
	.adm-form-column {
		max-width: 100%;
	}
	.adm-media-column {
		max-width: 100%;
		width: 100%;
	}
	.adm-form-control-genre {
		width: 60%;
	}
	.adm-publish-button-container {
		justify-content: flex-start;
	}
}

@media ( max-width : 480px) {
	.adm-titles h1 {
		font-size: 26px;
	}
	.adm-row-3-cols {
		flex-direction: column;
	}
	.adm-form-control-genre {
		width: 100%;
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

		<!-- Main Content -->
		<main class="ad-main-content">

			<header class="ad-top-header">
				<h3>Edit media</h3>
				<%@ include file="/components/adminHeader.jsp"%>
			</header>

			<c:if test="${not empty error}">
				<div class="adm-error-msg">${error}</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/Edit" method="POST"
				enctype="multipart/form-data" class="adm-content-grid">

				<div class="adm-form-column">
					<div class="adm-titles">
						<h1>
							Update media<br>details
						</h1>
						<p class="adm-subtitle">Make your changes below</p>
					</div>

					<input type="hidden" name="mediaId" value="${editMedia.mediaId}" />
					<input type="hidden" name="existingPoster"
						value="${editMedia.mediaProfile}" />

					<div class="adm-input-group">
						<label>Movie Title</label> <input type="text" name="movieTitle"
							class="adm-form-control" value="${editMedia.title}" required>
					</div>

					<div class="adm-input-group">
						<label>Director's Name</label> <input type="text"
							name="directorName" class="adm-form-control"
							value="${editMedia.director}" required>
					</div>

					<div class="adm-row-3-cols">
						<div class="adm-input-group">
							<label>Release Date</label> <input type="date" name="releaseDate"
								class="adm-form-control"
								value="${fn:substring(editMedia.releaseDate, 0, 10)}" required>
						</div>
						<div class="adm-input-group">
							<label>Total Time</label> <input type="text" name="totalTime"
								class="adm-form-control" value="${editMedia.totalTime}">
						</div>
						<div class="adm-input-group">
							<label>Category</label> <select name="category"
								class="adm-form-control-category" required>
								<option value=""></option>
								<option value="1" ${editMedia.categoryId == 1 ? 'selected' : ''}>Movie</option>
								<option value="2" ${editMedia.categoryId == 2 ? 'selected' : ''}>Series</option>
							</select>
						</div>
					</div>

					<div class="adm-input-group">
						<label>Synopsis</label>
						<textarea name="synopsis"
							class="adm-form-control adm-synopsis-box">${editMedia.description}</textarea>
					</div>
				</div>

				<div class="adm-media-column">
					<div class="adm-media-header">
						<h4>Visual identity</h4>
						<p>
							Current poster shown below.<br>Upload a new one to replace
							it.<br>Recommended ratio 2:3
						</p>
					</div>

					<label class="adm-file-input-label">Media Poster</label>
					<div class="adm-poster-upload-area">
						<div class="adm-poster-preview" id="posterPreview"
							onclick="document.getElementById('posterFileInput').click()">

							<div class="adm-upload-placeholder" id="uploadPlaceholder"
								style="${not empty editMedia.mediaProfile ? 'display: none;' : ''}">
								<span style="color: #94A3B8;">Drop poster here</span>
								<p style="color: #94A3B8;">Browse for local files</p>
							</div>

							<img id="posterImage"
								src="${pageContext.request.contextPath}/getimage?name=${editMedia.mediaProfile}&type=media"
								alt="Poster Preview"
								style="${not empty editMedia.mediaProfile ? 'display: block;' : 'display: none;'}"
								onerror="this.style.display='none'; document.getElementById('uploadPlaceholder').style.display='flex';">
						</div>

						<input type="file" id="posterFileInput" name="posterImage"
							accept="image/*" onchange="previewImage(this)"
							style="display: none;">
					</div>

					<div class="adm-input-group adm-genre-group">
						<label>Genre</label> <select name="genre"
							class="adm-form-control-genre" required>
							<option value=""></option>
							<option value="1" ${editMedia.genreId == 1 ? 'selected' : ''}>Action</option>
							<option value="2" ${editMedia.genreId == 2 ? 'selected' : ''}>Comedy</option>
							<option value="3" ${editMedia.genreId == 3 ? 'selected' : ''}>Horror</option>
							<option value="4" ${editMedia.genreId == 4 ? 'selected' : ''}>Sci-Fi</option>
							<option value="5" ${editMedia.genreId == 5 ? 'selected' : ''}>Drama</option>
							<option value="6" ${editMedia.genreId == 6 ? 'selected' : ''}>Thriller</option>
							<option value="7" ${editMedia.genreId == 7 ? 'selected' : ''}>Romance</option>
						</select>
					</div>

					<div class="adm-publish-button-container">
						<button type="submit" class="adm-publish-btn">Apply</button>
					</div>
				</div>

			</form>
		</main>
	</div>

	<script>
		function previewImage(input) {
			const preview = document.getElementById('posterImage');
			const placeholder = document.getElementById('uploadPlaceholder');

			if (input.files && input.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					preview.src = e.target.result;
					preview.style.display = 'block';
					placeholder.style.display = 'none';
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>