<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
</head>

<style>
/* Reset & base styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

body {
	font-family: 'Manrope', sans-serif;
	background-color: #F3F3F3;
	color: #333;
	min-height: 100vh;
}

/* Full-width layout wrapper with horizontal padding */
.up-container {
	width: 100%;
	max-width: 100%;
	margin: 0 auto;
	padding: 0 20px;
}

/* Top banner with background image */
.up-top-white-bg {
	width: 100%;
	background-image: url('assets/images/rectangle.png');
	background-size: cover;
	background-position: center;
}

/* Profile summary row: avatar+info on the left, stats on the right */
.up-profile-summary {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 30px;
	width: 100%;
	margin-bottom: 25px;
}

/* Left cluster: circular avatar + text details */
.up-profile-header {
	display: flex;
	align-items: center;
	gap: 20px;
}

/* Circular avatar image */
.up-avatar {
	width: 110px;
	height: 110px;
	border-radius: 50%;
	object-fit: cover;
	background-color: #e0e0e0;
}

/* User display name */
.up-user-name {
	font-size: 24px;
	font-weight: bold;
	color: #000000;
}

/* Email row with inline copy icon */
.up-user-email {
	font-size: 14px;
	color: #616161;
	display: flex;
	align-items: center;
	gap: 5px;
}

/* Small copy icon beside the email address */
.up-copy-icon {
	font-size: 16px;
	cursor: pointer;
	height: 24px;
	width: 24px;
}

/* Three-dot menu: wrapper gives the popup its positioning anchor */
.up-menu-wrapper {
	position: relative;
	display: inline-block;
}

/* The "⋯" button that opens the dropdown */
.up-three-dot-btn {
	background: none;
	border: none;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	color: #333;
	padding: 4px 8px;
	border-radius: 6px;
	line-height: 1;
	letter-spacing: 2px;
	transition: background-color 0.2s ease;
}

.up-three-dot-btn:hover {
	background-color: #f0f0f0;
}

/* Dropdown popup — hidden until .up-popup-active is added via JS */
.up-popup-menu {
    display: none;
    position: absolute;
    top: 0;
    left: calc(100% + 8px); /*It provides horizontal offset from the button */
    background-color: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
    min-width: 160px;
    z-index: 999; /*It ensures the popup appears above other elements */
    overflow: hidden;
}

/* JS adds this class to make the popup visible */
.up-popup-menu.up-popup-active {
	display: block;
}

/* Each row inside the popup (Edit Profile, Logout, etc.) */
.up-popup-item {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 12px 16px;
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	cursor: pointer;
	text-decoration: none;
	transition: background-color 0.15s ease;
	white-space: nowrap;
}

.up-popup-item:hover {
	background-color: #f5f5f5;
}

/* Logout row uses red text */
.up-popup-item.up-logout-item {
	color: #E05454;
}

/* Icons inside the popup rows */
.up-popup-item img {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    object-fit: contain;
}

/* Stats block on the right side of the profile summary */
.up-stats {
	display: flex;
	gap: 40px;
	text-align: right;
}

.up-stat-item {
	display: flex;
	flex-direction: column;
}

/* Large number (e.g. "3") */
.up-stat-number {
	font-size: 48px;
	font-weight: bold;
	color: #2F2F2F;
}

/* Small uppercase label below the number */
.up-stat-label {
	font-size: 12px;
	font-weight: bold;
	color: #8D8D8D;
	letter-spacing: 1px;
	margin-top: -5px;
}

/* Stacked list of content cards */
.up-content-cards {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

/* Individual card container */
.up-card {
	background-color: #fff;
	padding: 25px;
	border-radius: 12px;
	border: 1px solid #e0e0e0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	min-height: 200px;
}

/* Card title on the left, sort buttons on the right */
.up-card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.up-card-header h3 {
	font-size: 18px;
	font-weight: 600;
	color: #151515;
}

/* Group of Oldest / Newest sort buttons */
.up-sort-options {
	display: flex;
	gap: 10px;
}

/* Default (inactive) sort button */
.up-sort-btn {
	padding: 8px 20px;
	border-radius: 20px;
	border: 1px solid #E0E0E0;
	background-color: #F8F9FA;
	font-size: 12px;
	font-family: 'Manrope', sans-serif;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.2s ease, color 0.2s ease;
}

/* Active sort button highlighted in green */
.up-sort-btn.up-active {
	background-color: #D9F1D7;
	color: #43A53A;
	border-color: #B1E6B0;
}

/* Card body centres the empty-state message */
.up-card-body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 120px;
}

/* Empty state text shown when no items exist */
.up-empty-message {
	font-size: 16px;
	text-align: center;
	font-style: italic;
}

.up-empty-message a {
	color: #629AC4;
	text-decoration: none;
}

.up-empty-message a:hover {
	text-decoration: underline;
}

/* Footer section*/
.up-footer {
	text-align: center;
	margin-top: 40px;
	padding-bottom: 100px;
}

.up-discover-text {
	font-size: 18px;
	font-weight: 600;
	color: #151515;
	margin-bottom: 15px;
}

