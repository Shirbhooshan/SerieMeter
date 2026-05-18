<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${sessionUser.userName}- Profile</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
<script src="${pageContext.request.contextPath}/javascript/userProfile.js"></script>
</head>

<body>

	<%@ include file="/components/navbar.jsp"%>

	<div class="up-top-white-bg">
		<div class="up-container">

			<section class="up-profile-summary">

				<div class="up-profile-header">

					<c:choose>
						<c:when test="${not empty sessionUser.userProfile}">
							<img
								src="${pageContext.request.contextPath}/getimage?name=${sessionUser.userProfile}&type=user"
								alt="User Avatar" class="up-avatar">
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/assets/images/userProfile.jpg"
								alt="User Avatar" class="up-avatar">
						</c:otherwise>
					</c:choose>

					<div class="up-user-details">

						<div
							style="display: flex; align-items: center; gap: 10px; margin-bottom: 4px;">

							<h2 class="up-user-name">
								@
								<c:out value="${sessionUser.fullName}" />
							</h2>

							<!-- Clicking this button does a GET to the server; the servlet responds
							     by setting popupStyle to display:block or display:none — no JS involved -->
							<div class="up-menu-wrapper">

								<form method="get"
									action="${pageContext.request.contextPath}/User"
									style="display: inline;">
									<button type="submit" name="action" value="open-menu"
										class="up-three-dot-btn" aria-label="More options">&#8943;</button>
								</form>

								<!-- This invisible backdrop only appears when the menu is open.
								     Clicking anywhere outside the popup sends a close action back to the server. -->
								<c:if test="${param.action == 'open-menu'}">
									<form method="get"
										action="${pageContext.request.contextPath}/User">
										<button type="submit" name="action" value="close"
											class="up-backdrop" aria-label="Close menu"></button>
									</form>
								</c:if>

								<div class="up-popup-menu" id="upPopupMenu" role="menu"
									style="${popupStyle}">

									<c:choose>
										<c:when test="${param.action == 'open-menu'}">
											<a href="${pageContext.request.contextPath}/UserEdit"
												class="up-popup-item" role="menuitem"> <img alt="Edit"
												src="${pageContext.request.contextPath}/assets/icon/edit-up-profile.svg">
												Edit Profile
											</a>
											<a href="${pageContext.request.contextPath}/Logout"
												class="up-popup-item up-logout-item" role="menuitem"> <img
												alt="Logout"
												src="${pageContext.request.contextPath}/assets/icon/logout-up-icon.svg">
												Logout
											</a>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>

								</div>

							</div>
						</div>

						<p class="up-user-email">
							<c:out value="${sessionUser.email}" />
							<img
								src="${pageContext.request.contextPath}/assets/icon/copy.svg"
								alt="Copy email" class="up-copy-icon">
						</p>

					</div>

				</div>

				<div class="up-stats">
					<div class="up-stat-item">
						<span class="up-stat-number">${bookmarkCount}</span> <span
							class="up-stat-label">BOOKMARKS</span>
					</div>
					<div class="up-stat-item">
						<span class="up-stat-number">${reviewCount}</span> <span
							class="up-stat-label">REVIEWS</span>
					</div>
				</div>

			</section>

		</div>
	</div>

	<main class="up-container">
		<section class="up-content-cards">

			<div class="up-card up-bookmarks-card">
				<div class="up-card-header">
					<h3>Bookmarks</h3>
					<!-- The active class is applied conditionally so the selected sort order stays highlighted -->
					<div class="up-sort-options">
						<a
							href="${pageContext.request.contextPath}/User?bookmarkSort=oldest&reviewSort=${reviewSort}"
							class="up-sort-btn ${bookmarkSort == 'oldest' ? 'up-active' : ''}">Oldest</a>
						<a
							href="${pageContext.request.contextPath}/User?bookmarkSort=newest&reviewSort=${reviewSort}"
							class="up-sort-btn ${bookmarkSort == 'newest' ? 'up-active' : ''}">Newest</a>
					</div>
				</div>

				<c:choose>
					<c:when test="${empty userBookmarks}">
						<div class="up-card-body">
							<p class="up-empty-message">
								<a href="${pageContext.request.contextPath}/Explore">Nothing
									bookmarked yet!</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="up-bookmarks-grid">
							<c:forEach var="media" items="${userBookmarks}">
								<div class="up-bookmark-card"
									onclick="location.href='${pageContext.request.contextPath}/Media?id=${media.mediaId}'">

									<c:choose>
										<c:when test="${not empty media.mediaProfile}">
											<img class="up-bookmark-poster"
												src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
												alt="${media.title}">
										</c:when>
										<c:otherwise>
											<img class="up-bookmark-poster"
												src="${pageContext.request.contextPath}/assets/images/userProfile.jpg"
												alt="${media.title}">
										</c:otherwise>
									</c:choose>

									<div class="up-bookmark-heart">
										<img alt="heart"
											src="${pageContext.request.contextPath}/assets/icon/heart.svg">
									</div>

									<div class="up-bookmark-info">
										<div class="up-bookmark-title">
											<c:out value="${media.title}" />
										</div>
										<div class="up-bookmark-meta">
											<span class="up-bookmark-genre"> <c:out
													value="${media.genreName}" />
											</span>
											<!-- releaseDate is a full date string, so we slice just the first 4 characters to get the year -->
											<span class="up-bookmark-year"> <c:if
													test="${not empty media.releaseDate}">
													<c:out value="${fn:substring(media.releaseDate, 0, 4)}" />
												</c:if>
											</span>
										</div>
									</div>

								</div>
							</c:forEach>

							<a href="${pageContext.request.contextPath}/Explore"
								class="up-bookmark-add" title="Discover more"> <span>+</span>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="up-card up-reviews-card">
				<div class="up-card-header">
					<h3>Reviews</h3>
					<!-- Same active-class trick as the bookmarks sort above -->
					<div class="up-sort-options">
						<a
							href="${pageContext.request.contextPath}/User?reviewSort=oldest&bookmarkSort=${bookmarkSort}"
							class="up-sort-btn ${reviewSort == 'oldest' ? 'up-active' : ''}">Oldest</a>
						<a
							href="${pageContext.request.contextPath}/User?reviewSort=newest&bookmarkSort=${bookmarkSort}"
							class="up-sort-btn ${reviewSort == 'newest' ? 'up-active' : ''}">Newest</a>
					</div>
				</div>

				<c:choose>
					<c:when test="${empty userReviews}">
						<div class="up-card-body">
							<p class="up-empty-message">
								<a href="${pageContext.request.contextPath}/Explore">Nothing
									reviewed yet!</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="review" items="${userReviews}">
							<div class="up-review-item">

								<div class="up-review-left">
									<span class="up-review-media-title"> <c:out
											value="${review.mediaTitle}" />
									</span>

									<p class="up-review-date">
										<c:set var="diffMs"
											value="${now.time - review.createdAt.time}" />
										<c:set var="diffDays"
											value="${diffMs / (1000 * 60 * 60 * 24)}" />
										<c:choose>
											<c:when test="${diffDays < 1}">Today</c:when>
											<c:when test="${diffDays < 2}">Yesterday</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${diffDays}" maxFractionDigits="0" /> days ago
											</c:otherwise>
										</c:choose>
									</p>
								</div>

								<div class="up-review-right">

									<div class="up-review-stars">
										<c:set var="fullStars" value="${review.rating}" />
										<c:forEach begin="1" end="5" var="i">
											<c:choose>
												<c:when test="${i <= fullStars}">
													<img
														src="${pageContext.request.contextPath}/assets/icon/star-userp.svg"
														alt="filled star" class="up-star filled">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/assets/icon/fadedstar-userp.svg"
														alt="empty star" class="up-star empty">
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>

									<p class="up-review-text">
										<c:out value="${review.reviewText}" />
									</p>

								</div>

							</div>
						</c:forEach>

						<div class="up-review-pagination">
							<a href="#" class="up-page-nav">&lt;</a> <a href="#"
								class="up-page-num up-page-active">1</a> <a href="#"
								class="up-page-nav">&gt;</a>
						</div>

					</c:otherwise>
				</c:choose>
			</div>

		</section>
	</main>

	<footer class="up-footer up-container">
		<p class="up-discover-text">
			Discover more to<br>bookmark &amp; review
		</p>
		<button class="up-explore-btn"
			onclick="location.href='${pageContext.request.contextPath}/Explore'">
			Explore now</button>
	</footer>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>