<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies – SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

<style>
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
	--gray-300: #CCCCCC;
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

/* ── PAGE HEADER ── */
.page-header {
	padding: 48px 40px 40px;
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
}

.page-header__label {
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-bottom: 10px;
}

.page-header__title {
	font-size: 52px;
	font-weight: 800;
	letter-spacing: -1.5px;
	line-height: 1.05;
	color: var(--black);
	margin-bottom: 14px;
}

.page-header__subtitle {
	font-size: 15px;
	color: var(--gray-600);
	line-height: 1.6;
}

.sm_section {
	padding: 0 40px;
	margin-bottom: 80px;
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

.sm_card_meta .sm_star {
	color: #f4c542;
	font-size: 11px;
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

.ad-text-orange {
	color: #e37329;
}

/* -- Media Tags -- */
@media ( max-width : 1024px) {
	.page-header {
		padding: 32px 24px 24px;
	}
	.page-header__title {
		font-size: 38px;
		letter-spacing: -1px;
	}
	.sm_section {
		padding: 0 24px;
		margin-bottom: 48px;
	}
	.sm_grid_5 {
		grid-template-columns: repeat(3, 1fr);
		gap: 16px;
	}
}

@media ( max-width : 576px) {
	.sm_grid_5 {
		grid-template-columns: repeat(2, 1fr);
		/* 2 columns for comfortable thumbnail spacing on smaller screens */
		gap: 12px;
	}
	.sm_card_title {
		font-size: 13px;
	}
	.sm_card_meta {
		font-size: 11px;
	}
}
</style>

</head>
<body>

	<%@ include file="/components/navbar.jsp"%>

	<div class="page-header">
		<div class="page-header__left">
			<h1 class="page-header__title">
				Mo<span class="ad-text-orange">vies</span>
			</h1>
			<p class="page-header__subtitle">
				A curated collection of all movies.<br>
			</p>
		</div>
	</div>

	<div class="sm_section">

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
								<span class="sm_star">★</span> <span class="sm_genre_tag">${media.genreName}</span>
							</div>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>