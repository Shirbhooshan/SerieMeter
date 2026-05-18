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
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/movies.css">

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