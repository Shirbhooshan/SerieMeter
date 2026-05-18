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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/genre.css"/>

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