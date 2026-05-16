<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Seriemeter – Bookmarks</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />

<style>
/* Base */
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--orange: #E8824A;
	--black: #0D0D0D;
	--white: #FFFFFF;
	--gray-100: #F5F5F5;
	--gray-200: #E8E8E8;
	--gray-400: #AAAAAA;
	--gray-600: #666666;
	--text: #1A1A1A;
}

body {
	font-family: 'Manrope', sans-serif;
	color: var(--text);
	background: var(--white);
	min-height: 100vh;
}

a {
	text-decoration: none;
	color: inherit;
}

/* Page Header */
.sm_bm_header {
	padding: 48px 60px 40px;
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
}

.sm_bm_header_label {
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-bottom: 10px;
}

.sm_bm_header_title {
	font-size: 52px;
	font-weight: 800;
	letter-spacing: -1.5px;
	line-height: 1.05;
	color: var(--black);
	margin-bottom: 14px;
}

.sm_bm_header_sub {
	font-size: 15px;
	color: var(--gray-600);
	line-height: 1.6;
}

/* Clear all button only shows when bookmarks exist */
.sm_bm_clear_btn {
	background: var(--black);
	color: var(--white);
	border: none;
	border-radius: 8px;
	padding: 16px 32px;
	font-family: 'Manrope', sans-serif;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	white-space: nowrap;
	margin-top: 8px;
	transition: background .2s;
	text-decoration: none;
	display: inline-block;
}

.sm_bm_clear_btn:hover {
	background: #333;
}

/* Shown when the user has no bookmarks */
.sm_bm_empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 80px 20px 120px;
	gap: 16px;
	text-align: center;
}

.sm_bm_empty_icon {
	width: 56px;
	height: 56px;
	opacity: 0.3;
}

.sm_bm_empty_title {
	font-size: 22px;
	font-weight: 700;
	color: var(--text);
}

.sm_bm_empty_sub {
	font-size: 14px;
	color: var(--gray-400);
	max-width: 320px;
	line-height: 1.6;
}

.sm_bm_explore_btn {
	margin-top: 8px;
	background: var(--orange);
	color: var(--white);
	border: none;
	border-radius: 28px;
	padding: 12px 28px;
	font-family: 'Manrope', sans-serif;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background .2s;
}

.sm_bm_explore_btn:hover {
	background: #d4703b;
}

/* Bookmarks Grid */
.sm_bm_grid {
	padding: 0 60px 80px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 28px 24px;
}

/*  Bookmark Card */
.sm_bm_card {
	cursor: pointer;
}

.sm_bm_card_poster {
	position: relative;
	width: 100%;
	aspect-ratio: 2/3;
	border-radius: 12px;
	overflow: hidden;
	background: var(--gray-200);
	margin-bottom: 12px;
}

.sm_bm_card_poster img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform .3s;
}

.sm_bm_card:hover .sm_bm_card_poster img {
	transform: scale(1.04);
}

/* Remove bookmark button */
.sm_bm_remove_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 32px;
	height: 32px;
	background: var(--white);
	border: none;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 2;
	cursor: pointer;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
	transition: background .2s;
}

.sm_bm_remove_btn:hover {
	background: #fee2e2;
}

.sm_bm_remove_btn img {
	width: 14px;
	height: 14px;
}

.sm_bm_card_info {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	gap: 8px;
}

.sm_bm_card_title {
	font-size: 15px;
	font-weight: 700;
	line-height: 1.3;
	color: var(--black);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.sm_bm_card_year {
	font-size: 14px;
	font-weight: 500;
	color: var(--gray-400);
	white-space: nowrap;
	margin-top: 1px;
}

.sm_bm_card_genre {
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 1px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-top: 4px;
}


@media (max-width: 768px) {
    .sm_bm_header { flex-direction: column; padding: 28px 24px 20px; gap: 16px; }
    .sm_bm_header_title { font-size: 38px; }
    .sm_bm_grid { grid-template-columns: repeat(2, 1fr); padding: 0 24px 60px; gap: 20px 14px; }
}

@media (max-width: 480px) {
    .sm_bm_header_title { font-size: 30px; }
    .sm_bm_header { padding: 24px 16px 16px; }
    .sm_bm_grid { grid-template-columns: repeat(2, 1fr); padding: 0 16px 40px; gap: 14px 10px; }
}

</style>
</head>
<body>

	<!-- Navbar component -->
	<%@ include file="/components/navbar.jsp"%>


	<!-- Page header -->
	<div class="sm_bm_header">
		<div>
			<p class="sm_bm_header_label">Personal Archive</p>
			<h1 class="sm_bm_header_title">Your Bookmarks</h1>
			<p class="sm_bm_header_sub">
				A curated collection of your saved titles.<br> Ready to be
				revisited at any moment.
			</p>
		</div>

		<!-- Clear all button only show if there are bookmarks -->

		<c:if test="${not empty bookmarkList}">
			<form action="${pageContext.request.contextPath}/Bookmark"
				method="post" style="display: inline;">
				<input type="hidden" name="action" value="clearAll" />
				<button type="submit" class="sm_bm_clear_btn"
					onclick="return confirm('Are you sure you want to clear all bookmarks?')">
					Clear All</button>
			</form>
		</c:if>
	</div>


	<!-- if no bookmarks then it is empty otherwise it shows the grid -->
	<c:choose>

		<c:when test="${empty bookmarkList}">

			<!-- Empty state shown until user adds bookmarks -->

			<div class="sm_bm_empty">
				<img class="sm_bm_empty_icon"
					src="${pageContext.request.contextPath}/assets/icon/bookmark_icon.svg"
					alt="No bookmarks" />
				<p class="sm_bm_empty_title">No bookmarks yet</p>
				<p class="sm_bm_empty_sub">Start exploring movies and series and
					save your favourites here.</p>
				<a href="${pageContext.request.contextPath}/Explore"
					class="sm_bm_explore_btn"> Explore Now </a>
			</div>
		</c:when>

		<c:otherwise>

			<!-- Bookmark cards grid -->

			<div class="sm_bm_grid">
				<c:forEach var="media" items="${bookmarkList}">
					<div class="sm_bm_card">

						<div class="sm_bm_card_poster">
							<a
								href="${pageContext.request.contextPath}/Media?id=${media.mediaId}">
								<img
								src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
								alt="${media.title}" />
							</a>
							<form action="${pageContext.request.contextPath}/Bookmark"
								method="post">
								<input type="hidden" name="action" value="remove" /> <input
									type="hidden" name="mediaId" value="${media.mediaId}" />
								<button class="sm_bm_remove_btn" type="submit"
									title="Remove bookmark">
									<img
										src="${pageContext.request.contextPath}/assets/icon/heart.svg"
										alt="Remove" />
								</button>
							</form>
						</div>

						<div class="sm_bm_card_info">
							<div>
								<div class="sm_bm_card_title">${media.title}</div>
								<div class="sm_bm_card_genre">${media.genreName}</div>
							</div>
							<div class="sm_bm_card_year">${media.releaseDate}</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</c:otherwise>

	</c:choose>


	<!-- Footer component -->
	<%@ include file="/components/footer.jsp"%>

</body>
</html>
