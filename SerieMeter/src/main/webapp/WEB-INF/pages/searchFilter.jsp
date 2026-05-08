<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SerieMeter – Search</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />

<style>

/* Base*/
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
	--gray-300: #CCCCCC;
	--gray-400: #AAAAAA;
	--gray-600: #666666;
	--text: #1A1A1A;
}

body {
	font-family: 'Manrope', sans-serif;
	background: var(--white);
	color: var(--text);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

a {
	text-decoration: none;
	color: inherit;
}

/* Page Body  */
.sm_sf_body {
	display: flex;
	flex: 1;
	padding: 30px 40px;
	gap: 30px;
	align-items: flex-start;
}

/* Sidebar */
.sm_sf_sidebar {
	width: 260px;
	min-width: 260px;
	background: var(--white);
	border-radius: 10px;
	padding: 20px 18px;
}

.sm_sf_sidebar_title {
	font-size: 17px;
	font-weight: 700;
	margin-bottom: 18px;
	color: var(--text);
}

/* Label above each filter group */
.sm_sf_filter_label {
	font-size: 10px;
	font-weight: 700;
	letter-spacing: 1.4px;
	text-transform: uppercase;
	color: var(--gray-600);
	margin-top: 18px;
	margin-bottom: 10px;
}

/* Movie / Series toggle pills */
.sm_sf_pill_row {
	display: flex;
	gap: 10px;
}

.sm_sf_pill {
	padding: 7px 18px;
	border-radius: 20px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	border: none;
	transition: background .2s, color .2s;
}

.sm_sf_pill.active {
	background: var(--black);
	color: var(--white);
}

.sm_sf_pill.inactive {
	background: var(--gray-200);
	color: var(--gray-600);
}

.sm_sf_pill:hover {
	background: #444;
	color: var(--white);
}

/* Genre 2-col grid */
.sm_sf_genre_grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
}

.sm_sf_genre_tag {
	padding: 8px 10px;
	background: var(--gray-100);
	border-radius: 6px;
	font-size: 13px;
	color: var(--gray-600);
	text-align: center;
	cursor: pointer;
	border: 1px solid transparent;
	transition: background .2s, color .2s;
}

.sm_sf_genre_tag:hover, .sm_sf_genre_tag.on {
	background: var(--orange);
	color: var(--white);
	border-color: var(--orange);
}

/* Year dropdown  */
.sm_sf_year_select {
	width: 100%;
	background: var(--white);
	border: 1px solid var(--gray-300);
	border-radius: 6px;
	color: var(--text);
	padding: 9px 12px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	cursor: pointer;
	appearance: none;
	-webkit-appearance: none;
	background-image: url("../icon/drop-down.svg");
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.sm_sf_year_select:focus {
	outline: none;
	border-color: var(--orange);
}

/* Rating pills */
.sm_sf_rating_row {
	display: flex;
	gap: 8px;
}

.sm_sf_rating_pill {
	flex: 1;
	padding: 8px 0;
	background: var(--white);
	border: 1px solid var(--gray-300);
	border-radius: 6px;
	color: var(--gray-600);
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 4px;
	transition: background .2s, color .2s;
}

.sm_sf_rating_pill img {
	width: 12px;
	height: 12px;
}

.sm_sf_rating_pill:hover, .sm_sf_rating_pill.on {
	background: var(--orange);
	color: var(--white);
	border-color: var(--orange);
}

/* star icon turns white when pill is active */
.sm_sf_rating_pill.on img, .sm_sf_rating_pill:hover img {
	filter: brightness(0) invert(1);
}

/* Reset button */
.sm_sf_reset_btn {
	width: 100%;
	margin-top: 22px;
	padding: 12px;
	background: var(--black);
	color: var(--white);
	border: none;
	border-radius: 24px;
	font-size: 14px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	transition: background .2s;
}

.sm_sf_reset_btn:hover {
	background: #333;
}

/* ── Content Area  */
.sm_sf_content {
	flex: 1;
}

.sm_sf_heading {
	font-size: 44px;
	font-weight: 800;
	letter-spacing: -1px;
	color: var(--text);
	line-height: 1;
}

.sm_sf_sub {
	font-size: 14px;
	color: var(--gray-400);
	margin-top: 5px;
	margin-bottom: 18px;
}

/* Sort row */
.sm_sf_sort_row {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	gap: 10px;
	margin-bottom: 22px;
}

.sm_sf_sort_label {
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 1.2px;
	text-transform: uppercase;
	color: var(--gray-400);
}

.sm_sf_sort_select {
	background: var(--white);
	border: 1px solid var(--gray-300);
	border-radius: 6px;
	color: var(--text);
	padding: 7px 28px 7px 12px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	cursor: pointer;
	appearance: none;
	-webkit-appearance: none;
	background-image: url("../icon/drop-down.svg");
	background-repeat: no-repeat;
	background-position: right 10px center;
	background-size: 12px;
}

.sm_sf_sort_select:focus {
	outline: none;
}

/* Card grid */
.sm_sf_cards_grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px 18px;
}

