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
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/search.css">

</head>
<body>

	<%@ include file="/components/navbar.jsp"%>

	<c:set var="baseUrl" value="${pageContext.request.contextPath}/Search" />

	<div class="sm_sf_body">

		<!-- ── Sidebar Filters ── -->
		<aside class="sm_sf_sidebar">
			<div class="sm_sf_sidebar_title">Quick Search</div>

			<form id="filterForm" action="${baseUrl}" method="GET">

				<input type="hidden" name="query" value="${query}"> <input
					type="hidden" name="category" value="${category}"> <input
					type="hidden" name="genre" value="${genre}">

				<div class="sm_sf_filter_label">Category Type</div>
				<div class="sm_sf_pill_row">
					<a
						href="${baseUrl}?query=${query}&category=${category == '1' ? '' : '1'}&genre=${genre}&yearRange=${yearRange}"
						class="sm_sf_pill ${category == '1' ? 'active' : 'inactive'}">Movie</a>
					<a
						href="${baseUrl}?query=${query}&category=${category == '2' ? '' : '2'}&genre=${genre}&yearRange=${yearRange}"
						class="sm_sf_pill ${category == '2' ? 'active' : 'inactive'}">Series</a>
				</div>

				<div class="sm_sf_filter_label">Genre</div>
				<div class="sm_sf_genre_grid">
					<a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '1' ? '' : '1'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '1' ? 'on' : ''}">Action</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '2' ? '' : '2'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '2' ? 'on' : ''}">Comedy</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '3' ? '' : '3'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '3' ? 'on' : ''}">Horror</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '4' ? '' : '4'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '4' ? 'on' : ''}">Drama</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '5' ? '' : '5'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '5' ? 'on' : ''}">Sci-Fi</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '6' ? '' : '6'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '6' ? 'on' : ''}">Thriller</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '7' ? '' : '7'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '7' ? 'on' : ''}">Romance</a> <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre == '8' ? '' : '8'}&yearRange=${yearRange}"
						class="sm_sf_genre_tag ${genre == '8' ? 'on' : ''}">Animation</a>
				</div>

				<div class="sm_sf_filter_label">Release Year</div>
				<select name="yearRange" class="sm_sf_year_select"
					onchange="this.form.submit()">
					<option value="">All Years</option>
					<option value="2020-2026"
						${yearRange == '2020-2026' ? 'selected' : ''}>2020 – 2026</option>
					<option value="2015-2019"
						${yearRange == '2015-2019' ? 'selected' : ''}>2015 – 2019</option>
					<option value="2010-2014"
						${yearRange == '2010-2014' ? 'selected' : ''}>2010 – 2014</option>
					<option value="2000-2009"
						${yearRange == '2000-2009' ? 'selected' : ''}>2000 – 2009</option>
					<option value="pre2000" ${yearRange == 'pre2000' ? 'selected' : ''}>Before
						2000</option>
				</select>
			</form>

			<!-- Reset — clears everything, keeps only the page -->
			<a href="${baseUrl}">
				<button type="button" class="sm_sf_reset_btn">Reset Search
					Filters</button>
			</a>
		</aside>


		<!-- ── Content ── -->
		<main class="sm_sf_content">

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
				<c:if test="${not empty query}">
					<span class="sm_sf_tag_chip query"><span>keyword</span> <c:out
							value="${query}" /> <a
						href="${baseUrl}?category=${category}&genre=${genre}&yearRange=${yearRange}">✕</a>
					</span>
				</c:if>
				<c:if test="${not empty category}">
					<span class="sm_sf_tag_chip cat"><span>type</span>
						${category == '1' ? 'Movie' : 'Series'} <a
						href="${baseUrl}?query=${query}&genre=${genre}&yearRange=${yearRange}">✕</a>
					</span>
				</c:if>
				<c:if test="${not empty genre}">
					<span class="sm_sf_tag_chip genre"><span>genre</span> <c:choose>
							<c:when test="${genre == '1'}">Action</c:when>
							<c:when test="${genre == '2'}">Comedy</c:when>
							<c:when test="${genre == '3'}">Horror</c:when>
							<c:when test="${genre == '4'}">Drama</c:when>
							<c:when test="${genre == '5'}">Sci-Fi</c:when>
							<c:when test="${genre == '6'}">Thriller</c:when>
							<c:when test="${genre == '7'}">Romance</c:when>
							<c:when test="${genre == '8'}">Animation</c:when>
						</c:choose> <a
						href="${baseUrl}?query=${query}&category=${category}&yearRange=${yearRange}">✕</a>
					</span>
				</c:if>
				<c:if test="${not empty yearRange}">
					<span class="sm_sf_tag_chip year"><span>year</span>
						${yearRange == 'pre2000' ? 'Before 2000' : yearRange} <a
						href="${baseUrl}?query=${query}&category=${category}&genre=${genre}">✕</a>
					</span>
				</c:if>
			</div>

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

</body>
</html>