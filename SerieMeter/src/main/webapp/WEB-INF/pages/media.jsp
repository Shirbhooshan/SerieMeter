<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><%-- ${movie.name} --%> Movie Name | SerieMeter
</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

body {
	background-color: #fff;
	/* Replace with your background image path */
	background-image: url('assets/images/details-bg-accents.png');
	background-size: cover;
	background-position: center;
	min-height: 100vh;
	padding: 60px 8%;
}

.container {
	display: flex;
	gap: 80px;
	align-items: flex-start;
}

.left-content {
	flex: 2;
}

.right-content {
	flex: 1.2;
	position: sticky;
	top: 60px;
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
}

/* Wider Dark Rating Pill */
.rating-box {
	background: #333;
	color: white;
	padding: 22px 40px;
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 320px;
	margin-left: auto;
	margin-bottom: 50px;
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
	height: 160px;
	background-color: #f5f5f5;
	border: none;
	border-radius: 20px;
	padding: 20px;
	outline: none;
	resize: none;
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
	border-radius: 8px;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.15);
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


	<div class="container">
		<div class="left-content">
			<p class="meta">
				<%-- ${movie.year} --%>
				2024 &nbsp;•&nbsp;
				<%-- ${movie.genre} --%>
				[Genre]
			</p>
			<h1 class="title">
				<%-- ${movie.name} --%>
				Movie Name
			</h1>

			<div class="bookmark-container">
				<c:choose>
					<%-- We will set 'isBookmarked' in the Backend later --%>
					<c:when test="${isBookmarked == true}">
						<button class="bookmark-btn remove-state">
							<img src="assets/icon/bookmark.svg" alt="" class="btn-icon">
							Remove Bookmark
						</button>
					</c:when>
					<c:otherwise>
						<button class="bookmark-btn">
							<img src="assets/icon/bookmark.svg" alt="" class="btn-icon">
							Add to Bookmark
						</button>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="section-header">
				<span class="orange-line"></span>
				<h3>Synopsis</h3>
			</div>
			<p class="synopsis-text">
				<%-- ${movie.synopsis} --%>
				In the neon-lit metropolis of Lumina, Detective Kaito Ishikawa, a
				tormented soul haunted by past failures, navigates a labyrinth of
				deceit and technological marvels. When a brilliant AI inventor, Dr.
				Aris Thorne, is found dead in his lab, Kaito is thrust into a case
				that blurs the line between reality and simulation...
			</p>

			<div class="separator"></div>

			<div class="director-label">Director</div>
			<div class="director-name">
				<%-- ${movie.director} --%>
				[Name]
			</div>

			<div class="separator"></div>

			<div class="section-header">
				<span class="orange-line"></span>
				<h3>Reviews</h3>
			</div>

			<div class="review-card">
				<h4>Add your review</h4>

				<div class="star-rating">
					<input type="radio" name="rating" id="star5" value="5"><label
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
				<textarea class="review-textarea" name="user_review"></textarea>

				<div class="post-btn-container">
					<button type="submit" class="post-btn">POST REVIEW</button>
				</div>
			</div>
		</div>

		<div class="right-content">
			<div class="rating-box">
				<span class="rating-label">Rating</span> <span class="rating-score">★
					<%-- ${movie.rating} --%> 9.2 <span
					style="font-size: 12px; color: #888; font-weight: 400;">/10</span>
				</span>
			</div>

			<img src="<%-- ${movie.posterUrl} --%> assets/images/media_test.png"
				alt="Movie Poster" class="poster-img">
		</div>
	</div>
	
	<%@ include file="/components/footer.jsp"%>

</body>
</html>