/* Card */
.sm_sf_card {
	cursor: pointer;
}

.sm_sf_card:hover .sm_sf_card_poster {
	transform: translateY(-4px);
}

.sm_sf_card_poster {
	width: 100%;
	aspect-ratio: 2/3;
	background: var(--gray-200);
	border-radius: 10px;
	overflow: hidden;
	transition: transform .2s;
	margin-bottom: 10px;
}

.sm_sf_card_poster img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.sm_sf_card_row {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	gap: 6px;
}

.sm_sf_card_title {
	font-size: 14px;
	font-weight: 700;
	color: var(--text);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	flex: 1;
}

.sm_sf_card_year {
	font-size: 13px;
	color: var(--gray-400);
	white-space: nowrap;
}

.sm_sf_card_genre {
	font-size: 10px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-top: 3px;
}

/* Empty state — shown until backend is wired up */
.sm_sf_empty {
	grid-column: 1/-1;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 80px 20px;
	gap: 16px;
	color: var(--gray-400);
}

.sm_sf_empty img {
	width: 48px;
	height: 48px;
	opacity: 0.35;
}

.sm_sf_empty p {
	font-size: 15px;
	font-weight: 600;
	color: var(--gray-400);
}

.sm_sf_empty span {
	font-size: 13px;
	color: var(--gray-300);
}
</style>
</head>
<body>

	<!-- Navbar component -->
	<%@ include file="/components/navbar.jsp"%>


	<div class="sm_sf_body">

		<!-- Sidebar Filters -->

		<aside class="sm_sf_sidebar">
			<div class="sm_sf_sidebar_title">Quick Search</div>

			<!-- Category  -->
			<div class="sm_sf_filter_label">Category Type</div>
			<div class="sm_sf_pill_row">
				<button class="sm_sf_pill active" onclick="smSfSelectCat(this)">Movie</button>
				<button class="sm_sf_pill inactive" onclick="smSfSelectCat(this)">Series</button>
			</div>

			<!-- Genre -->
			<div class="sm_sf_filter_label">Genre</div>
			<div class="sm_sf_genre_grid">
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Action</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Comedy</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Drama</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Thriller</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Horror</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Sci-Fi</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Romance</div>
				<div class="sm_sf_genre_tag" onclick="smSfSelectGenre(this)">Animation</div>
			</div>

			<!-- Release Year -->
			<div class="sm_sf_filter_label">Release Year</div>
			<select class="sm_sf_year_select">
				<option>All Years</option>
				<option>2020–2024</option>
				<option>2015–2019</option>
				<option>2010–2014</option>
				<option>2000–2009</option>
				<option>Before 2000</option>
			</select>

			<!--  Minimum Rating -->
			<div class="sm_sf_filter_label">Minimum Rating</div>
			<div class="sm_sf_rating_row">
				<button class="sm_sf_rating_pill" onclick="smSfSelectRating(this)">
					<img src="${pageContext.request.contextPath}/assets/icon/star.svg"
						alt="star" /> 7+
				</button>
				<button class="sm_sf_rating_pill" onclick="smSfSelectRating(this)">
					<img src="${pageContext.request.contextPath}/assets/icon/star.svg"
						alt="star" /> 8+
				</button>
				<button class="sm_sf_rating_pill" onclick="smSfSelectRating(this)">
					<img src="${pageContext.request.contextPath}/assets/icon/star.svg"
						alt="star" /> 9+
				</button>
			</div>

			<button class="sm_sf_reset_btn" onclick="smSfResetAll()">Search</button>
		</aside>


		<!-- Content  -->

		<main class="sm_sf_content">
			<c:choose>
				<c:when test="${not empty query}">
					<h1 class="sm_sf_heading">
						Results for "
						<c:out value="${query}" />
						"
					</h1>
				</c:when>
				<c:otherwise>
					<h1 class="sm_sf_heading">Search</h1>
				</c:otherwise>
			</c:choose>
			<p class="sm_sf_sub">Filter and find exactly what you want to
				watch</p>

			<div class="sm_sf_cards_grid">
				<c:choose>
					<c:when test="${not empty results}">
						<c:forEach var="media" items="${results}">
							<a
								href="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
								class="sm_sf_card">
								<div class="sm_sf_card_poster">
									<img
										src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
										alt="${media.title}"
										onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile.png'">
								</div>

								<div class="sm_sf_card_row">
									<div style="flex: 1; overflow: hidden;">
										<h3 class="sm_sf_card_title">${media.title}</h3>
										<p class="sm_sf_card_genre">${media.categoryId == 1 ? 'Movie' : 'Series'}</p>
									</div>
									<div class="sm_sf_card_year">
										${fn:substring(media.releaseDate, 0, 4)}</div>
								</div>
							</a>
						</c:forEach>
					</c:when>
					<c:when test="${results != null && empty results}">
						<div class="sm_sf_empty">
							<img
								src="${pageContext.request.contextPath}/assets/icon/search.svg"
								alt="search" />
							<p>No results found</p>
							<span>Try a different keyword</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="sm_sf_empty">
							<img
								src="${pageContext.request.contextPath}/assets/icon/search.svg"
								alt="search" />
							<p>No results yet</p>
							<span>Type something in the search bar above and hit Enter</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</main>

	</div>


	<!-- Footer Component -->
	<%@ include file="/components/footer.jsp"%>


	<script>
		/* Category pill toggle — only one active at a time */
		function smSfSelectCat(btn) {
			document.querySelectorAll('.sm_sf_pill').forEach(function(b) {
				b.classList.remove('active');
				b.classList.add('inactive');
			});
			btn.classList.remove('inactive');
			btn.classList.add('active');
		}

		/* Rating pill toggle — only one active at a time */
		function smSfSelectRating(btn) {
			document.querySelectorAll('.sm_sf_rating_pill').forEach(
					function(b) {
						b.classList.remove('on');
					});
			btn.classList.add('on');
		}

		/* Genre tag toggle — only one active at a time */
		function smSfSelectGenre(tag) {
			document.querySelectorAll('.sm_sf_genre_tag').forEach(function(t) {
				t.classList.remove('on');
			});
			tag.classList.add('on');
		}

		/* Reset all filters back to default */
		function smSfResetAll() {
			var pills = document.querySelectorAll('.sm_sf_pill');
			pills[0].classList.add('active');
			pills[0].classList.remove('inactive');
			pills[1].classList.add('inactive');
			pills[1].classList.remove('active');

			document.querySelectorAll('.sm_sf_genre_tag').forEach(function(t) {
				t.classList.remove('on');
			});

			document.querySelector('.sm_sf_year_select').selectedIndex = 0;

			document.querySelectorAll('.sm_sf_rating_pill').forEach(
					function(b) {
						b.classList.remove('on');
					});
		}
	</script>

</body>
</html>
