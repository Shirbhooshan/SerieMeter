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
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminContent.css">
<script src="${pageContext.request.contextPath}/javascript/adminContent.js"></script>
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
</body>
</html>
