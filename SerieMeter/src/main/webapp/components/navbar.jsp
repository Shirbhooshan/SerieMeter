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
	href="https://fonts.googleapis.com/css2?family=Manrope:wght=200..800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<style>
/* Color Palette Variables */
:root {
	--accent-orange: #E8824A;
	--nav-bg: #121212;
	--nav-gradient: linear-gradient(180deg, #1e1e1e 0%, #000000 100%);
	--accent-green: #38a346;
	--text-white: #ffffff;
	--text-gray: #b0b0b0;
}

/* Reset layout flow overrides from global stylesheet */
.sm_navbarnav {
	position: static !important;
	transform: none !important;
}

/* Base Navbar Styles & Background Details */
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
}

/* Logo Details */
.sm_navbarlogo {
	display: flex;
	align-items: center;
	text-decoration: none;
	gap: 10px;
}

.sm_navbarlogo img {
	height: 32px;
	width: auto;
	display: block;
	mix-blend-mode: screen;
}

/* Dashboard Link Specific Colors */
.sm_navbarnav li a.sm_navbardashboard {
	color: var(--accent-orange) !important;
	font-weight: 800 !important;
}

.sm_navbarnav li a.sm_navbardashboard:hover {
	color: #d4703e !important;
}

/* Profile Elements Styling */
.sm_navbarprofile {
	display: flex;
	align-items: center;
	gap: 8px;
	text-decoration: none;
	color: var(--text-white);
	font-size: 13px;
	font-weight: 600;
}

.sm_navbarprofile_pic {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #e0e0e0;
}

/* =========================================================
   DESKTOP ONLY POSITIONING 
   ========================================================= */
@media (min-width: 993px) {
	.sm_navbar {
		display: flex !important;
		justify-content: flex-start !important;
	}

	.sm_navbarnav {
		margin-left: 45px !important;
	}

	.sm_navbarright {
		margin-left: auto !important;
	}
}

/* =========================================================
   MEDIA TAGS RESPONSIVE HANDLING
   ========================================================= */
@media (max-width: 992px) {
	.sm_navbar {
		display: flex !important;       
		flex-direction: column !important;
		height: auto !important;       
		position: static !important;    
		padding: 16px 24px !important;
		gap: 16px !important;
		align-items: stretch !important;
	}

	.sm_navbarlogo {
		display: block !important;
		align-self: center !important;
		margin: 0 auto !important;
	}
	
	.sm_navbarlogo img {
		max-height: 28px !important;
		width: auto !important;
		display: block !important;
	}

	.sm_navbarnav {
		display: flex !important;       
		visibility: visible !important;
		justify-content: center !important;
		list-style: none !important;
		gap: 20px !important;
		overflow-x: auto !important;   
		padding-bottom: 6px !important;
		white-space: nowrap !important; 
		-webkit-overflow-scrolling: touch !important;
		width: 100% !important;
	}

	.sm_navbarnav::-webkit-scrollbar {
		height: 0px !important;
		background: transparent !important;
	}
	
	.sm_navbarnav li {
		display: inline-block !important;
	}

	.sm_navbarright {
		display: flex !important;
		width: 100% !important;
		justify-content: space-between !important;
		align-items: center !important;
		gap: 12px !important;
	}
	
	.sm_navbarright form {
		flex: 1 !important;
		display: block !important;
		margin: 0 !important;
	}
	
	.sm_navbarsearch {
		display: flex !important;
		align-items: center !important;
		width: 100% !important;
		max-width: 100% !important;
	}
	
	.sm_navbarsearch input {
		width: 100% !important;
	}
}

@media (max-width: 576px) {
	.sm_navbar {
		padding: 14px 16px !important;
		gap: 12px !important;
	}
	
	.sm_navbarnav {
		justify-content: flex-start !important; 
		gap: 16px !important;
		font-size: 14px !important;
	}

	.sm_navbarright {
		gap: 8px !important;
	}
	
	.sm_navbarprofile {
		font-size: 0 !important;
		gap: 0 !important;
	}
	
	.sm_navbarsignup {
		padding: 6px 14px !important;
		font-size: 12px !important;
		white-space: nowrap !important;
	}
}
</style>
</head>

<body>

	<nav class="sm_navbar">
		<a href="${pageContext.request.contextPath}/Explore"
			class="sm_navbarlogo"> <img src="assets/images/LogoBlack.jpg"
			alt="SerieMeter" />
		</a>

		<ul class="sm_navbarnav">
			<li><a href="${pageContext.request.contextPath}/Explore">Explore</a></li>
			<li><a href="${pageContext.request.contextPath}/Movies">Movies</a></li>
			<li><a href="${pageContext.request.contextPath}/Series">Series</a></li>
			<li><a href="${pageContext.request.contextPath}/About">About Us</a></li>
			<c:if
				test="${not empty sessionScope.user && sessionScope.user.role eq 'Admin'}">
				<li><a href="${pageContext.request.contextPath}/Dashboard"
					class="sm_navbardashboard">Dashboard</a></li>
			</c:if>
		</ul>

		<div class="sm_navbarright">
			<form action="${pageContext.request.contextPath}/Search" method="GET">
				<div class="sm_navbarsearch">
					<img src="assets/icon/search.svg" alt=""
						class="sm_navbarsearch_icon" /> <input type="text" name="query"
						placeholder="Search for movies and series…" value="${param.query}" />
				</div>
			</form>

			<a href="${pageContext.request.contextPath}/Randomize"
				class="sm_navbarbookmark_btn" title="Surprise me!"
				style="display: inline-flex; align-items: center; justify-content: center; width: 32px; height: 32px;">
				<img src="assets/icon/random-nav.svg" alt="Randomize"
				class="sm_navbarbookmark_icon" style="width: 20px; height: 20px;">
			</a> 
			
			<a href="${pageContext.request.contextPath}/Bookmark"
				class="sm_navbarbookmark_btn"> <img
				src="assets/icon/bookmarkss.svg" alt="Bookmarks"
				class="sm_navbarbookmark_icon" />
			</a>

			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="${pageContext.request.contextPath}/User"
						class="sm_navbarprofile"> <img
						src="${pageContext.request.contextPath}/getimage?name=${sessionScope.user.userName}&type=user"
						alt="Profile" class="sm_navbarprofile_pic"
						onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile_picture.png';">
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/Login"
						class="sm_navbarsignup">Sign In</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

</body>
</html>