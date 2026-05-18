<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Seriemeter – Bookmarks</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookmark.css">
</head>
<body>

	<!-- Navbar component -->
	<%@ include file="/components/navbar.jsp"%>


	<!-- Page header -->
	<div class="sm_bm_header">
		<div>
			<p class="sm_bm_header_label">Personal Archive</p>
			<h1 class="sm_bm_header_title">Your Bookmarks</h1>
			<p class="sm_bm_header_sub">
				A curated collection of your saved titles.<br> Ready to be
				revisited at any moment.
			</p>
		</div>


		<!-- Clear all links to confirm-clear -->
		<c:if test="${not empty bookmarkList}">
			<a
				href="${pageContext.request.contextPath}/Bookmark?action=confirm-clear"
				class="sm_bm_clear_btn">Clear All</a>
		</c:if>
	</div>


	<!-- if no bookmarks then it is empty otherwise it shows the grid -->
	<c:choose>

		<c:when test="${empty bookmarkList}">

			<!-- Empty state shown until user adds bookmarks -->

			<div class="sm_bm_empty">
				<img class="sm_bm_empty_icon"
					src="${pageContext.request.contextPath}/assets/icon/bookmark_icon.svg"
					alt="No bookmarks" />
				<p class="sm_bm_empty_title">No bookmarks yet</p>
				<p class="sm_bm_empty_sub">Start exploring movies and series and
					save your favourites here.</p>
				<a href="${pageContext.request.contextPath}/Explore"
					class="sm_bm_explore_btn"> Explore Now </a>
			</div>
		</c:when>

		<c:otherwise>

			<!-- Bookmark cards grid -->

			<div class="sm_bm_grid">
				<c:forEach var="media" items="${bookmarkList}">
					<div class="sm_bm_card">

						<div class="sm_bm_card_poster">
							<a
								href="${pageContext.request.contextPath}/Media?id=${media.mediaId}">
								<img
								src="${pageContext.request.contextPath}/getimage?name=${media.mediaProfile}&type=media"
								alt="${media.title}" />
							</a>

							<!-- Remove links to confirm-remove with the media id -->
							<a
								href="${pageContext.request.contextPath}/Bookmark?action=confirm-remove&mediaId=${media.mediaId}"
								class="sm_bm_remove_btn" title="Remove bookmark"> <img
								src="${pageContext.request.contextPath}/assets/icon/heart.svg"
								alt="Remove" />
							</a>
						</div>

						<div class="sm_bm_card_info">
							<div>
								<div class="sm_bm_card_title">${media.title}</div>
								<div class="sm_bm_card_genre">${media.genreName}</div>
							</div>
							<div class="sm_bm_card_year">${fn:substring(media.releaseDate, 0, 4)}</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</c:otherwise>

	</c:choose>

	<!-- Confirmation popup which is shown or hidden by popupStyle set in Bookmark servlet -->
	<div class="sm_bm_overlay" style="${popupStyle}">

		<!-- Backdrop: clicking sends action=cancel which hides the popup -->
		<a href="${pageContext.request.contextPath}/Bookmark?action=cancel"
			class="sm_bm_backdrop"></a>

		<div class="sm_bm_popup">
			<img class="sm_bm_popup_icon"
				src="${pageContext.request.contextPath}/assets/icon/bookmark_icon.svg"
				alt="" />

			<!-- Clear all popup -->
			<c:if test="${popupType == 'clear'}">
				<p class="sm_bm_popup_title">Clear all bookmarks?</p>
				<p class="sm_bm_popup_sub">This will remove all your saved
					titles. This cannot be undone.</p>
				<div class="sm_bm_popup_btns">
					<!-- No — cancel goes back to normal page -->
					<a href="${pageContext.request.contextPath}/Bookmark?action=cancel"
						class="sm_bm_popup_no">No, keep them</a>
					<!-- Yes — posts clearAll action to doPost -->
					<form action="${pageContext.request.contextPath}/Bookmark"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="clearAll" />
						<button type="submit" class="sm_bm_popup_yes">Yes, clear
							all</button>
					</form>
				</div>
			</c:if>

			<!-- Remove one bookmark popup -->
			<c:if test="${popupType == 'remove'}">
				<p class="sm_bm_popup_title">Remove bookmark?</p>
				<p class="sm_bm_popup_sub">Are you sure you want to remove this
					title from your bookmarks?</p>
				<div class="sm_bm_popup_btns">
					<!-- No — cancel -->
					<a href="${pageContext.request.contextPath}/Bookmark?action=cancel"
						class="sm_bm_popup_no">No, keep it</a>
					<!-- Yes — posts remove with the pending media id -->
					<form action="${pageContext.request.contextPath}/Bookmark"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="remove" /> <input
							type="hidden" name="mediaId" value="${pendingMediaId}" />
						<button type="submit" class="sm_bm_popup_yes">Yes, remove</button>
					</form>
				</div>
			</c:if>
		</div>

	</div>

	<!-- Footer component -->
	<%@ include file="/components/footer.jsp"%>

</body>
</html>
