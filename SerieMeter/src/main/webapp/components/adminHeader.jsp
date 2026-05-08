<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty loggedInUser}">
	<div class="ad-profile-section">
		<div class="ad-profile-info">
			<p class="ad-profile-name">
				<c:out value="${loggedInUser.fullName}" />
			</p>
			<p class="ad-profile-email">
				<c:out value="${loggedInUser.email}" />
			</p>
		</div>
		<label for="pfp" class="ad-profile-pic-label"> <a
			href="${pageContext.request.contextPath}/User"> <img
				src="${pageContext.request.contextPath}/getimage?name=${loggedInUser.userName}&type=user"
				alt="Profile"
				style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover;"
				onerror="this.parentElement.style.display='none'">
		</a>
		</label>
	</div>
</c:if>