/* Green pill button */
.up-explore-btn {
	padding: 12px 35px;
	background-color: #008000;
	color: white;
	border: none;
	border-radius: 32px;
	font-size: 14px;
	font-weight: 700;
	font-family: 'Manrope', sans-serif;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.up-explore-btn:hover {
	background-color: #006800;
}
</style>

<body>

	<%@ include file="/components/navbar.jsp"%>

	<!-- Top banner with background image -->
	<div class="up-top-white-bg">
		<div class="up-container">

			<!-- Profile summary: avatar + name/email/menu on the left, stats on the right -->
			<section class="up-profile-summary">

				<!-- Left side: avatar, name, 3-dot menu, email -->
				<div class="up-profile-header">

					<!-- User avatar -->
					<img src="assets/images/userProfile.jpg" alt="User Avatar"
						class="up-avatar">

					<!-- Name row + email -->
					<div class="up-user-details">

						<!-- Name and three-dot options button on the same row -->
						<div style="display: flex; align-items: center; gap: 10px; margin-bottom: 4px;">
							<h2 class="up-user-name">Alex Berg</h2>

							<!-- Three-dot menu wrapper -->
							<div class="up-menu-wrapper">

								<!-- Toggle button — click opens/closes the popup -->
								<button class="up-three-dot-btn" id="upMenuToggle"
									aria-label="More options" aria-expanded="false">&#8943;</button>

								<!-- Dropdown popup menu -->
								<div class="up-popup-menu" id="upPopupMenu" role="menu">

									<!-- Edit Profile option -->
									<a href="#" class="up-popup-item" role="menuitem">
										<!-- Inline pencil SVG icon -->
										<img alt="Logout" src="assets/icon/edit-up-profile.svg">
										Edit Profile
									</a>

									<!-- Logout option — redirects to Login servlet -->
									<a href="${pageContext.request.contextPath}/Login"
										class="up-popup-item up-logout-item" role="menuitem">
										<!-- Inline logout SVG icon -->
										<img alt="Logout" src="assets/icon/logout-up-icon.svg">
										Logout
									</a>

								</div>

							</div>
						</div>

						<!-- Email address with copy icon -->
						<p class="up-user-email">
							alex@gmail.com
							<img src="assets/icon/copy.svg" alt="Copy email" class="up-copy-icon">
						</p>

					</div>

				</div>

				<!-- Right side: bookmark and review counts -->
				<div class="up-stats">
					<div class="up-stat-item">
						<span class="up-stat-number">3</span>
						<span class="up-stat-label">BOOKMARKS</span>
					</div>
					<div class="up-stat-item">
						<span class="up-stat-number">3</span>
						<span class="up-stat-label">REVIEWS</span>
					</div>
				</div>

			</section>

		</div>
	</div>

	<!-- Main content: Bookmarks and Reviews cards -->
	<main class="up-container">
		<section class="up-content-cards">

			<!-- Bookmarks card -->
			<div class="up-card up-bookmarks-card">
				<div class="up-card-header">
					<h3>Bookmarks</h3>
					<div class="up-sort-options">
						<button class="up-sort-btn up-active">Oldest</button>
						<button class="up-sort-btn">Newest</button>
					</div>
				</div>
				<div class="up-card-body">
					<p class="up-empty-message">
						<a href="#">Nothing bookmarked yet!!</a>
					</p>
				</div>
			</div>

			<!-- Reviews card -->
			<div class="up-card up-reviews-card">
				<div class="up-card-header">
					<h3>Reviews</h3>
					<div class="up-sort-options">
						<button class="up-sort-btn up-active">Oldest</button>
						<button class="up-sort-btn">Newest</button>
					</div>
				</div>
				<div class="up-card-body">
					<p class="up-empty-message">
						<a href="#">Nothing reviewed yet!!</a>
					</p>
				</div>
			</div>

		</section>
	</main>

	<!-- Footer: call-to-action to explore more content -->
	<footer class="up-footer up-container">
		<p class="up-discover-text">
			Discover more to<br>bookmark &amp; review
		</p>
		<button class="up-explore-btn">Explore now</button>
	</footer>

	<%@ include file="/components/footer.jsp"%>

	<script>
		// Three-dot popup menu logic

		const menuToggle = document.getElementById('upMenuToggle');
		const popupMenu  = document.getElementById('upPopupMenu');

		// Toggle the popup open or closed when the button is clicked
		menuToggle.addEventListener('click', function (event) {
			event.stopPropagation(); // prevent click from immediately bubbling to document
			const isOpen = popupMenu.classList.toggle('up-popup-active');
			menuToggle.setAttribute('aria-expanded', isOpen);
		});

		// Close the popup when the user clicks anywhere else on the page
		document.addEventListener('click', function () {
			popupMenu.classList.remove('up-popup-active');
			menuToggle.setAttribute('aria-expanded', 'false');
		});

		// Clicking inside the popup should not close it
		popupMenu.addEventListener('click', function (event) {
			event.stopPropagation();
		});

		// Sort button logic: highlight only the clicked button within its group
		document.querySelectorAll('.up-sort-options').forEach(function (group) {
			group.querySelectorAll('.up-sort-btn').forEach(function (btn) {
				btn.addEventListener('click', function () {
					group.querySelectorAll('.up-sort-btn').forEach(function (b) {
						b.classList.remove('up-active');
					});
					btn.classList.add('up-active');
				});
			});
		});
	</script>

</body>
</html>
