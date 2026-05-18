<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Bookmark - Logged Out</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookmarkLogOut.css">

</head>

<body>

	<%@ include file="/components/navbar.jsp"%>

	<div class="bm-body">
		<div class="bm-page-container">

			<div class="bm-main-layout">

				<div class="bm-left-side">

					<h1>
						Your Personal<br>
						<span class="bm-green-text">Archive</span>
					</h1>

					<p class="bm-subtitle">Keep track of every cinematic journey.
						Sign in to access your curated bookmarks across all your devices.</p>

					<div class="bm-btn-row">
						<a href="${pageContext.request.contextPath}/Login"
							class="bm-btn bm-btn-black"> <img
							src="${pageContext.request.contextPath}/assets/icon/login_white_icon.svg"
							alt="login logo" style="width: 18px; height: 18px;"> Login
							to View Bookmarks
						</a> <a href="${pageContext.request.contextPath}/Register"
							class="bm-btn bm-btn-green">Sign up</a>
					</div>

					<div class="bm-feature-note">
						<img
							src="${pageContext.request.contextPath}/assets/icon/cloud_icon.svg"
							alt="Cloud Sync"
							style="width: 26px; height: 26px; margin-bottom: 4px;"> <span
							class="bm-note-title">Cloud Sync</span> <span
							class="bm-note-desc">Access your lists from anywhere.</span>
					</div>

				</div>

				<div class="bm-right-card">

					<div class="bm-card-icon-circle">
						<img
							src="${pageContext.request.contextPath}/assets/icon/bookmark_icon.svg"
							alt="Bookmark">
					</div>

					<h2 class="bm-card-title">Empty Library</h2>
					<p class="bm-card-desc">Your collection is waiting for its
						first masterpiece. Discover films to start your archive.</p>

					<a href="${pageContext.request.contextPath}/Explore"
						class="bm-explore-link">Explore Trending</a>

				</div>

			</div>

		</div>
	</div>

	<%@ include file="/components/footer.jsp"%>

</body>
</html>