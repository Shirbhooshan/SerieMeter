<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${genreName}- SerieMeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
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
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
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

.sm_empty_msg {
	grid-column: 1/-1;
	text-align: center;
	padding: 60px 0;
	color: var(--gray-400);
	font-size: 15px;
}

.ad-text-orange {
	color: #e37329;
}

/* ── mediaa tag── */
@media ( max-width : 768px) {
	.page-header {
		padding: 32px 24px 24px;
		flex-direction: column;
		gap: 16px;
	}
	.page-header__title {
		font-size: 38px;
		letter-spacing: -1px;
	}
	.page-header__subtitle {
		font-size: 14px;
	}
	.sm_section {
		padding: 0 24px;
		margin-bottom: 48px;
	}
	.sm_grid_5 {
		grid-template-columns: repeat(2, 1fr);
		/* Clean 2-column layout on mobile devices */
		gap: 16px;
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
			<p class="page-header__label">Genre Collection</p>
			<h1 class="page-header__title">
				<c:set var="name" value="${genreName}" />
				<%-- Logic to style the last 3-4 letters orange for that cinematic look --%>
				<c:choose>
					<c:when test="${fn:length(name) > 4}">
						${fn:substring(name, 0, fn:length(name)-4)}<span
							class="ad-text-orange">${fn:substring(name, fn:length(name)-4, fn:length(name))}</span>
					</c:when>
					<c:otherwise>
						${fn:substring(name, 0, 1)}<span class="ad-text-orange">${fn:substring(name, 1, fn:length(name))}</span>
					</c:otherwise>
				</c:choose>
			</h1>
			<p class="page-header__subtitle">
				A curated collection of all ${genreName} titles.<br>
			</p>
		</div>
	</div>

	<div class="sm_section">
		<div class="sm_grid_5">
			<c:choose>
				<c:when test="${empty mediaList}">
					<div class="sm_empty_msg">
						<p>
							No titles found in the <strong>${genreName}</strong> genre yet.
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="media" items="${mediaList}">
						<a
							href="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
							class="sm_card">
							<div class="sm_card_poster">
								<img
									src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
									alt="${media.title}"
									onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg'; this.style.opacity='0.6';" />
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