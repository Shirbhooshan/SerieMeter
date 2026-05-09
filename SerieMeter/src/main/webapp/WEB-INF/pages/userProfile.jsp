<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	left: calc(100% + 8px);
	background-color: #fff;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
	min-width: 160px;
	z-index: 999;
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
	text-decoration: none;
	color: #333;
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

/* ── Bookmark poster grid ───────────────────────────────────────────────── */
.up-bookmarks-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 18px;
	align-items: flex-start;
}

/* Each bookmark card: poster image + info below */
.up-bookmark-card {
	position: relative;
	width: 170px;
	flex-shrink: 0;
	cursor: pointer;
}

/* Poster image fills the card width with a fixed height */
.up-bookmark-poster {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 10px;
	display: block;
	background-color: #e0e0e0;
}

/* Red heart bookmark icon in the top-right corner of the poster */
.up-bookmark-heart {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 32px;
	height: 32px;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.15);
}

.up-bookmark-heart img {
	width: 16px;
	height: 16px;
	object-fit: contain;
	display: block;
}

/* Info row below the poster */
.up-bookmark-info {
	margin-top: 8px;
}

.up-bookmark-title {
	font-size: 14px;
	font-weight: 700;
	color: #1a1a1a;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.up-bookmark-meta {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 2px;
}

.up-bookmark-genre {
	font-size: 11px;
	font-weight: 600;
	color: #8D8D8D;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.up-bookmark-year {
	font-size: 12px;
	color: #8D8D8D;
}

/* "+" add-more card */
.up-bookmark-add {
	width: 170px;
	height: 240px;
	border-radius: 10px;
	border: 2px dashed #e0e0e0;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	text-decoration: none;
	transition: border-color 0.2s;
}

.up-bookmark-add:hover {
	border-color: #43A53A;
}

.up-bookmark-add span {
	font-size: 28px;
	color: #ccc;
	line-height: 1;
}

/* ── Review items ──────────────────────────────────────────────────────── */
.up-review-item {
	display: grid;
	grid-template-columns: 1fr 2fr;
	gap: 20px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 14px;
	background-color: #fafafa;
}

/* Left column: media title + date */
.up-review-left {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.up-review-media-title {
	font-size: 26px;
	font-weight: 700;
	color: #000000; /* Updated to black */
	line-height: 1.25;
	margin-bottom: 8px;
}

.up-review-date {
	font-size: 12px;
	color: #000000; /* Updated to black */
	margin-top: auto;
}

/* Right column: stars + review text */
.up-review-right {
	display: flex;
	flex-direction: column;
}

/* Star icons row */
.up-review-stars {
	display: flex;
	gap: 4px;
	margin-bottom: 10px;
	align-items: center;
	justify-content: flex-end; /* Right aligned stars */
}

.up-star {
	width: 20px;
	height: 20px;
}

/* Review text */
.up-review-text {
	font-size: 14px;
	color: #333;
	line-height: 1.6;
	text-align: right; /* Right aligned text */
}

/* Pagination row below reviews */
.up-review-pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	padding-top: 10px;
	font-size: 13px;
}

.up-page-nav {
	color: #888;
	text-decoration: none;
}

.up-page-num {
	color: #888;
	text-decoration: none;
	width: 26px;
	height: 26px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
}

