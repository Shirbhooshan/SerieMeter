<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>${media.title}| SerieMeter</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<style>
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	min-height: 100vh;
	background-image:
		url('${pageContext.request.contextPath}/assets/images/Title Screen.jpg');
	background-size: cover;
	background-position: top right;
	background-attachment: scroll;
	background-color: #fff;
	overflow-x: hidden;
	font-family: 'Manrope', sans-serif;
}

.container {
	display: flex;
	gap: 80px;
	align-items: flex-start;
	max-width: 1400px;
	margin: 0 auto;
	padding: 80px 20px 60px 20px;
}

.left-content {
	flex: 2;
}

.right-content {
	flex: 1.2;
	position: sticky;
	top: 100px;
	margin-top: 120px;
}

.meta {
	color: #888;
	font-size: 13px;
	margin-bottom: 10px;
}

.genre-tag {
	display: inline-block;
	background: #f0f0f0;
	color: #555;
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
	padding: 4px 12px;
	border-radius: 20px;
	margin-bottom: 14px;
}

.title {
	font-size: 72px;
	font-weight: 800;
	line-height: 1;
	margin-bottom: 30px;
}

.bookmark-btn {
	background-color: #449d5d;
	color: white;
	border: none;
	padding: 16px 36px;
	border-radius: 50px;
	font-weight: 700;
	font-size: 18px;
	display: flex;
	align-items: center;
	gap: 12px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.bookmark-btn.remove-state {
	background-color: #e53935;
}

.btn-icon {
	width: 22px;
	height: 22px;
	filter: brightness(0) invert(1);
}

.rating-box {
	background: #333;
	color: white;
	padding: 24px 45px;
	border-radius: 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 340px;
	margin-left: auto;
	margin-bottom: 60px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.rating-label {
	text-transform: uppercase;
	font-size: 11px;
	letter-spacing: 2px;
	opacity: 0.8;
	font-weight: 700;
}

.rating-score {
	font-size: 18px;
	font-weight: 800;
	color: #f9a825;
}

.section-header {
	display: flex;
	align-items: center;
	gap: 10px;
	margin: 40px 0 20px;
}

.orange-line {
	width: 30px;
	height: 1.5px;
	background-color: #ff7a50;
}

.section-header h3 {
	font-size: 18px;
	font-weight: 700;
	color: #1a1a1a;
}

.synopsis-text {
	font-size: 14px;
	line-height: 1.8;
	color: #666;
	margin-bottom: 30px;
}

.director-label {
	font-size: 12px;
	color: #999;
	margin-bottom: 5px;
}

.director-name {
	font-size: 18px;
	color: #333;
	font-weight: 500;
}

.separator {
	width: 100%;
	height: 1px;
	background-color: #eee;
	margin: 30px 0;
}

/* --- Write Review Card --- */
.review-card {
	background: #fff;
	border-radius: 30px;
	padding: 40px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
	border: 1px solid #f0f0f0;
	border-left: 6px solid #4ebc57; /* green accent */
	overflow: hidden;
}

.review-card h4 {
	font-size: 15px;
	font-weight: 700;
	color: #444;
	margin-bottom: 20px;
}

/* --- Interactive Star Rating (input) --- */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	justify-content: flex-end;
	gap: 6px;
	margin-bottom: 25px;
}

.star-rating input {
	display: none;
}

.star-rating label {
	cursor: pointer;
	width: 36px;
	height: 36px;
}

.star-rating label img {
	width: 100%;
	filter: grayscale(100%) opacity(0.25);
	transition: filter 0.15s ease;
}

.star-rating label:hover img, .star-rating label:hover ~ label img,
	.star-rating input:checked ~ label img {
	filter: grayscale(0%) opacity(1);
}

.review-label {
	display: block;
	font-size: 11px;
	font-weight: 800;
	color: #1a1a1a;
	margin-bottom: 8px;
}

.review-textarea {
	width: 100%;
	display: block;
	height: 160px;
	background-color: #f5f5f5;
	border: none;
	border-radius: 20px;
	padding: 20px;
	outline: none;
	resize: none;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
	font-size: 14px;
}

.post-btn-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}

.post-btn {
	background-color: #52ba5a;
	color: white;
	border: none;
	padding: 15px 40px;
	border-radius: 50px;
	font-weight: 700;
	font-size: 14px;
	cursor: pointer;
}

