<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users - Seriemeter</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminUsers.css" />

<script
	src="${pageContext.request.contextPath}/javascript/adminUsers.js"></script>
</head>
<body class="ad-body">

	<div class="ad-layout-container">

		<aside class="ad-sidebar">
			<div>
				<div class="ad-logo-container">
					<a href="${pageContext.request.contextPath}/Explore"> <img
						src="${pageContext.request.contextPath}/assets/images/LogoBlack.jpg"
						alt="Logo">
					</a>
				</div>
				<nav class="ad-nav-menu">
					<a href="${pageContext.request.contextPath}/Dashboard"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg"
						class="ad-nav-icon"> Dashboard
					</a> <a href="${pageContext.request.contextPath}/AdminContent"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg"
						class="ad-nav-icon"> Content Management
					</a> <a href="${pageContext.request.contextPath}/Edit"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/edit.svg"
						class="ad-nav-icon"> Edit
					</a> <a href="${pageContext.request.contextPath}/Report"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/report.svg"
						class="ad-nav-icon"> Report & Analytics
					</a> <a href="${pageContext.request.contextPath}/Feedback"
						class="ad-nav-item"> <img
						src="${pageContext.request.contextPath}/assets/icon/feedback.svg"
						class="ad-nav-icon"> Feedbacks
					</a> <a href="${pageContext.request.contextPath}/Users"
						class="ad-nav-item active"> <img
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

		<main class="ad-main-content">
			<header class="ad-top-header">
				<h2 class="ad-header-title">View Users</h2>

				<!-- Only render this section if a user session exists -->
				<%@ include file="/components/adminHeader.jsp"%>

			</header>

			<h1 class="ad-section-title">
				<span class="ad-text-orange">Connected</span> users
			</h1>
			<p class="ad-section-subtitle">View and search for all users
				here.</p>

			<!-- Toolbar: Pushes search to the right -->
			<div class="sm_admintoolbar">
				<form action="${pageContext.request.contextPath}/Users" method="GET"
					style="display: flex; align-items: center;">
					<div class="sm_adminsearch">
						<input type="text" name="search" placeholder="Search for users"
							value="${searchValue}" /> <img src="assets/icon/search.svg"
							alt="Search" />
					</div>
				</form>
			</div>

			<!-- Users Table -->
			<div class="ad-user-table-container">
				<table class="ad-user-table">
					<thead>
						<tr>
							<th>USER DETAILS</th>
							<th>NAME</th>
							<th>EMAIL ADDRESS</th>
							<th>TOTAL REVIEW</th>
							<th>ROLE</th>
							<!-- New column for approval status -->
							<th>STATUS</th>
						</tr>
					</thead>
					<tbody id="userTableBody">
						<c:choose>
							<c:when test="${empty users}">
								<tr>
									<td colspan="6"
										style="text-align: center; padding: 30px; color: #aaa;">
										No users found.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="u" items="${users}" varStatus="status">
									<tr>
										<td>
											<div class="ad-user-id-cell">
												<img
													src="${pageContext.request.contextPath}/getimage?name=${u.userName}&type=user"
													alt="avatar" class="ad-user-avatar-small"
													onerror="this.src='${pageContext.request.contextPath}/assets/images/default_profile.jpg'">
												<span>#${u.userId}</span>
											</div>
										</td>
										<td>
											<div class="ad-user-name-info">
												<span class="ad-username-bold">${u.fullName}</span> <span
													class="ad-username-gray">@${u.userName}</span>
											</div>
										</td>
										<td>${u.email}</td>
										<td>${reviewCounts[status.index]}</td>
										<td class="ad-user-role-text">${u.role}</td>

										<!-- Approval column:
										     If user is already approved, show a green badge.
										     If pending, show an Approve button that POSTs to the Users servlet. -->
										<td><c:choose>
												<c:when test="${u.approved}">
													<span class="ad-approved-badge">&#10003; Approved</span>
												</c:when>
												<c:otherwise>
													<form class="ad-approve-form"
														action="${pageContext.request.contextPath}/Users"
														method="post">
														<input type="hidden" name="action" value="approve">
														<input type="hidden" name="userId" value="${u.userId}">
														<button type="submit" class="ad-approve-btn">Approve</button>
													</form>
												</c:otherwise>
											</c:choose></td>

									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

				<!-- Load more button -->
				<div style="text-align: center; padding: 15px;">
					<button class="ad-btn-matched" id="loadMoreBtn">Load More
						Medias</button>
				</div>

			</div>
		</main>
	</div>

</body>
</html>
