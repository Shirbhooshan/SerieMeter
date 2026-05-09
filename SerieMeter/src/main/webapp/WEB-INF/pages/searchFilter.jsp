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

.sm_sf_body {
	display: flex;
	flex: 1;
	padding: 30px 40px;
	gap: 30px;
	align-items: flex-start;
}

/* ── Sidebar ── */
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

.sm_sf_filter_label {
	font-size: 10px;
	font-weight: 700;
	letter-spacing: 1.4px;
	text-transform: uppercase;
	color: var(--gray-600);
	margin-top: 18px;
	margin-bottom: 10px;
}

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
	background-image: url("../icon/drop-down.svg");
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
}

.sm_sf_year_select:focus {
	outline: none;
	border-color: var(--orange);
}

/* Search button */
.sm_sf_search_btn {
	width: 100%;
	margin-top: 22px;
	padding: 12px;
	background: var(--orange);
	color: var(--white);
	border: none;
	border-radius: 24px;
	font-size: 14px;
	font-family: 'Manrope', sans-serif;
	font-weight: 700;
	cursor: pointer;
	transition: background .2s;
}

.sm_sf_search_btn:hover {
	background: #d4703e;
}

/* Reset button */
.sm_sf_reset_btn {
	width: 100%;
	margin-top: 10px;
	padding: 11px;
	background: var(--white);
	color: var(--gray-600);
	border: 1.5px solid var(--gray-300);
	border-radius: 24px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	transition: all .2s;
}

.sm_sf_reset_btn:hover {
	background: var(--gray-100);
	border-color: var(--gray-400);
	color: var(--black);
}

/* ── Content ── */
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
	margin-bottom: 14px;
}

/* Active filter tags row */
.sm_sf_active_tags {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	margin-bottom: 20px;
	min-height: 0;
}

.sm_sf_tag_chip {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	background: var(--black);
	color: var(--white);
	font-size: 12px;
	font-weight: 600;
	padding: 5px 12px 5px 14px;
	border-radius: 20px;
	letter-spacing: 0.3px;
}

.sm_sf_tag_chip span {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
	text-transform: uppercase;
	letter-spacing: 1px;
	margin-right: 2px;
}

.sm_sf_tag_chip a {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 16px;
	height: 16px;
	background: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	color: #fff;
	font-size: 10px;
	line-height: 1;
	text-decoration: none;
	margin-left: 2px;
	transition: background .15s;
}

.sm_sf_tag_chip a:hover {
	background: rgba(255, 255, 255, 0.4);
}

/* Category chip gets orange accent */
.sm_sf_tag_chip.cat {
	background: #2a2a2a;
}

.sm_sf_tag_chip.genre {
	background: var(--orange);
}

.sm_sf_tag_chip.year {
	background: #5a5a8a;
}

.sm_sf_tag_chip.query {
	background: #2a6a3a;
}

/* Result count */
.sm_sf_result_count {
	font-size: 13px;
	color: var(--gray-400);
	margin-bottom: 16px;
}

