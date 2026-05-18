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
<title>${editMedia.title}-Edit Media</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admineditform.css">

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

	<script
		src="${pageContext.request.contextPath}/assets/javascript/admineditform.js">
		
	</script>

</body>
</html>