/* --- Existing Review Cards --- */
.existing-review-card {
	background: #fff;
	border-radius: 20px;
	padding: 28px 30px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
	border: 1px solid #f0f0f0;
	margin-bottom: 20px;
	position: relative;
	overflow: hidden;
}

.review-top-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.reviewer-info {
	display: flex;
	align-items: center;
	gap: 12px;
}

.reviewer-avatar {
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background-color: #e0e0e0;
	overflow: hidden;
	flex-shrink: 0;
}

.reviewer-avatar img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.reviewer-meta {
	display: flex;
	flex-direction: column;
}

.reviewer-name {
	font-size: 14px;
	font-weight: 700;
	color: #1a1a1a;
}

.reviewer-date {
	font-size: 12px;
	color: #aaa;
	margin-top: 2px;
}

/* Display stars (static, showing rating) */
.display-stars {
	display: flex;
	gap: 3px;
}

.display-stars img {
	width: 20px;
	height: 20px;
}

.review-body {
	font-size: 14px;
	line-height: 1.7;
	color: #444;
	margin: 0;
}

.poster-img {
	width: 100%;
	border-radius: 12px;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<%@ include file="/components/navbar.jsp"%>

	<%-- Calculate average rating from reviews list --%>
	<c:set var="totalRating" value="0" />
	<c:set var="reviewCount" value="${fn:length(reviews)}" />
	<c:forEach var="r" items="${reviews}">
		<c:set var="totalRating" value="${totalRating + r.rating}" />
	</c:forEach>
	<c:set var="avgRating"
		value="${reviewCount > 0 ? (totalRating / reviewCount) * 2 : 0.0}" />

	<%-- Genre name mapping from genre_id --%>
	<c:set var="genreName" value="General" />
	<c:if test="${media.genreId == 1}">
		<c:set var="genreName" value="Action" />
	</c:if>
	<c:if test="${media.genreId == 2}">
		<c:set var="genreName" value="Comedy" />
	</c:if>
	<c:if test="${media.genreId == 3}">
		<c:set var="genreName" value="Horror" />
	</c:if>
	<c:if test="${media.genreId == 4}">
		<c:set var="genreName" value="Drama" />
	</c:if>
	<c:if test="${media.genreId == 5}">
		<c:set var="genreName" value="Sci-Fi" />
	</c:if>
	<c:if test="${media.genreId == 6}">
		<c:set var="genreName" value="Thriller" />
	</c:if>
	<c:if test="${media.genreId == 7}">
		<c:set var="genreName" value="Romance" />
	</c:if>

	<div class="container">
		<div class="left-content">

			<%-- Genre tag + date meta --%>
			<span class="genre-tag"> <c:choose>
					<c:when test="${media.genreId == 1}">Action</c:when>
					<c:when test="${media.genreId == 2}">Comedy</c:when>
					<c:when test="${media.genreId == 3}">Horror</c:when>
					<c:when test="${media.genreId == 4}">Drama</c:when>
					<c:when test="${media.genreId == 5}">Sci-Fi</c:when>
					<c:when test="${media.genreId == 6}">Thriller</c:when>
					<c:when test="${media.genreId == 7}">Romance</c:when>
					<c:otherwise>General</c:otherwise>
				</c:choose>
			</span>

			<p class="meta">${fn:substring(media.releaseDate, 0, 10)}
				&nbsp;•&nbsp; ${media.totalTime} &nbsp;•&nbsp; ${media.categoryId == 1 ? 'Movie' : 'Series'}
			</p>

			<h1 class="title">${media.title}</h1>

			<div class="bookmark-container">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<c:choose>
							<c:when test="${isBookmarked == true}">
								<form action="${pageContext.request.contextPath}/Bookmark"
									method="POST">
									<input type="hidden" name="media_id" value="${media.mediaId}">
									<input type="hidden" name="action" value="remove">
									<button type="submit" class="bookmark-btn remove-state">
										<img
											src="${pageContext.request.contextPath}/assets/icon/bookmark-solid-full.svg"
											alt="" class="btn-icon"> Remove Bookmark
									</button>
								</form>
							</c:when>
							<c:otherwise>
								<form action="${pageContext.request.contextPath}/Bookmark"
									method="POST">
									<input type="hidden" name="media_id" value="${media.mediaId}">
									<input type="hidden" name="action" value="add">
									<button type="submit" class="bookmark-btn">
										<img
											src="${pageContext.request.contextPath}/assets/icon/bookmark-solid-full.svg"
											alt="" class="btn-icon"> Add to Bookmark
									</button>
								</form>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<%-- Not logged in — clicking redirects to login --%>
						<a href="${pageContext.request.contextPath}/Login"
							style="text-decoration: none;">
							<button class="bookmark-btn">
								<img
									src="${pageContext.request.contextPath}/assets/icon/bookmark-solid-full.svg"
									alt="" class="btn-icon"> Add to Bookmark
							</button>
						</a>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="section-header">
				<span class="orange-line"></span>
				<h3>Synopsis</h3>
			</div>
			<p class="synopsis-text">${media.description}</p>

			<div class="separator"></div>

			<div class="director-label">Director</div>
			<div class="director-name">${media.director}</div>

			<div class="separator"></div>

			<div class="section-header">
				<span class="orange-line"></span>
				<h3>Reviews</h3>
			</div>

			<%-- Write Review Card --%>
			<div class="review-card">
				<h4>Add your review</h4>
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<form
							action="${pageContext.request.contextPath}/Media?id=${media.mediaId}"
							method="POST">
							<input type="hidden" name="media_id" value="${media.mediaId}">

							<div class="star-rating">
								<input type="radio" name="rating" id="star5" value="5" required>
								<label for="star5"><img
									src="${pageContext.request.contextPath}/assets/icon/star.svg"></label>
								<input type="radio" name="rating" id="star4" value="4">
								<label for="star4"><img
									src="${pageContext.request.contextPath}/assets/icon/star.svg"></label>
								<input type="radio" name="rating" id="star3" value="3">
								<label for="star3"><img
									src="${pageContext.request.contextPath}/assets/icon/star.svg"></label>
								<input type="radio" name="rating" id="star2" value="2">
								<label for="star2"><img
									src="${pageContext.request.contextPath}/assets/icon/star.svg"></label>
								<input type="radio" name="rating" id="star1" value="1">
								<label for="star1"><img
									src="${pageContext.request.contextPath}/assets/icon/star.svg"></label>
							</div>

							<label class="review-label">YOUR REVIEW</label>
							<textarea class="review-textarea" name="review_text"
								placeholder="Write your thoughts..." required></textarea>

							<div class="post-btn-container">
								<button type="submit" class="post-btn">POST REVIEW</button>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<p style="margin-top: 15px; color: #666;">
							<a href="${pageContext.request.contextPath}/Login"
								style="color: #449d5d; font-weight: bold; text-decoration: none;">Log
								in</a> to leave a review.
						</p>
					</c:otherwise>
				</c:choose>
			</div>

			<%-- Existing Reviews --%>
			<div style="margin-top: 30px;">
				<c:if test="${empty reviews}">
					<p style="color: #888;">No reviews yet. Be the first to review!</p>
				</c:if>

				<c:forEach var="review" items="${reviews}">
					<div class="existing-review-card">
						<div class="review-top-row">
							<div class="reviewer-info">
								<div class="reviewer-avatar">
									<img
										src="${pageContext.request.contextPath}/getimage?name=${review.username}&type=user"
										alt="${review.username}"
										onerror="this.parentElement.style.background='#ddd'; this.style.display='none'">
								</div>
								<div class="reviewer-meta">
									<span class="reviewer-name">${review.username}</span> <span
										class="reviewer-date"> <fmt:formatDate
											value="${review.createdAt}" pattern="MMM dd, yyyy" />
									</span>
								</div>
							</div>

							<%-- Display stars based on rating number --%>
							<div class="display-stars">
								<c:forEach begin="1" end="5" var="i">
									<c:choose>
										<c:when test="${i <= review.rating}">
											<img
												src="${pageContext.request.contextPath}/assets/icon/star.svg"
												style="width: 20px; filter: grayscale(0%) opacity(1);">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath}/assets/icon/star.svg"
												style="width: 20px; filter: grayscale(100%) opacity(0.25);">
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>

						<p class="review-body">${review.reviewText}</p>
					</div>
				</c:forEach>
			</div>

		</div>

		<div class="right-content">
			<div class="rating-box">
				<span class="rating-label">Rating</span> <span class="rating-score">★
					<c:choose>
						<c:when test="${reviewCount > 0}">
							<fmt:formatNumber value="${avgRating}" maxFractionDigits="1" />
						</c:when>
						<c:otherwise>0.0</c:otherwise>
					</c:choose> <span style="font-size: 12px; color: #888; font-weight: 400;">/10</span>
				</span>
			</div>

			<img
				src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
				alt="${media.title}" class="poster-img">
		</div>
	</div>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>