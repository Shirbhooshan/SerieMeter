<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>${media.title} | SerieMeter</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<style>
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	min-height: 100vh;
	background-image: url('assets/images/Title Screen.jpg');
	background-size: cover;
	background-position: top right;
	background-attachment: scroll;
	background-color: #fff;
	overflow-x: hidden;
	font-family: 'Manrope';
	background-color: #fff;
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

/* Header Info */
.meta {
	color: #888;
	font-size: 13px;
	margin-bottom: 10px;
}

.title {
	font-size: 72px;
	font-weight: 800;
	line-height: 1;
	margin-bottom: 30px;
}

/* Bookmark Button States */
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

/* Red state for removing */
.bookmark-btn.remove-state {
	background-color: #e53935;
}

.btn-icon {
	width: 22px;
	height: 22px;
	filter: brightness(0) invert(1);
}

/* Wider Dark Rating Pill */
.rating-box {
	background: #333;
	background-filter: blur(10px);
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

/* Section Headings with Horizontal Line */
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

/* Director Section with Separator */
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

/* Review Card Adjustments */
.review-card {
	background: #fff;
	border-radius: 30px;
	padding: 40px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
	border: 1px solid #f0f0f0;
	overflow: hidden;
}

.review-card h4 {
	font-size: 15px;
	font-weight: 700;
	color: #444;
	margin-bottom: 10px;
}

.stars {
	color: #f9a825;
	font-size: 18px;
	margin-bottom: 25px;
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

.poster-img {
	width: 100%;
	border-radius: 12px;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.2);
}

/* Interactive Star Rating */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	/* Allows us to use the ~ sibling selector easily */
	justify-content: flex-end;
	gap: 8px;
	margin-bottom: 25px;
}

.star-rating input {
	display: none;
}

.star-rating label {
	cursor: pointer;
	width: 24px;
	height: 24px;
}

.star-rating label img {
	width: 100%;
	filter: grayscale(100%) opacity(0.3); /* Default "empty" state */
	transition: filter 0.2s ease;
}

/* Hover and Checked Logic: Fill previous stars */
.star-rating label:hover img, .star-rating label:hover ~ label img,
	.star-rating input:checked ~ label img {
	filter: grayscale(0%) opacity(1); /* "Filled" state */
}
</style>
</head>
<body>

	<%@ include file="/components/navbar.jsp"%>

	<%-- Calculate Average Rating --%>
	<c:set var="totalRating" value="0" />
	<c:set var="reviewCount" value="${reviews.size()}" />

	<c:forEach var="r" items="${reviews}">
		<c:set var="totalRating" value="${totalRating + r.rating}" />
	</c:forEach>

	<%-- Calculate average (Out of 5) and scale to 10 for the UI --%>
	<c:set var="avgRating"
		value="${reviewCount > 0 ? (totalRating / reviewCount) * 2 : 0.0}" />

	<div class="container">
		<div class="left-content">
			<p class="meta">
				<%-- Replaced static 2024 with dynamic database date --%>
				${media.releaseDate} &nbsp;•&nbsp;
				<%-- Placeholder for Genre, can update later --%>
				[Genre]
			</p>
			<h1 class="title">${media.title}</h1>

			<div class="bookmark-container">
				<c:choose>
					<%-- We will set 'isBookmarked' in the Backend later --%>
					<c:when test="${isBookmarked == true}">
						<button class="bookmark-btn remove-state">
							<img src="assets/icon/bookmark-solid-full.svg" alt=""
								class="btn-icon"> Remove Bookmark
						</button>
					</c:when>
					<c:otherwise>
						<button class="bookmark-btn">
							<img src="assets/icon/bookmark-solid-full.svg" alt=""
								class="btn-icon"> Add to Bookmark
						</button>
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

			<div class="review-card">
				<h4>Add your review</h4>

				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<form action="${pageContext.request.contextPath}/Media"
							method="POST" class="review-form">
							<!-- CRITICAL: Hidden input to pass media_id to the Servlet -->
							<input type="hidden" name="media_id" value="${media.mediaId}">

							<div class="star-rating">
								<input type="radio" name="rating" id="star5" value="5" required><label
									for="star5"><img src="assets/icon/star.svg"></label> <input
									type="radio" name="rating" id="star4" value="4"><label
									for="star4"><img src="assets/icon/star.svg"></label> <input
									type="radio" name="rating" id="star3" value="3"><label
									for="star3"><img src="assets/icon/star.svg"></label> <input
									type="radio" name="rating" id="star2" value="2"><label
									for="star2"><img src="assets/icon/star.svg"></label> <input
									type="radio" name="rating" id="star1" value="1"><label
									for="star1"><img src="assets/icon/star.svg"></label>
							</div>

							<label class="review-label">REVIEW</label>
							<!-- CRITICAL: Changed name to 'review_text' to match the Servlet -->
							<textarea class="review-textarea" name="review_text" required></textarea>

							<div class="post-btn-container">
								<button type="submit" class="post-btn">POST REVIEW</button>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<!-- Displayed to users who are not logged in -->
						<p style="margin-top: 15px; color: #666;">
							<a href="${pageContext.request.contextPath}/Login"
								style="color: #449d5d; font-weight: bold; text-decoration: none;">Log
								in</a> to leave a review.
						</p>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Loop to display existing reviews fetched from the database -->
			<div class="existing-reviews" style="margin-top: 40px;">
				<c:if test="${empty reviews}">
					<p style="color: #888;">No reviews yet. Be the first to review!</p>
				</c:if>

				<c:forEach var="review" items="${reviews}">
					<div class="review-card"
						style="margin-bottom: 20px; padding: 25px;">
						<div
							style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 5px;">
							<h4 style="margin: 0;">${review.username}</h4>
							<span style="color: #f9a825; font-size: 18px; font-weight: bold;">&#9733;
								${review.rating}/5</span>
						</div>
						<small style="color: #aaa; display: block; margin-bottom: 15px;">${review.createdAt}</small>
						<p style="margin: 0; line-height: 1.6; color: #555;">${review.reviewText}</p>
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