<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< HEAD
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit Medias – SerieMeter Admin</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />
=======
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Medias – SerieMeter Admin</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<style>
<<<<<<< HEAD
=======
.ad-body {
	font-family: 'Manrope', sans-serif;
	background-color: #010101;
	color: #ffffff;
	margin: 0;
	padding: 10px;
	height: 100vh;
	box-sizing: border-box;
	overflow: hidden;
}
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
/* Base reset */
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
=======
* {
	box-sizing: border-box;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
:root {
	--black: #0D0D0D;
	--white: #FFFFFF;
	--green: #38A346;
	--orange: #E8824A;
	--gray-100: #F5F5F5;
	--gray-200: #E8E8E8;
	--gray-400: #AAAAAA;
	--gray-600: #666666;
	--text: #1A1A1A;
	--sidebar-w: 280px;
=======
.ad-layout-container {
	display: flex;
	height: 100%;
	gap: 10px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
body {
	font-family: 'Manrope', sans-serif;
	background: var(--white);
	color: var(--text);
	min-height: 100vh;
	display: flex;
=======
/* Sidebar */
.ad-sidebar {
	width: 260px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 15px 5px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
a {
	text-decoration: none;
	color: inherit;
=======
.ad-logo-container {
	padding: 0 10px 50px 10px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
img {
	display: block;
=======
.ad-logo-container img {
	max-width: 190px;
	height: auto;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Sidebar — fixed on the left */
.sm_admin__sidebar {
	width: var(--sidebar-w);
	min-height: 100vh;
	background: var(--black);
	display: flex;
	flex-direction: column;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
=======
.ad-nav-menu {
	display: flex;
	flex-direction: column;
	gap: 15px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Logo section at top of sidebar */
.sm_admin__sidebar_logo {
	padding: 28px 28px 24px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
=======
.ad-nav-item {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 12px 15px;
	text-decoration: none;
	color: #ffffff;
	font-weight: 500;
	font-size: 13px;
	border-radius: 10px;
	transition: all 0.2s ease;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__sidebar_logo img {
	height: 36px;
	width: auto;
=======
.ad-nav-item.active {
	background-color: #4ebc57;
	color: #1a1a1a;
	opacity: 0.82;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Nav links list in sidebar */
.sm_admin__sidebar_nav {
	flex: 1;
	padding: 24px 16px;
	display: flex;
	flex-direction: column;
	gap: 6px;
=======
.ad-nav-item:not(.active):hover {
	background-color: rgba(255, 255, 255, 0.1);
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Single nav link */
.sm_admin__nav_item {
	display: flex;
	align-items: center;
	gap: 14px;
	padding: 12px 16px;
	border-radius: 10px;
	color: rgba(255, 255, 255, 0.6);
	font-size: 15px;
	font-weight: 500;
	transition: background 0.2s, color 0.2s;
	cursor: pointer;
=======
.ad-nav-icon {
	width: 18px;
	height: 18px;
	transition: filter 0.2s ease;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__nav_item:hover {
	background: rgba(255, 255, 255, 0.08);
	color: #ffffff;
=======
.ad-nav-item.active .ad-nav-icon {
	filter: brightness(0) saturate(100%);
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Green highlight for the currently active page */
.sm_admin__nav_item.active {
	background: var(--green);
	color: #ffffff;
=======
.ad-logout-container {
	padding: 0 5px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__nav_item img {
	width: 20px;
	height: 20px;
	filter: invert(1);
	opacity: 0.7;
=======
.ad-logout-btn {
	display: flex;
	align-items: center;
	gap: 12px;
	text-decoration: none;
	color: #ffffff;
	font-weight: 500;
	font-size: 13px;
	padding: 12px 15px;
	border-radius: 10px;
	transition: all 0.2s ease;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__nav_item.active img {
	opacity: 1;
=======
.ad-logout-btn:hover {
	background-color: #e75a55;
	color: #1a1a1a;
	opacity: 0.82;
	transform: translateY(-2px);
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Logout button pinned to bottom of sidebar */
.sm_admin__sidebar_logout {
	padding: 16px 16px 28px;
	border-top: 1px solid rgba(255, 255, 255, 0.08);
=======
.ad-logout-btn:hover .ad-nav-icon {
	filter: brightness(0) saturate(100%);
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__logout_btn {
	display: flex;
	align-items: center;
	gap: 14px;
	padding: 12px 16px;
	border-radius: 10px;
	color: rgba(255, 255, 255, 0.6);
	font-size: 15px;
	font-weight: 500;
	cursor: pointer;
	transition: color 0.2s;
	background: none;
	border: none;
	width: 100%;
	font-family: 'Manrope', sans-serif;
=======
/* Main White Box */
.ad-main-content {
	flex: 1;
	background-color: #ffffff;
	color: #1a1a1a;
	border-radius: 16px;
	padding: 20px 30px;
	display: flex;
	flex-direction: column;
	overflow: hidden;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__logout_btn:hover {
	color: #ffffff;
=======
/* Top header */
.ad-top-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__logout_btn img {
	width: 20px;
	height: 20px;
	filter: invert(1);
	opacity: 0.7;
=======
.ad-header-title {
	font-size: 16px;
	font-weight: 700;
	margin: 0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Main area — pushed right by sidebar width */
.sm_admin__main {
	margin-left: var(--sidebar-w);
	flex: 1;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background: var(--white);
=======
.ad-profile-section {
	display: flex;
	align-items: center;
	gap: 10px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Top bar: page title on left, user info on right */
.sm_admin__topbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 18px 36px;
	border-bottom: 1px solid var(--gray-200);
	background: var(--white);
=======
.ad-profile-info {
	text-align: right;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_title {
	font-size: 15px;
	font-weight: 600;
	color: var(--text);
=======
.ad-profile-name {
	font-weight: 700;
	font-size: 13px;
	margin: 0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_user {
	display: flex;
	align-items: center;
	gap: 12px;
=======
.ad-profile-email {
	font-size: 11px;
	color: #666666;
	margin: 0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_userinfo {
	text-align: right;
=======
.ad-profile-pic {
	width: 35px;
	height: 35px;
	background-color: #e0e0e0;
	border-radius: 50%;
	overflow: hidden;
	object-fit: cover;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_name {
	font-size: 14px;
	font-weight: 700;
	color: var(--text);
=======
/* Heading */
.ad-section-title {
	font-size: 28px;
	font-weight: 800;
	margin: 0;
	letter-spacing: -0.5px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_email {
	font-size: 12px;
	color: var(--gray-400);
=======
.ad-text-orange {
	color: #e37329;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Round avatar — profile pic loaded from backend later */
.sm_admin__topbar_avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: var(--gray-200);
	overflow: hidden;
=======
.ad-section-subtitle {
	font-size: 13px;
	color: #555555;
	margin: 0 0 15px 0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__topbar_avatar img {
	width: 100%;
	height: 100%;
	object-fit: cover;
=======
/* Controls */
.ad-controls {
	display: flex;
	justify-content: flex-end;
	gap: 8px;
	margin-bottom: 10px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* White content area */
.sm_admin__content {
	padding: 36px 36px 60px;
	flex: 1;
=======
.ad-search-wrapper {
	position: relative;
	display: flex;
	align-items: center;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Page heading "Edit Medias" */
.sm_admin__page_heading {
	margin-bottom: 28px;
=======
.ad-search-icon {
	position: absolute;
	right: 15px;
	width: 14px;
	height: 14px;
	opacity: 0.6;
	pointer-events: none;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__page_heading h1 {
	font-size: 42px;
	font-weight: 800;
	color: var(--text);
	line-height: 1.1;
=======
.ad-search-box {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 9px 32px 9px 15px;
	font-size: 12px;
	outline: none;
	width: 220px;
	font-family: 'Manrope', sans-serif;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* "Medias" word in orange */
.sm_admin__page_heading h1 span {
	color: var(--orange);
=======
.ad-sort-dropdown {
	border: 1px solid #dcdcdc;
	border-radius: 17px;
	padding: 8px 20px;
	font-size: 12px;
	color: #555;
	outline: none;
	font-family: 'Manrope', sans-serif;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__page_heading p {
	font-size: 14px;
	color: var(--gray-400);
	margin-top: 6px;
=======
/* Table */
.ad-table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Sort + Search row */
.sm_admin__toolbar {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	gap: 12px;
	margin-bottom: 24px;
=======
.ad-table th, .ad-table td {
	padding: 10px 8px;
	text-align: left;
	border-bottom: 1px solid #f2f2f2;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__sort_select {
	appearance: none;
	-webkit-appearance: none;
	background: var(--white);
	border: 1px solid var(--gray-200);
	border-radius: 20px;
	padding: 9px 36px 9px 16px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	color: var(--text);
	cursor: pointer;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6'%3E%3Cpath fill='%23888' d='M5 6L0 0h10z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 14px center;
=======
.ad-table th {
	font-weight: 600;
	color: #1a1a1a;
	font-size: 12px;
	border-bottom: 1px solid #e0e0e0;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__sort_select:focus {
	outline: none;
=======
.ad-table td {
	font-size: 12px;
	color: #555555;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__search {
	display: flex;
	align-items: center;
	border: 1px solid var(--gray-200);
	border-radius: 20px;
	padding: 9px 16px;
	gap: 8px;
	width: 260px;
	background: var(--white);
=======
/* Poster thumbnail */
.ad-cover-thumb {
	width: 40px;
	height: 56px;
	border-radius: 6px;
	background-color: #e8e8e8;
	object-fit: cover;
	display: block;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__search input {
	background: transparent;
	border: none;
	outline: none;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	color: var(--text);
	width: 100%;
=======
/* Edit button */
.ad-edit-btn {
	background-color: #4ebc57;
	color: #ffffff;
	border: none;
	border-radius: 6px;
	padding: 6px 14px;
	font-size: 11px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background 0.2s;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__search input::placeholder {
	color: var(--gray-400);
=======
.ad-edit-btn:hover {
	background-color: #3aa844;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__search img {
	width: 16px;
	height: 16px;
	opacity: 0.5;
=======
/* Empty state */
.ad-empty-state {
	text-align: center;
	padding: 40px 20px;
	color: #aaaaaa;
	font-size: 13px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
/* Table */
.sm_admin__table_wrap {
	width: 100%;
	overflow-x: auto;
=======
/* Pagination  */
.ad-pagination {
	margin-top: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 12px;
	padding-top: 15px;
	font-size: 12px;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__table {
	width: 100%;
	border-collapse: collapse;
=======
.ad-page-num {
	color: #888888;
	text-decoration: none;
	cursor: pointer;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}

<<<<<<< HEAD
.sm_admin__table thead tr {
	border-bottom: 2px solid var(--gray-200);
}

.sm_admin__table th {
	text-align: left;
	font-size: 13px;
	font-weight: 700;
	color: var(--text);
	padding: 12px 16px;
}

.sm_admin__table tbody tr {
	border-bottom: 1px solid var(--gray-100);
	transition: background 0.15s;
}

.sm_admin__table tbody tr:hover {
	background: var(--gray-100);
}

.sm_admin__table td {
	padding: 16px 16px;
	font-size: 13px;
	color: var(--gray-600);
	/* Taller rows to give poster more breathing room */
	vertical-align: middle;
}

/* Poster thumbnail — bigger than before so it's actually visible */
.sm_admin__cover_thumb {
	width: 70px;
	height: 100px;
	border-radius: 8px;
	background: var(--gray-200);
	object-fit: cover;
	display: block;
}

/* Only Edit button — no delete */
.sm_admin__btn_edit {
	background: var(--green);
	color: #fff;
	border: none;
	border-radius: 6px;
	padding: 8px 20px;
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	cursor: pointer;
	transition: background 0.2s;
	text-decoration: none;
	display: inline-block;
}

.sm_admin__btn_edit:hover {
	background: #2e9448;
}

/* Empty state message — shown when no data from backend yet */
.sm_admin__empty_state {
	text-align: center;
	padding: 60px 20px;
	color: var(--gray-400);
	font-size: 14px;
}

/* Pagination */
.sm_admin__pagination {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
	margin-top: 40px;
}

.sm_admin__page_btn {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 1px solid var(--gray-200);
	background: var(--white);
	font-size: 13px;
	font-family: 'Manrope', sans-serif;
	font-weight: 600;
	color: var(--text);
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: background 0.15s, color 0.15s;
}

.sm_admin__page_btn:hover {
	background: var(--gray-100);
}

.sm_admin__page_btn.active {
	background: var(--text);
	color: var(--white);
	border-color: var(--text);
}

.sm_admin__page_arrow {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 1px solid var(--gray-200);
	background: var(--white);
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: background 0.15s;
}

.sm_admin__page_arrow:hover {
	background: var(--gray-100);
}

.sm_admin__page_arrow img {
	width: 14px;
	height: 14px;
	opacity: 0.6;
=======
.ad-page-num.active {
	color: #1a1a1a;
	background-color: #f0f0f0;
	width: 24px;
	height: 24px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	font-weight: 700;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
}
</style>
</head>

<body class="ad-body">
	<div class="ad-layout-container">

<<<<<<< HEAD
	<!-- Sidebar -->
	<aside class="sm_admin__sidebar">
=======
		<!-- Sidebar -->
		<aside class="ad-sidebar">
			<div>
				<div class="ad-logo-container">
					<img
						src="${pageContext.request.contextPath}/assets/images/LogoBlack.jpg"
						alt="Logo">
				</div>
				<nav class="ad-nav-menu">
					<a href="${pageContext.request.contextPath}/AdminBoard"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> Dashboard
					</a> <a href="${pageContext.request.contextPath}/AdminContent"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> Content Management
					</a>
					
					<a href="${pageContext.request.contextPath}/Edit"
						class="ad-nav-item active"> <img
						src="${pageContext.request.contextPath}/assets/icon/edit.svg"
						class="ad-nav-icon"> Edit
					</a> <a href="#" class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/users-ad-icon.svg"
						class="ad-nav-icon"> Users
					</a>
				</nav>
			</div>
			<div class="ad-logout-container">
				<a href="${pageContext.request.contextPath}/Logout"
					class="ad-logout-btn"> <img
					src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg"
					class="ad-nav-icon"> Logout
				</a>
			</div>
		</aside>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		<div class="sm_admin__sidebar_logo">
			<a href="#"> <img src="assets/images/LogoBlack.jpg"
				alt="SerieMeter" />
			</a>
		</div>
=======
		<!-- Main White Box -->
		<main class="ad-main-content">
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		<nav class="sm_admin__sidebar_nav">
=======
			
			<header class="ad-top-header">
				<h2 class="ad-header-title">Edit medias</h2>
				<div class="ad-profile-section">
					<div class="ad-profile-info">
						
						<p class="ad-profile-name">${sessionScope.user.fullName}</p>
						<p class="ad-profile-email">${sessionScope.user.email}</p>
					</div>
					<img
						src="${pageContext.request.contextPath}/assets/images/${sessionScope.user.userProfile}"
						class="ad-profile-pic" alt="Profile"
						onerror="this.style.display='none'" />
				</div>
			</header>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
			<a href="${pageContext.request.contextPath}/AdminDashboard"
				class="sm_admin__nav_item"> <img src="assets/icon/dashboard.svg"
				alt="" /> Dashboard
			</a> <a href="${pageContext.request.contextPath}/AdminDashboard"
				class="sm_admin__nav_item"> <img src="assets/icon/clapper.svg"
				alt="" /> Content Management
			</a>
=======
			<h1 class="ad-section-title">
				Edit <span class="ad-text-orange">Medias</span>
			</h1>
			<p class="ad-section-subtitle">Update media details here</p>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
			<!-- Edit is active on this page -->
			<a href="${pageContext.request.contextPath}/Edit"
				class="sm_admin__nav_item active"> <img
				src="assets/icon/edit.svg" alt="" /> Edit
			</a> <a href="#" class="sm_admin__nav_item"> <img
				src="assets/icon/users.svg" alt="" /> Users
			</a>
=======
			<!-- Sort + Search -->
			<div class="ad-controls">
				<select class="ad-sort-dropdown">
					<option>Sort by Date</option>
					<option>Sort by Name</option>
					<option>Sort by Category</option>
				</select>
				<div class="ad-search-wrapper">
					<img
						src="${pageContext.request.contextPath}/assets/icon/search.svg"
						class="ad-search-icon" alt="Search"> <input type="text"
						id="searchInput" class="ad-search-box"
						placeholder="Search for medias" onkeyup="filterTable()">
				</div>
			</div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		</nav>
=======
			<!-- Media Table -->
			<table class="ad-table" id="mediaTable">
				<thead>
					<tr>
						<th style="width: 40px">ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Genre</th>
						<th>Release Date</th>
						<th style="width: 70px">Cover</th>
						<th style="width: 70px">Action</th>
					</tr>
				</thead>
				<tbody id="tableBody">
					
					<c:forEach var="media" items="${mediaList}">
						<tr>
							<td>${media.mediaId}</td>
							<td>${media.title}</td>
							<td>${media.categoryId == 1 ? 'Movie' : 'Series'}</td>
							<td>${media.genreId}</td>
							<td>${media.releaseDate}</td>
							<td><c:choose>
									<c:when test="${not empty media.mediaProfile}">
										<img class="ad-cover-thumb"
											src="${pageContext.request.contextPath}/assets/images/${media.mediaProfile}"
											alt="${media.title}" />
									</c:when>
									<c:otherwise>
										<div class="ad-cover-thumb"></div>
									</c:otherwise>
								</c:choose></td>
							<td>
								<!-- Links to /Edit?id=X so servlet loads that media for the form  --> 
								<a
								href="${pageContext.request.contextPath}/Edit?id=${media.mediaId}"
								class="ad-edit-btn">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
		<div class="sm_admin__sidebar_logout">
			<a href="${pageContext.request.contextPath}/Login"
				class="sm_admin__logout_btn"> <img
				src="assets/icon/login_icon.svg" alt="" /> Logout
			</a>
		</div>
=======
			<%-- Empty state — shown by JS when no rows exist --%>
			<div class="ad-empty-state" id="emptyState" style="display: none;">
				No media entries yet. Add media from Content Management.</div>
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
	</aside>
=======
			<!-- Pagination -->
			<div class="ad-pagination">
                <a href="#" class="ad-page-num">&lt;</a>
                <a href="#" class="ad-page-num active">1</a>
                <a href="#" class="ad-page-num">2</a>
                <a href="#" class="ad-page-num">3</a>
                <a href="#" class="ad-page-num">&gt;</a>

		</main>
	</div>

	<script>
    var rowsPerPage = 4;
    var currentPage = 1;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

    /* Run on load — check empty state and set up pagination */
    window.onload = function() {
        checkEmpty();
        updateDisplay();
    };

<<<<<<< HEAD
	<!-- Main content -->
	<div class="sm_admin__main">

		<!-- Top bar -->
		<div class="sm_admin__topbar">
			<span class="sm_admin__topbar_title">Edit medias</span>

			<!-- User info — will be replaced by session data in backend -->
			<div class="sm_admin__topbar_user">
				<div class="sm_admin__topbar_userinfo">
					<%-- Backend: replace with session attribute e.g. ${sessionScope.user.firstName} --%>
					<div class="sm_admin__topbar_name">Admin</div>
					<div class="sm_admin__topbar_email">admin@seriemeter.com</div>
				</div>
				<div class="sm_admin__topbar_avatar">
					<%-- Backend: replace src with ${sessionScope.user.profileImage} --%>
					<img src="assets/images/profile_image.png" alt="User"
						onerror="this.style.display='none'" />
				</div>
			</div>
		</div>


		<!-- Page content -->
		<div class="sm_admin__content">

			<div class="sm_admin__page_heading">
				<h1>
					Edit <span>Medias</span>
				</h1>
				<p>Update media details here</p>
			</div>

			<!-- Sort + Search toolbar -->
			<div class="sm_admin__toolbar">
				<select class="sm_admin__sort_select"
					onchange="sortTable(this.value)">
					<option value="date">Sort by Date</option>
					<option value="name">Sort by Name</option>
					<option value="category">Sort by Category</option>
				</select>

				<div class="sm_admin__search">
					<input type="text" placeholder="Search for medias" id="searchInput"
						onkeyup="filterTable()" /> <img src="assets/icon/search.svg"
						alt="Search" />
				</div>
			</div>

			<!-- Table -->
			<div class="sm_admin__table_wrap">
				<table class="sm_admin__table" id="mediaTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Category</th>
							<th>Genre</th>
							<th>Added Date</th>
							<th>Cover Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tableBody">


					</tbody>
				</table>

				<%-- Show this message when the table has no rows --%>
				<div class="sm_admin__empty_state" id="emptyState">No media
					entries yet. Add media from Content Management.</div>

			</div>


			<!-- Pagination -->
			<div class="sm_admin__pagination">
				<button class="sm_admin__page_arrow" onclick="changePage(-1)">
					<img src="assets/icon/arrow-left.svg" alt="Previous" />
				</button>

				<button class="sm_admin__page_btn active" onclick="setPage(1)">1</button>
				<button class="sm_admin__page_btn" onclick="setPage(2)">2</button>
				<button class="sm_admin__page_btn" onclick="setPage(3)">3</button>

				<button class="sm_admin__page_arrow" onclick="changePage(1)">
					<img src="assets/icon/arrow-right.svg" alt="Next" />
				</button>
			</div>

		</div>
	</div>


	<script>

  /* How many rows to show per page */
  var rowsPerPage = 4;
  var currentPage = 1;

  /* Run on load — sets up pagination based on actual rows */
  window.onload = function() {
    updateDisplay();
    checkEmpty();
  };

  /* Hide/show empty state message */
  function checkEmpty() {
    var rows = document.querySelectorAll('#tableBody tr');
    var emptyState = document.getElementById('emptyState');
    if (rows.length === 0) {
      emptyState.style.display = 'block';
    } else {
      emptyState.style.display = 'none';
=======
    /* Show empty state message if no rows in table */
    function checkEmpty() {
        var rows = document.querySelectorAll('#tableBody tr');
        document.getElementById('emptyState').style.display = rows.length === 0 ? 'block' : 'none';
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
    }

    /* Show only rows for current page, hides the rest */
    function updateDisplay() {
        var rows = document.querySelectorAll('#tableBody tr');
        var start = (currentPage - 1) * rowsPerPage;
        var end   = start + rowsPerPage;

        rows.forEach(function(row, i) {
            row.style.display = (i >= start && i < end) ? '' : 'none';
        });

        rebuildPageNumbers(rows.length);
    }

    
</script>

</body>
</html>
<<<<<<< HEAD
=======

>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
