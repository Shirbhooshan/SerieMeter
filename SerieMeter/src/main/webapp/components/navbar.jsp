<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Navbar</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/style.css" />

<style>
/* Profile pill shown when logged in */
.sm_navbar__profile {
	display: flex;
	align-items: center;
	gap: 8px;
	text-decoration: none;
	color: #1a1a1a;
	font-size: 13px;
	font-weight: 600;
}

.sm_navbar__profile_pic {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #e0e0e0;
}
</style>
</head>

<body>

	<nav class="sm_navbar">
		<a href="${pageContext.request.contextPath}/Explore"
			class="sm_navbar__logo"> <img src="assets/images/LogoBlack.jpg"
			alt="SerieMeter" />
		</a>

		<ul class="sm_navbar__nav">
			<li><a href="${pageContext.request.contextPath}/Explore">Explore</a></li>
			<li><a href="#">Movies</a></li>
			<li><a href="#">Series</a></li>
			<li><a href="${pageContext.request.contextPath}/About">About
					Us</a></li>
		</ul>

		<div class="sm_navbar__right">
			<!-- Wrap the search div in a form -->
			<form action="${pageContext.request.contextPath}/Search" method="GET"
				class="sm_navbar__search">
				<img src="assets/icon/search.svg" alt=""
					class="sm_navbar__search_icon" />

				<!-- 'name="query"' is the variable that will hold the input -->
				<input type="text" name="query"
					placeholder="Search for movies and series…" />

				<!-- Hidden submit button so 'Enter' works automatically -->
				<button type="submit" style="display: none;"></button>
			</form>

			<a href="${pageContext.request.contextPath}/Bookmark"
				class="sm_navbar__bookmark_btn"> <img
				src="assets/icon/bookmarkss.svg" alt="Bookmarks"
				class="sm_navbar__bookmark_icon" />
			</a>

			<%-- Show profile if logged in, Sign In button if not --%>
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="${pageContext.request.contextPath}/UserProfile"
						class="sm_navbar__profile"> <img
						src="${pageContext.request.contextPath}/getimage?name=${sessionScope.user.userName}&type=user"
						alt="Profile" class="sm_navbar__profile_pic"
						onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile.png'">
						${sessionScope.user.userName}
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/Register"
						class="sm_navbar__signup">Sign In</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

</body>
</html>