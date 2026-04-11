<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
:root {
	--nav-bg: #121212;
	--nav-gradient: linear-gradient(180deg, #1e1e1e 0%, #000000 100%);
	--accent-green: #38a346;
	--text-white: #ffffff;
	--text-gray: #b0b0b0;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: var(--nav-gradient);
    padding: 0 5%; 
    height: 65px; 
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
    border-bottom: 1px solid rgba(255,255,255,0.05); /* Very subtle bottom edge */
}

/* Logo Section */
.nav-logo {
	display: flex;
	align-items: center;
	text-decoration: none;
	gap: 10px;
}

.nav-logo img {
    height: 32px; 
    width: auto;
    display: block;
    mix-blend-mode: screen;
}

/* Center Navigation Links */
.nav-links {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 35px;
    list-style: none;
    margin: 0;
    padding: 0;
}

.nav-links a {
	text-decoration: none;
	color: var(--text-gray);
	font-size: 15px;
	font-weight: 500;
	transition: color 0.3s ease;
}

.nav-links a:hover {
	color: var(--text-white);
}

/* Right Auth Section */
.nav-auth {
	display: flex;
	align-items: center;
	gap: 25px;
}

.login-link {
	text-decoration: none;
	color: var(--text-white);
	font-size: 14px;
	font-weight: 500;
}

.signup-btn {
    background-color: var(--accent-green);
    color: var(--text-white);
    text-decoration: none;
    padding: 8px 24px; 
    border-radius: 50px;
    font-size: 13px; 
    font-weight: 600;
    transition: all 0.3s ease;
}

.signup-btn:hover {
	background-color: #45b353;
	transform: translateY(-2px);
}

/* Content spacer so the navbar doesn't overlap body content */
.nav-spacer {
	height: 80px;
}
</style>

<nav class="navbar">
	<a href="${pageContext.request.contextPath}/Home" class="nav-logo">
		<img src="assets/images/LogoBlack.jpg" alt="SerieMeter Logo">
	</a>

	<ul class="nav-links">
		<li><a href="explore.jsp">Explore</a></li>
		<li><a href="movies.jsp">Movies</a></li>
		<li><a href="series.jsp">Series</a></li>
		<li><a href="${pageContext.request.contextPath}/About">About
				Us</a></li>
	</ul>

	<div class="nav-auth">
		<a href="${pageContext.request.contextPath}/Login" class="login-link">Login</a>
		<a href="${pageContext.request.contextPath}/Register"
			class="signup-btn">Sign up</a>
	</div>
</nav>
<div class="nav-spacer"></div>