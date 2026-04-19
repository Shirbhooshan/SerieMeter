<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%@ include file="/components/navbar.jsp"%>


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

	<%@ include file="/components/footer.jsp"%>

</body>
</html>