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
	color: #121212;
	font-size: 13px;
	font-weight: 600;
}

.sm_navbar__profile_pic {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	object-fit: cover;
}

:root {
	--nav-bg: #121212;
	--nav-gradient: linear-gradient(180deg, #1e1e1e 0%, #000000 100%);
	--accent-green: #38a346;
	--text-white: #ffffff;
	--text-gray: #b0b0b0;
}

.sm_navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: var(--nav-gradient);
	padding: 0 5%;
	height: 65px;
	position: sticky;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
	border-bottom: 1px solid rgba(255, 255, 255, 0.05);
	/* Very subtle bottom edge */
}

/* Logo wrapper */
.sm_navbar__logo {
	display: flex;
	align-items: center;
	text-decoration: none;
	gap: 10px;
}

/* Logo image */
.sm_navbar__logo img {
	height: 32px;
	width: auto;
	display: block;
	mix-blend-mode: screen;
}
</style>
</head>

<body>

	<nav class="sm_navbar">
		<a href="${pageContext.request.contextPath}/Explore"
			class="sm_navbar__logo"> <img src="assets/images/LogoBlack.jpg"
			alt="SerieMeter Logo">
		</a>

		<ul class="sm_navbar__nav">
			<li><a href="${pageContext.request.contextPath}/Explore">Explore</a></li>
			<li><a href="${pageContext.request.contextPath}/Movies">Movies</a></li>
			<li><a href="${pageContext.request.contextPath}/Series">Series</a></li>
			<li><a href="${pageContext.request.contextPath}/About">About
					Us</a></li>
		</ul>

		<div class="sm_navbar__right">
			<div class="sm_navbar__search">
				<img src="assets/icon/search.svg" alt=""
					class="sm_navbar__search_icon" /> <input type="text"
					placeholder="Search for movies and series…" />
			</div>

			<a href="${pageContext.request.contextPath}/Bookmark"
				class="sm_navbar__bookmark_btn"> <img
				src="assets/icon/bookmarkss.svg" alt="Bookmarks"
				class="sm_navbar__bookmark_icon" />
			</a>


			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="${pageContext.request.contextPath}/UserProfile"
						class="sm_navbar__profile"> <img
						src="${pageContext.request.contextPath}/getimage?name=${sessionScope.user.userName}&type=user"
						alt="Profile" class="sm_navbar__profile_pic"
						onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile.png'">
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/Login"
						class="sm_navbar__signup">Sign In</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	
</body>
</html>