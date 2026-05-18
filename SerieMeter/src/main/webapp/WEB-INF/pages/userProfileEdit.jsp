<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile | SerieMeter</title>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* -- Base Reset -- */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Manrope', sans-serif;
        background-color: #ffffff;
        color: #28282B;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* --- Page Wrapper: flexible centering to avoid scrolling --- */
    .ep-page-wrapper {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center; 
        padding: 10px 24px;
    }

    /* --- Form wrapper stretches to near full width --- */
    .ep-edit-form {
        width: 100%;
        max-width: 1000px; /* Slightly narrower to match tighter vertical proportions */
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* Error message shown above the card */
    .ep-msg-error {
        color: #ff4d4d;
        font-size: 13px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 8px;
        transition: opacity 0.5s ease;
    }

    /* --- Outer dark card: stretches edge to edge, holds both panels --- */
    .ep-main-card {
        background-color: #28282B;
        border-radius: 24px;
        display: flex;
        align-items: stretch;
        width: 100%;
        padding: 8px 0 8px 8px; 
        gap: 0;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    }

    /* LEFT PANEL — Edit Profile
       Floats inside the dark card thanks to the card's padding. */
    .ep-left-panel {
        background-color: #F6F6F6;
        width: 46%;
        flex-shrink: 0;
        padding: 24px 32px;
        border-radius: 18px; 
        display: flex;
        flex-direction: column;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.12); 
    }

    /* "Edit Profile" heading */
    .ep-left-panel h2 {
        color: #D56E3F;
        font-size: 24px;   
        font-weight: 720;  
        margin-bottom: 16px;
        line-height: 1.2;
    }

    /* Profile photo section: centred column */
    .ep-photo-section {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 16px;
    }

    /* Green-bordered circle wrapper */
    .ep-pic-wrapper {
        width: 85px;
        height: 85px;
        border-radius: 50%;
        border: 1.5px solid #2EAB29;
        padding: 3px;
        margin-bottom: 10px;
    }

    /* Profile picture inside the circle */
    .ep-profile-pic {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
    }

    /* "Change Photo" pill button */
    .ep-change-photo-btn {
        background-color: #EBEBEB;
        border: 1px solid #D6D6D6;
        color: #919191;
        padding: 6px 16px;
        border-radius: 20px;
        font-size: 11px; 
        font-weight: 600;
        font-family: 'Manrope', sans-serif;
        cursor: pointer;
        transition: opacity 0.2s ease, transform 0.15s ease;
    }

    .ep-change-photo-btn:hover {
        opacity: 0.82;
        transform: translateY(-2px);
    }

    /* Input groups (label + field) */
    .ep-input-group {
        margin-bottom: 12px;
    }

    .ep-input-group label {
        display: block;
        font-size: 11px; 
        font-weight: 700;
        color: #28282B;
        text-transform: uppercase;
        letter-spacing: 0.6px;
        margin-bottom: 6px;
    }

    /* Wrapper gives us the anchor for the left icon */
    .ep-field-wrapper {
        position: relative;
        display: flex;
        align-items: center;
    }

    /* Icon sitting inside the left edge of the field */
    .ep-field-icon {
        position: absolute;
        left: 14px;
        width: 16px;
        height: 16px;
        pointer-events: none;
        filter: brightness(0);
		opacity: 0.45;
		margin-bottom: 6px;
    }

    /* Text inputs on the left panel */
    .ep-left-panel input[type="text"] {
        width: 100%;
        background-color: #EBEBEB;
        border: none;
        border-radius: 28px;
        padding: 10px 16px 10px 38px; 
        color: #28282B;
        font-size: 13px;
        font-family: 'Manrope', sans-serif;
        box-shadow: inset 0px 2px 4px rgba(135, 135, 135, 0.25);
        outline: none;
        margin-bottom: 8px;
    }

    .ep-left-panel input[type="text"]::placeholder {
        color: #808080;
    }

    /* RIGHT PANEL — Password and Security */
    .ep-right-panel {
        flex: 1;
        padding: 24px 38px;
        display: flex;
        flex-direction: column;
    }

    /* "Password and Security" heading */
    .ep-right-panel h2 {
        color: #ffffff;
        font-size: 24px;
        font-weight: 720;
        line-height: 1.2;
        margin-bottom: 38px; 
    }

    /* Labels in the right panel */
    .ep-right-panel label {
        display: block;
        font-size: 11px;
        font-weight: 700;
        color: #BEBEBE;
        text-transform: uppercase;
        letter-spacing: 0.6px;
        margin-bottom: 10px; 
    }

    /* Password input fields */
    .ep-right-panel input[type="password"],
    .ep-right-panel input[type="text"] {
        width: 100%;
        background-color: #EDEDED;
        border: none;
        border-radius: 28px;
        padding: 10px 36px 10px 20px; 
        color: #28282B;
        font-size: 13px;
        font-family: 'Manrope', sans-serif;
        outline: none;
        margin-bottom: 8px;
    }

    /* Eye icon on the right edge of password fields */
    .ep-eye-icon {
        position: absolute;
        right: 14px;
        width: 18px;
        height: 18px;
        cursor: pointer;
        margin-bottom: 8px;
    }

    .ep-eye-icon:hover {
        opacity: 1;
    }

    /* ACTION AREA — Save / Go Back */
    .ep-action-area {
        margin-top: 26px; 
        margin-bottom: 18px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px; 
    }

    /* Green "Save Changes" button */
    .ep-save-btn {
        background-color: #33A540;
        color: #ffffff;
        border: none;
        border-radius: 28px;
        padding: 10px 38px; 
        font-size: 14px;
        font-weight: 700;
        font-family: 'Manrope', sans-serif;
        cursor: pointer;
        transition: opacity 0.2s ease, transform 0.15s ease;
    }

    .ep-save-btn:hover {
        opacity: 0.82;
        transform: translateY(-2px);
    }

    /* "Go Back" button */
    .ep-go-back-btn {
        background: none;
        border: none;
        color: #535353;
        font-size: 13px; 
        font-weight: 600;
        font-family: 'Manrope', sans-serif;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: opacity 0.2s ease;
    }

    .ep-go-back-btn:hover {
        opacity: 0.75;
    }

    .ep-go-back-btn .ep-link-text {
        text-decoration: underline;
    }

    /* --- Responsive: media queries --- */

    /* Tablets and Small Laptops (1024px and below) */
    @media (max-width: 1024px) {
        .ep-edit-form {
            max-width: 900px;
        }
        .ep-left-panel, .ep-right-panel {
            padding: 24px;
        }
    }

    /* Mobile Devices (860px and below) */
    @media (max-width: 860px) {
        body {
            height: auto;
            overflow-y: visible; /* Allows vertical scroll if content exceeds screen height */
        }

        .ep-page-wrapper {
            padding: 20px 15px;
            align-items: flex-start; /* Ensure content starts at top to allow scrolling */
        }

        .ep-main-card {
            flex-direction: column;
            padding: 12px; /* Uniform padding when stacked */
            gap: 12px;
        }

        .ep-left-panel, .ep-right-panel {
            width: 100%;
            padding: 20px;
        }

        .ep-right-panel h2, .ep-left-panel h2 {
            margin-bottom: 20px;
            font-size: 22px;
        }

        .ep-action-area {
            margin-top: 20px;
            gap: 15px;
        }
    }

    /* Extra Small Devices (480px and below) */
    @media (max-width: 480px) {
        .ep-main-card {
            border-radius: 16px;
        }
        
        .ep-left-panel, .ep-right-panel {
            border-radius: 12px;
            padding: 16px;
        }

        .ep-left-panel h2, .ep-right-panel h2 {
            font-size: 20px;
        }

        .ep-pic-wrapper {
            width: 75px;
            height: 75px;
        }

        .ep-save-btn {
            width: 100%; /* Better touch target on small screens */
            padding: 12px;
        }
    }
</style>
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

    <script>
        // Toggle password field between hidden and visible
        // Also swaps the eye icon between eye.svg (hidden) and eye-black.svg (visible)
        function epTogglePass(inputId, iconId) {
            const field = document.getElementById(inputId);
            const icon  = document.getElementById(iconId);

            if (field.type === 'password') {
                field.type = 'text';
                icon.src = '${pageContext.request.contextPath}/assets/icon/eye-black.svg';
            } else {
                field.type = 'password';
                icon.src = '${pageContext.request.contextPath}/assets/icon/eye.svg';
            }
        }

        // Show a live preview of the selected profile image before uploading
        function epPreviewImage(event) {
            const file = event.target.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = function () {
                document.getElementById('ep-img-preview').src = reader.result;
            };
            reader.readAsDataURL(file);
        }

        // ---------- Auto-hide error message after 5 seconds ----------
        document.addEventListener("DOMContentLoaded", function () {
            const errorMsg = document.getElementById("errorMsg");

            if (errorMsg) {
                setTimeout(function () {
                    errorMsg.style.opacity = "0";
                    setTimeout(function () {
                        errorMsg.style.display = "none";
                    }, 500); // wait for fade transition to complete
                }, 5000);
            }
        });
    </script>

</body>
</html>