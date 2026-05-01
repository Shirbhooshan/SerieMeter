<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

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
</head>

<body>

	<!-- Navbar -->
	<nav class="sm_navbar">
		<a href="#" class="sm_navbar__logo"> <img
			src="assets/images/LogoBlack.jpg" alt="SerieMeter" />
		</a>

		<ul class="sm_navbar__nav">
			<li><a href="${pageContext.request.contextPath}/Explore">Explore</a></li>
			<li><a href="#">Movies</a></li>
			<li><a href="#">Series</a></li>
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
			</a> <a href="${pageContext.request.contextPath}/Login"
				class="sm_navbar__signup">Sign In</a>
		</div>
	</nav>

</body>
</html>