/* Card grid */
.sm_sf_cards_grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px 18px;
}

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

	<%@ include file="/components/navbar.jsp"%>

	<%-- Build "remove this filter" URLs --%>
	<c:set var="baseUrl" value="${pageContext.request.contextPath}/Search" />

	<div class="sm_sf_body">

		<!-- ── Sidebar Filters ── -->
		<aside class="sm_sf_sidebar">
			<div class="sm_sf_sidebar_title">Quick Search</div>

			<form id="filterForm"
				action="${pageContext.request.contextPath}/Search" method="GET">

				<!-- Preserve keyword query -->
				<input type="hidden" name="query" id="hiddenQuery" value="${query}">

				<!-- Category -->
				<div class="sm_sf_filter_label">Category Type</div>
				<input type="hidden" name="category" id="hiddenCategory"
					value="${category}">
				<div class="sm_sf_pill_row">
					<button type="button"
						class="sm_sf_pill ${category == '1' ? 'active' : 'inactive'}"
						onclick="smSfSelectCat(this, '1')">Movie</button>
					<button type="button"
						class="sm_sf_pill ${category == '2' ? 'active' : 'inactive'}"
						onclick="smSfSelectCat(this, '2')">Series</button>
				</div>

				<!-- Genre -->
				<div class="sm_sf_filter_label">Genre</div>
				<input type="hidden" name="genre" id="hiddenGenre" value="${genre}">
				<div class="sm_sf_genre_grid">
					<div class="sm_sf_genre_tag ${genre == '1'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '1')">Action</div>
					<div class="sm_sf_genre_tag ${genre == '2'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '2')">Comedy</div>
					<div class="sm_sf_genre_tag ${genre == '3'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '3')">Horror</div>
					<div class="sm_sf_genre_tag ${genre == '4'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '4')">Drama</div>
					<div class="sm_sf_genre_tag ${genre == '5'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '5')">Sci-Fi</div>
					<div class="sm_sf_genre_tag ${genre == '6'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '6')">Thriller</div>
					<div class="sm_sf_genre_tag ${genre == '7'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '7')">Romance</div>
					<div class="sm_sf_genre_tag ${genre == '8'  ? 'on' : ''}"
						onclick="smSfSelectGenre(this, '8')">Animation</div>
				</div>

				<!-- Release Year -->
				<div class="sm_sf_filter_label">Release Year</div>
				<select name="yearRange" class="sm_sf_year_select">
					<option value="">All Years</option>
					<option value="2020-2026"
						${yearRange == '2020-2026' ? 'selected' : ''}>2020 – 2026</option>
					<option value="2015-2019"
						${yearRange == '2015-2019' ? 'selected' : ''}>2015 – 2019</option>
					<option value="2010-2014"
						${yearRange == '2010-2014' ? 'selected' : ''}>2010 – 2014</option>
					<option value="2000-2009"
						${yearRange == '2000-2009' ? 'selected' : ''}>2000 – 2009</option>
					<option value="pre2000"
						${yearRange == 'pre2000'   ? 'selected' : ''}>Before 2000</option>
				</select>

				<button type="submit" class="sm_sf_search_btn">Apply
					Filters</button>
			</form>

			<!-- Reset — clears everything, keeps only the page -->
			<a href="${pageContext.request.contextPath}/Search">
				<button type="button" class="sm_sf_reset_btn">Reset Search
					Filters</button>
			</a>
		</aside>


		<!-- ── Content ── -->
		<main class="sm_sf_content">

			<%-- Heading --%>
			<c:choose>
				<c:when test="${not empty query}">
					<h1 class="sm_sf_heading">
						Results for &ldquo;
						<c:out value="${query}" />
						&rdquo;
					</h1>
				</c:when>
				<c:when
					test="${not empty category or not empty genre or not empty yearRange}">
					<h1 class="sm_sf_heading">Filtered Results</h1>
				</c:when>
				<c:otherwise>
					<h1 class="sm_sf_heading">Search</h1>
				</c:otherwise>
			</c:choose>

			<p class="sm_sf_sub">Filter and find exactly what you want to
				watch</p>

			<!-- ── Active filter chips ── -->
			<div class="sm_sf_active_tags">

				<!-- Keyword chip -->
				<c:if test="${not empty query}">
					<span class="sm_sf_tag_chip query"> <span>keyword</span> <c:out
							value="${query}" /> <a
						href="${baseUrl}?category=${category}&genre=${genre}&yearRange=${yearRange}"
						title="Remove">✕</a>
					</span>
				</c:if>

				<!-- Category chip -->
				<c:if test="${not empty category}">
					<span class="sm_sf_tag_chip cat"> <span>type</span> <c:choose>
							<c:when test="${category == '1'}">Movie</c:when>
							<c:otherwise>Series</c:otherwise>
						</c:choose> <a
						href="${baseUrl}?query=${query}&genre=${genre}&yearRange=${yearRange}"
						title="Remove">✕</a>
					</span>
				</c:if>

				<!-- Genre chip -->
				<c:if test="${not empty genre}">
					<span class="sm_sf_tag_chip genre"> <span>genre</span> <c:choose>
							<c:when test="${genre == '1'}">Action</c:when>
							<c:when test="${genre == '2'}">Comedy</c:when>
							<c:when test="${genre == '3'}">Horror</c:when>
							<c:when test="${genre == '4'}">Drama</c:when>
							<c:when test="${genre == '5'}">Sci-Fi</c:when>
							<c:when test="${genre == '6'}">Thriller</c:when>
							<c:when test="${genre == '7'}">Romance</c:when>
							<c:when test="${genre == '8'}">Animation</c:when>
						</c:choose> <a
						href="${baseUrl}?query=${query}&category=${category}&yearRange=${yearRange}"
						title="Remove">✕</a>
					</span>
				</c:if>

				<!-- Year chip -->
				<c:if test="${not empty yearRange}">
					<span class="sm_sf_tag_chip year"> <span>year</span> <c:choose>
							<c:when test="${yearRange == 'pre2000'}">Before 2000</c:when>
							<c:otherwise>
								<c:out value="${yearRange}" />
							</c:otherwise>
						</c:choose> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre}"
						title="Remove">✕</a>
					</span>
				</c:if>
			</div>

			<!-- Result count (only when a search was performed) -->
			<c:if test="${results != null}">
				<p class="sm_sf_result_count">${resultCount}result${resultCount != 1 ? 's' : ''}
					found</p>
			</c:if>

			<!-- Cards -->
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
									<div class="sm_sf_card_year">${fn:substring(media.releaseDate, 0, 4)}</div>
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
							<span>Try adjusting your filters or a different keyword</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="sm_sf_empty">
							<img
								src="${pageContext.request.contextPath}/assets/icon/search.svg"
								alt="search" />
							<p>No results yet</p>
							<span>Type a keyword or apply filters to get started</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</main>
	</div>

	<%@ include file="/components/footer.jsp"%>

	<script>
	// Track selected values
	let selectedCategory = '${category}';
	let selectedGenre    = '${genre}';

	function smSfSelectCat(btn, val) {
		// Toggle off if same button clicked again
		if (selectedCategory === val) {
			selectedCategory = '';
			document.querySelectorAll('.sm_sf_pill').forEach(b => {
				b.classList.remove('active');
				b.classList.add('inactive');
			});
		} else {
			selectedCategory = val;
			document.querySelectorAll('.sm_sf_pill').forEach(b => {
				b.classList.remove('active');
				b.classList.add('inactive');
			});
			btn.classList.remove('inactive');
			btn.classList.add('active');
		}
		document.getElementById('hiddenCategory').value = selectedCategory;
	}

	function smSfSelectGenre(tag, val) {
		// Toggle off if same tag clicked again
		if (selectedGenre === val) {
			selectedGenre = '';
			document.querySelectorAll('.sm_sf_genre_tag').forEach(t => t.classList.remove('on'));
		} else {
			selectedGenre = val;
			document.querySelectorAll('.sm_sf_genre_tag').forEach(t => t.classList.remove('on'));
			tag.classList.add('on');
		}
		document.getElementById('hiddenGenre').value = selectedGenre;
	}
</script>

</body>
</html>