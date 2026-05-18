<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Seriemeter – Explore</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<style>
/* Base */
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--orange: #E8824A;
	--orange-light: #F0A070;
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

img {
	display: block;
	width: 100%;
}

/* Hero Slider */
.sm_hero_wrap {
	margin: 24px 40px 0;
}

.sm_hero_slide {
	display: none;
	position: relative;
	border-radius: 16px;
	overflow: hidden;
	height: 240px;
	background: #2a1060;
}

.sm_hero_slide.active {
	display: block;
}

.sm_hero_slide_bg {
	position: absolute;
	inset: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0.55;
}

.sm_hero_overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.75) 0%,
		rgba(0, 0, 0, 0.3) 50%, transparent 80%);
}

.sm_hero_content {
	position: relative;
	z-index: 2;
	padding: 28px 32px;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	gap: 8px;
}

.sm_hero_badges {
	display: flex;
	gap: 8px;
	margin-bottom: 6px;
}

.sm_badge {
	padding: 3px 10px;
	border-radius: 12px;
	font-size: 10px;
	font-weight: 700;
	letter-spacing: .6px;
	text-transform: uppercase;
}

.sm_badge_trending {
	background: var(--orange);
	color: white;
}

.sm_badge_genre {
	background: rgba(255, 255, 255, 0.2);
	color: white;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.sm_hero_title {
	font-size: 36px;
	font-weight: 800;
	color: var(--white);
	letter-spacing: -0.5px;
	line-height: 1.1;
}

.sm_hero_meta {
	display: flex;
	align-items: center;
	gap: 8px;
	color: rgba(255, 255, 255, 0.7);
	font-size: 13px;
}

/* Star icon in hero meta */
.sm_hero_meta .sm_star {
	width: 14px;
	height: 14px;
	display: inline-block;
}

.sm_hero_meta .sm_dot {
	opacity: 0.5;
}

.sm_hero_btn {
	position: absolute;
	right: 32px;
	bottom: 32px;
	background: var(--orange);
	color: white;
	border: none;
	border-radius: 28px;
	width: fit-content;
	font-family: 'Manrope', sans-serif;
	padding: 8px 18px;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: background .2s, transform .15s;
	text-decoration: none;
}

.sm_hero_btn:hover {
	background: var(--orange-light);
	transform: translateY(-1px);
}

/* Slider dots */
.sm_hero_dots {
	display: flex;
	justify-content: center;
	gap: 8px;
	margin-top: 14px;
}

.sm_hero_dots span {
	display: block;
	height: 4px;
	width: 32px;
	border-radius: 2px;
	background: var(--gray-200);
	cursor: pointer;
	opacity: 0.4;
}

.sm_hero_dots span.active {
	background: var(--black);
	opacity: 1;
}

/* Main Layout */
.sm_main_layout {
	display: flex;
	gap: 0;
	padding: 40px 40px 0;
}

.sm_sidebar {
	width: 140px;
	flex-shrink: 0;
	padding-top: 4px;
}

.sm_sidebar_title {
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 4px;
}

.sm_sidebar_sortby {
	font-size: 12px;
	color: var(--gray-400);
	margin-bottom: 20px;
}

.sm_sidebar_list {
	list-style: none;
	display: flex;
	flex-direction: column;
	gap: 14px;
}

.sm_sidebar_list li a {
	font-size: 14px;
	color: #555555;
	font-weight: 400;
	transition: color .15s;
}

.sm_sidebar_list li a:hover {
	color: var(--orange);
}

.sm_content {
	flex: 1;
	min-width: 0;
}

/* Section Headers */
.sm_section_header {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 4px;
}

.sm_section_header_left h2 {
	font-size: 26px;
	font-weight: 700;
	letter-spacing: -0.3px;
}

.sm_section_header_left p {
	font-size: 13px;
	color: var(--gray-400);
	margin-top: 2px;
}

.sm_see_more {
	font-size: 13px;
	color: var(--gray-600);
	font-weight: 500;
	transition: color .15s;
}

.sm_see_more:hover {
	color: var(--orange);
}

.sm_section_divider {
	height: 1px;
	background: var(--gray-200);
	margin-bottom: 24px;
}

/* Card Grids */
.sm_grid_4 {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.sm_grid_5 {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 20px;
}

/* Media Card */
.sm_card {
	cursor: pointer;
}

.sm_card_poster {
	width: 100%;
	aspect-ratio: 2/3;
	border-radius: 12px;
	overflow: hidden;
	background: var(--gray-200);
	margin-bottom: 10px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
}

.sm_card_poster img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform .3s;
}

.sm_card:hover .sm_card_poster img {
	transform: scale(1.04);
}

.sm_card_title {
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 4px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.sm_card_meta {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 12px;
	color: var(--gray-400);
}

/* Star icon in card meta */
.sm_card_meta .sm_star {
	width: 12px;
	height: 12px;
	display: inline-block;
}

.sm_genre_tag {
	background: var(--gray-100);
	border-radius: 4px;
	padding: 1px 6px;
	font-size: 11px;
	color: var(--gray-600);
}

/* Empty state shown when a list has no items */
.sm_empty_msg {
	grid-column: 1/-1;
	text-align: center;
	padding: 40px 0;
	color: var(--gray-400);
	font-size: 14px;
}

/* CTA Banner */
.sm_cta_banner {
	background: var(--orange);
	border-radius: 20px;
	margin: 80px 40px 60px;
	padding: 48px 60px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	position: relative;
	overflow: hidden;
}

.sm_cta_banner::before, .sm_cta_banner::after {
	content: '';
	position: absolute;
	border-radius: 50%;
	border: 2px solid rgba(255, 255, 255, 0.25);
}

.sm_cta_banner::before {
	width: 180px;
	height: 180px;
	left: -50px;
	top: -50px;
}

.sm_cta_banner::after {
	width: 120px;
	height: 120px;
	left: 30px;
	top: 80px;
	border-color: rgba(255, 255, 255, 0.15);
}

.sm_cta_text {
	position: relative;
	z-index: 1;
	max-width: 500px;
}

.sm_cta_text h2 {
	font-size: 32px;
	font-weight: 800;
	color: var(--white);
	line-height: 1.2;
	margin-bottom: 12px;
}

.sm_cta_text p {
	font-size: 14px;
	color: rgba(255, 255, 255, 0.85);
	line-height: 1.6;
}

.sm_cta_action {
	position: relative;
	z-index: 1;
}

.sm_btn_start {
	background: rgba(255, 255, 255, 0.25);
	color: var(--white);
	border: 2px solid rgba(255, 255, 255, 0.5);
	border-radius: 28px;
	padding: 14px 32px;
	font-family: 'Manrope', sans-serif;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	white-space: nowrap;
	transition: background .2s;
	display: flex;
	align-items: center;
	gap: 10px;
}

.sm_btn_start:hover {
	background: rgba(255, 255, 255, 0.4);
}

/* Star icon inside CTA button */
.sm_btn_start .sm_btn_star {
	width: 18px;
	height: 18px;
	display: inline-block;
	filter: brightness(0) invert(1);
}

/* Movies and Series full sections */
.sm_section {
	padding: 0 40px;
	margin-bottom: 60px;
}

.sm_section .sm_section_header {
	margin-bottom: 4px;
}

.sm_section .sm_section_header h2 {
	font-size: 28px;
}

/* Continue browsing link */
.sm_last_viewed {
	font-size: 13px;
	color: var(--gray-600);
	text-decoration: none;
	font-weight: 500;
	align-self: center;
	transition: color .2s;
}

.sm_last_viewed:hover {
	color: var(--orange);
}

.sm_last_viewed strong {
	color: var(--text);
	font-weight: 700;
}

/* Tablet */
@media ( max-width : 768px) {
	.sm_hero_wrap {
		margin: 16px 16px 0;
	}
	.sm_hero_slide {
		height: 180px;
	}
	.sm_hero_title {
		font-size: 24px;
	}
	.sm_hero_btn {
		padding: 6px 14px;
		font-size: 12px;
		right: 16px;
		bottom: 16px;
	}

	/* Sidebar stacks above content */
	.sm_main_layout {
		flex-direction: column;
		padding: 24px 16px 0;
	}
	.sm_sidebar {
		width: 100%;
	}
	.sm_sidebar_list {
		flex-direction: row;
		flex-wrap: wrap;
		gap: 10px;
	}
	.sm_sidebar_sortby {
		display: none;
	}

	/* 2 column grids */
	.sm_grid_4 {
		grid-template-columns: repeat(2, 1fr);
	}
	.sm_grid_5 {
		grid-template-columns: repeat(2, 1fr);
	}

	/* CTA banner stacks */
	.sm_cta_banner {
		flex-direction: column;
		margin: 40px 16px 40px;
		padding: 32px 24px;
		gap: 20px;
	}
	.sm_cta_text h2 {
		font-size: 22px;
	}
	.sm_section {
		padding: 0 16px;
	}
}

@media ( max-width : 480px) {
	.sm_hero_slide {
		height: 160px;
	}
	.sm_hero_title {
		font-size: 20px;
	}
	.sm_hero_wrap {
		margin: 12px;
	}
	.sm_grid_4, .sm_grid_5 {
		grid-template-columns: repeat(3, 1fr);
		gap: 10px;
	}
	.sm_card_title {
		font-size: 11px;
	}
	.sm_card_meta {
		font-size: 10px;
	}
	.sm_cta_text h2 {
		font-size: 20px;
	}
}
</style>
</head>

<body>

	<%@ include file="/components/navbar.jsp"%>


	<div class="sm_hero_wrap">

		<%-- Static slides using images from assets --%>
		<div class="sm_hero_slide active">
			<img class="sm_hero_slide_bg"
				src="${pageContext.request.contextPath}/assets/images/tintin.jpg"
				alt="Slide 1" />
			<div class="sm_hero_overlay"></div>
			<div class="sm_hero_content">
				<div class="sm_hero_badges">
					<span class="sm_badge sm_badge_trending">TRENDING</span> <span
						class="sm_badge sm_badge_genre">Drama</span>
				</div>
				<h1 class="sm_hero_title">Discover your next favourite</h1>
				<div class="sm_hero_meta">
					<img
						src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
						alt="star" class="sm_star" /> <span>Top rated movies and
						series</span>
				</div>
			</div>
		</div>

		<div class="sm_hero_slide">
			<img class="sm_hero_slide_bg"
				src="${pageContext.request.contextPath}/assets/images/interstellar.webp"
				alt="Slide 2" />
			<div class="sm_hero_overlay"></div>
			<div class="sm_hero_content">
				<div class="sm_hero_badges">
					<span class="sm_badge sm_badge_trending">NEW</span> <span
						class="sm_badge sm_badge_genre">Sci-Fi</span>
				</div>
				<h1 class="sm_hero_title">Rate what you watch</h1>
				<div class="sm_hero_meta">
					<img
						src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
						alt="star" class="sm_star" /> <span>Share your opinion
						with the community</span>
				</div>
			</div>

		</div>

		<div class="sm_hero_slide">
			<img class="sm_hero_slide_bg"
				src="${pageContext.request.contextPath}/assets/images/lalaland.jpeg"
				alt="Slide 3" />
			<div class="sm_hero_overlay"></div>
			<div class="sm_hero_content">
				<div class="sm_hero_badges">
					<span class="sm_badge sm_badge_trending">POPULAR</span> <span
						class="sm_badge sm_badge_genre">Thriller</span>
				</div>
				<h1 class="sm_hero_title">Build your watchlist</h1>
				<div class="sm_hero_meta">
					<img
						src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
						alt="star" class="sm_star" /> <span>Save titles you want
						to watch</span>
				</div>
			</div>

		</div>

	</div>


	<div class="sm_hero_dots" id="heroDots">
		<span class="active" onclick="goToSlide(0)"></span> <span
			onclick="goToSlide(1)"></span> <span onclick="goToSlide(2)"></span>
	</div>


	<div class="sm_main_layout">

		<aside class="sm_sidebar">
			<h3 class="sm_sidebar_title">Genres</h3>
			<p class="sm_sidebar_sortby">Sort by</p>
			<ul class="sm_sidebar_list">
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Action">Action</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Comedy">Comedy</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Thriller">Thriller</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Sci-Fi">Sci-Fi</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Romance">Romance</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Horror">Horror</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Genre?name=Drama">Drama</a></li>
			</ul>
		</aside>

		<div class="sm_content">

			<div class="sm_section_header">
				<div class="sm_section_header_left">
					<h2>Trending</h2>
					<p>Most reviewed</p>
				</div>

				<!-- Showing the last viewed media if cookie exists -->
				<c:if test="${not empty lastViewedId}">
					<a
						href="${pageContext.request.contextPath}/Media?id=${lastViewedId}"
						class="sm_last_viewed"> Continue browsing <strong>${lastViewedTitle}</strong>
					</a>
				</c:if>
			</div>

			<div class="sm_section_divider"></div>

			<!-- trendingList comes from Explore servlet the top 8 most reviewed -->
			<div class="sm_grid_4">
				<c:choose>
					<c:when test="${empty trendingList}">
						<p class="sm_empty_msg">No trending media yet.</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="media" items="${trendingList}" varStatus="s">
							<c:if test="${s.index < 8}">
								<a
									href="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
									class="sm_card">
									<div class="sm_card_poster">
										<img
											src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
											alt="${media.title}" />
									</div>
									<div class="sm_card_title">${media.title}</div>
									<div class="sm_card_meta">
										<img
											src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
											alt="star" class="sm_star" /> <span class="sm_genre_tag">${media.genreName}</span>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</div>


	<div class="sm_cta_banner">
		<div class="sm_cta_text">
			<h2>Your voice is the final cut.</h2>
			<p>Seriemeter is more than just a database, it's a democracy of
				taste. Join a community of thousands scoring the world's most
				important films.</p>
		</div>
		<div class="sm_cta_action">
			<button class="sm_btn_start">
				<a href="${pageContext.request.contextPath}/Randomize"> <img
					src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
					alt="star" class="sm_btn_star" /> Start reviewing
				</a>
			</button>
		</div>
	</div>


	<!-- movieList comes from Explore servlet where category_id = 1 -->
	<div class="sm_section">
		<div class="sm_section_header">
			<div class="sm_section_header_left">
				<h2>Movies</h2>
			</div>
			<a href="${pageContext.request.contextPath}/Movies"
				class="sm_see_more">See more..</a>
		</div>
		<div class="sm_section_divider"></div>

		<div class="sm_grid_5">
			<c:choose>
				<c:when test="${empty movieList}">
					<p class="sm_empty_msg">No movies added yet.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="media" items="${movieList}">
						<a
							href="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
							class="sm_card">
							<div class="sm_card_poster">
								<img
									src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
									alt="${media.title}" />
							</div>
							<div class="sm_card_title">${media.title}</div>
							<div class="sm_card_meta">
								<img
									src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
									alt="star" class="sm_star" /> <span class="sm_genre_tag">${media.genreName}</span>
							</div>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<!-- seriesList comes from Explore servlet where category_id = 2 -->
	<div class="sm_section">
		<div class="sm_section_header">
			<div class="sm_section_header_left">
				<h2>Series</h2>
			</div>
			<a href="${pageContext.request.contextPath}/Series"
				class="sm_see_more">See more..</a>
		</div>
		<div class="sm_section_divider"></div>

		<div class="sm_grid_5">
			<c:choose>
				<c:when test="${empty seriesList}">
					<p class="sm_empty_msg">No series added yet.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="media" items="${seriesList}">
						<a
							href="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
							class="sm_card">
							<div class="sm_card_poster">
								<img
									src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
									alt="${media.title}" />
							</div>
							<div class="sm_card_title">${media.title}</div>
							<div class="sm_card_meta">
								<img
									src="${pageContext.request.contextPath}/assets/icon/star-full.svg"
									alt="star" class="sm_star" /> <span class="sm_genre_tag">${media.genreName}</span>
							</div>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<%@ include file="/components/footer.jsp"%>


	<script>
		var slides = document.querySelectorAll('.sm_hero_slide');
		var dots = document.querySelectorAll('#heroDots span');
		var current = 0;

		/* Switching to slide i and update the dots */
		function goToSlide(i) {
			slides[current].classList.remove('active');
			if (dots[current])
				dots[current].classList.remove('active');

			current = i;

			slides[current].classList.add('active');
			if (dots[current])
				dots[current].classList.add('active');
		}

		/* Auto advances every 4 seconds */
		if (slides.length > 1) {
			setInterval(function() {
				goToSlide((current + 1) % slides.length);
			}, 4000);
		}
	</script>

</body>
</html>
