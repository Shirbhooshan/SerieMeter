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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/explore.css">

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