.up-page-num.up-page-active {
	background-color: #f0f0f0;
	color: #1a1a1a;
	font-weight: 700;
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

	<div class="up-top-white-bg">
		<div class="up-container">

			<section class="up-profile-summary">

				<div class="up-profile-header">

					<c:choose>
						<c:when test="${not empty sessionUser.userProfile}">
							<img
								src="${pageContext.request.contextPath}/getimage?name=${sessionUser.userProfile}&type=user"
								alt="User Avatar" class="up-avatar">
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/assets/images/userProfile.jpg"
								alt="User Avatar" class="up-avatar">
						</c:otherwise>
					</c:choose>

					<div class="up-user-details">

						<div
							style="display: flex; align-items: center; gap: 10px; margin-bottom: 4px;">

							<%-- Display the logged-in user's full name prefixed with @ --%>
							<h2 class="up-user-name">
								@
								<c:out value="${sessionUser.fullName}" />
							</h2>

							<div class="up-menu-wrapper">

								<button class="up-three-dot-btn" id="upMenuToggle"
									aria-label="More options" aria-expanded="false">&#8943;</button>

								<div class="up-popup-menu" id="upPopupMenu" role="menu">

									<a href="${pageContext.request.contextPath}/UserEdit"
										class="up-popup-item" role="menuitem"> <img alt="Edit"
										src="${pageContext.request.contextPath}/assets/icon/edit-up-profile.svg">
										Edit Profile
									</a> <a href="${pageContext.request.contextPath}/Logout"
										class="up-popup-item up-logout-item" role="menuitem"> <img
										alt="Logout"
										src="${pageContext.request.contextPath}/assets/icon/logout-up-icon.svg">
										Logout
									</a>

								</div>

							</div>
						</div>

						<p class="up-user-email">
							<c:out value="${sessionUser.email}" />
							<img
								src="${pageContext.request.contextPath}/assets/icon/copy.svg"
								alt="Copy email" class="up-copy-icon">
						</p>

					</div>

				</div>

				<div class="up-stats">
					<div class="up-stat-item">
						<span class="up-stat-number">${bookmarkCount}</span> <span
							class="up-stat-label">BOOKMARKS</span>
					</div>
					<div class="up-stat-item">
						<span class="up-stat-number">${reviewCount}</span> <span
							class="up-stat-label">REVIEWS</span>
					</div>
				</div>

			</section>

		</div>
	</div>

	<main class="up-container">
		<section class="up-content-cards">

			<div class="up-card up-bookmarks-card">
				<div class="up-card-header">
					<h3>Bookmarks</h3>
					<%-- Sort buttons: highlight whichever order is currently active --%>
					<div class="up-sort-options">
						<a
							href="${pageContext.request.contextPath}/User?bookmarkSort=oldest&reviewSort=${reviewSort}"
							class="up-sort-btn ${bookmarkSort == 'oldest' ? 'up-active' : ''}">Oldest</a>
						<a
							href="${pageContext.request.contextPath}/User?bookmarkSort=newest&reviewSort=${reviewSort}"
							class="up-sort-btn ${bookmarkSort == 'newest' ? 'up-active' : ''}">Newest</a>
					</div>
				</div>

				<c:choose>
					<c:when test="${empty userBookmarks}">
						<div class="up-card-body">
							<p class="up-empty-message">
								<a href="${pageContext.request.contextPath}/Explore">Nothing
									bookmarked yet!</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<%-- Poster grid of bookmarked media --%>
						<div class="up-bookmarks-grid">
							<c:forEach var="media" items="${userBookmarks}">
								<div class="up-bookmark-card"
									onclick="location.href='${pageContext.request.contextPath}/Media?id=${media.mediaId}'">

									<c:choose>
										<c:when test="${not empty media.mediaProfile}">
											<img class="up-bookmark-poster"
												src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
												alt="${media.title}">
										</c:when>
										<c:otherwise>
											<img class="up-bookmark-poster"
												src="${pageContext.request.contextPath}/assets/images/userProfile.jpg"
												alt="${media.title}">
										</c:otherwise>
									</c:choose>

									<div class="up-bookmark-heart">
										<img alt="heart"
											src="${pageContext.request.contextPath}/assets/icon/heart.svg">
									</div>

									<div class="up-bookmark-info">
										<div class="up-bookmark-title">
											<c:out value="${media.title}" />
										</div>
										<div class="up-bookmark-meta">
											<span class="up-bookmark-genre"> <c:out
													value="${media.genreName}" />
											</span>
											<%-- Extract 4-digit year from release_date string --%>
											<span class="up-bookmark-year"> <c:if
													test="${not empty media.releaseDate}">
													<c:out value="${fn:substring(media.releaseDate, 0, 4)}" />
												</c:if>
											</span>
										</div>
									</div>

								</div>
							</c:forEach>

							<a href="${pageContext.request.contextPath}/Explore"
								class="up-bookmark-add" title="Discover more"> <span>+</span>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="up-card up-reviews-card">
				<div class="up-card-header">
					<h3>Reviews</h3>
					<%-- Sort buttons: highlight whichever order is currently active --%>
					<div class="up-sort-options">
						<a
							href="${pageContext.request.contextPath}/User?reviewSort=oldest&bookmarkSort=${bookmarkSort}"
							class="up-sort-btn ${reviewSort == 'oldest' ? 'up-active' : ''}">Oldest</a>
						<a
							href="${pageContext.request.contextPath}/User?reviewSort=newest&bookmarkSort=${bookmarkSort}"
							class="up-sort-btn ${reviewSort == 'newest' ? 'up-active' : ''}">Newest</a>
					</div>
				</div>

				<c:choose>
					<c:when test="${empty userReviews}">
						<div class="up-card-body">
							<p class="up-empty-message">
								<a href="${pageContext.request.contextPath}/Explore">Nothing
									reviewed yet!</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<%-- Loop through each review --%>
						<c:forEach var="review" items="${userReviews}">
							<div class="up-review-item">

								<div class="up-review-left">
									<span class="up-review-media-title"> <c:out
											value="${review.mediaTitle}" />
									</span>

									<p class="up-review-date">
										<c:set var="diffMs"
											value="${now.time - review.createdAt.time}" />
										<c:set var="diffDays"
											value="${diffMs / (1000 * 60 * 60 * 24)}" />
										<c:choose>
											<c:when test="${diffDays < 1}">Today</c:when>
											<c:when test="${diffDays < 2}">Yesterday</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${diffDays}" maxFractionDigits="0" /> days ago
											</c:otherwise>
										</c:choose>
									</p>
								</div>

								<div class="up-review-right">

									<div class="up-review-stars">
										<c:set var="fullStars" value="${review.rating}" />
										<c:forEach begin="1" end="5" var="i">
											<c:choose>
												<c:when test="${i <= fullStars}">
													<img
														src="${pageContext.request.contextPath}/assets/icon/star-userp.svg"
														alt="filled star" class="up-star filled">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/assets/icon/fadedstar-userp.svg"
														alt="empty star" class="up-star empty">
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>

									<p class="up-review-text">
										<c:out value="${review.reviewText}" />
									</p>

								</div>

							</div>
						</c:forEach>

						<div class="up-review-pagination">
							<a href="#" class="up-page-nav">&lt;</a> <a href="#"
								class="up-page-num up-page-active">1</a> <a href="#"
								class="up-page-nav">&gt;</a>
						</div>

					</c:otherwise>
				</c:choose>
			</div>

		</section>
	</main>

	<footer class="up-footer up-container">
		<p class="up-discover-text">
			Discover more to<br>bookmark &amp; review
		</p>
		<button class="up-explore-btn"
			onclick="location.href='${pageContext.request.contextPath}/Explore'">
			Explore now</button>
	</footer>

	<%@ include file="/components/footer.jsp"%>

	<script>
		// ── Three-dot popup menu logic ─────────────────────────────────────────

		const menuToggle = document.getElementById('upMenuToggle');
		const popupMenu  = document.getElementById('upPopupMenu');

		// Toggle the popup open or closed when the button is clicked
		menuToggle.addEventListener('click', function (event) {
			event.stopPropagation();
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

		// ── Copy-email-to-clipboard logic ──────────────────────────────────────

		const copyIcon = document.querySelector('.up-copy-icon');

		copyIcon.addEventListener('click', function () {

			// Read the email text from the paragraph's first text node
			const email = document.querySelector('.up-user-email').childNodes[0].textContent.trim();

			navigator.clipboard.writeText(email)
				.then(function () {
					// Swap to checkmark for 2 seconds as visual confirmation
					copyIcon.src   = '${pageContext.request.contextPath}/assets/icon/check.svg';
					copyIcon.title = 'Copied!';

					setTimeout(function () {
						copyIcon.src   = '${pageContext.request.contextPath}/assets/icon/copy.svg';
						copyIcon.title = '';
					}, 2000);
				})
				.catch(function () {
					alert('Failed to copy email. Please copy it manually.');
				});
		});
	</script>

</body>
</html>