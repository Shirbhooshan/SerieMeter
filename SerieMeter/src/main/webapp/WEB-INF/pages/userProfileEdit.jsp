<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile | SerieMeter</title>

<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfileEdit.css">

<script src="${pageContext.request.contextPath}/javascript/userProfileEdit.js" defer></script>

</head>

<body>

    <%@ include file="/components/navbar.jsp"%>

    <main class="ep-page-wrapper">
        <form action="${pageContext.request.contextPath}/UserEdit"
              method="POST"
              enctype="multipart/form-data"
              class="ep-edit-form">

            <!-- Error message: shown when password is wrong or new passwords don't match -->
            <c:if test="${not empty error}">
                <p class="ep-msg-error" id="errorMsg"><c:out value="${error}" /></p>
            </c:if>

            <div class="ep-main-card">

                <div class="ep-left-panel">
                    <h2>Edit Profile</h2>

                    <div class="ep-photo-section">
                        <div class="ep-pic-wrapper">
                            <!-- Load user's uploaded picture or fall back to default -->
                            <c:choose>
                                <c:when test="${not empty user.userProfile}">
                                    <img src="${pageContext.request.contextPath}/getimage?name=${user.userProfile}&type=user"
                                         alt="Profile Picture"
                                         class="ep-profile-pic"
                                         id="ep-img-preview">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/images/default_profile.jpg"
                                         alt="Profile Picture"
                                         class="ep-profile-pic"
                                         id="ep-img-preview">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <button type="button"
                                class="ep-change-photo-btn"
                                onclick="document.getElementById('ep-file-input').click()">
                            Change Photo
                        </button>
                        <input type="file"
                               id="ep-file-input"
                               name="user_profile"
                               accept="image/*"
                               style="display: none;"
                               onchange="epPreviewImage(event)">
                    </div>

                    <div class="ep-input-group">
                        <label>Full Name</label>
                        <div class="ep-field-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/icon/user.svg"
                                 alt="" class="ep-field-icon">
                            <input type="text"
                                   name="full_name"
                                   placeholder="${user.fullName}">
                        </div>
                    </div>

                    <div class="ep-input-group">
                        <label>Username</label>
                        <div class="ep-field-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/icon/envelope.svg"
                                 alt="" class="ep-field-icon">
                            <input type="text"
                                   name="username"
                                   placeholder="${user.userName}">
                        </div>
                    </div>
                </div>

                <div class="ep-right-panel">

                    <h2>Password and<br>Security</h2>

                    <div class="ep-input-group">
                        <label>Current Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="current_password"
                                   id="ep-pass-cur">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 id="ep-eye-cur"
                                 onclick="epTogglePass('ep-pass-cur', 'ep-eye-cur')">
                        </div>
                    </div>

                    <div class="ep-input-group">
                        <label>New Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="new_password"
                                   id="ep-pass-new">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 id="ep-eye-new"
                                 onclick="epTogglePass('ep-pass-new', 'ep-eye-new')">
                        </div>
                    </div>

                    <div class="ep-input-group">
                        <label>Confirm New Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="confirm_password"
                                   id="ep-pass-conf">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 id="ep-eye-conf"
                                 onclick="epTogglePass('ep-pass-conf', 'ep-eye-conf')">
                        </div>
                    </div>

                </div>

            </div>

            <div class="ep-action-area">

                <button type="submit" class="ep-save-btn">Save Changes</button>

                <button type="button"
                        class="ep-go-back-btn"
                        onclick="history.back()">
                    <img src="${pageContext.request.contextPath}/assets/icon/left-arrow.svg"
                         alt="" style="width: 12px;">
                    <span class="ep-link-text">Go Back</span>
                </button>

            </div>

        </form>
    </main>

    <%@ include file="/components/footer.jsp"%>

</body>
</html>