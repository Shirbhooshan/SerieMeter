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
    /* --- Base Reset --- */
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

    /* --- Page Wrapper: vertical breathing room above and below the card --- */
    .ep-page-wrapper {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        padding: 40px 24px 0 24px;
    }

    /* --- Form wrapper stretches to near full width --- */
    .ep-edit-form {
        width: 100%;
        max-width: 1200px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* --- Outer dark card: stretches edge to edge, holds both panels ---
       Internal padding creates the "floating" gap around the white left panel.
       Reduced padding so white panel expands closer to all dark card edges. */
    .ep-main-card {
        background-color: #28282B;
        border-radius: 28px;
        display: flex;
        align-items: stretch;
        width: 100%;
        padding: 14px 0 14px 14px; /* smaller padding = white panel sits closer to edges */
        gap: 0;
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.18);
        min-height: 580px;
    }

    /* LEFT PANEL — Edit Profile
       Floats inside the dark card thanks to the card's padding.
       Has its own border-radius on all four corners and a shadow.
       ================================================ */
    .ep-left-panel {
        background-color: #F6F6F6;
        width: 46%;
        flex-shrink: 0;
        padding: 50px 50px 50px 50px;
        border-radius: 20px; /* all corners rounded — looks elevated/floating */
        display: flex;
        flex-direction: column;
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.14); /* gives the floating appearance */
    }

    /* "Edit Profile" heading — same font size as right panel heading */
    .ep-left-panel h2 {
        color: #D56E3F;
        font-size: 42px;   
        font-weight: 720;  
        margin-bottom: 30px;
        line-height: 1.25;
    }

    /* Profile photo section: centred column */
    .ep-photo-section {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 35px;
    }

    /* Green-bordered circle wrapper */
    .ep-pic-wrapper {
        width: 160px;
        height: 160px;
        border-radius: 50%;
        border: 1.5px solid #2EAB29;
        padding: 4px;
        margin-bottom: 16px;
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
        padding: 9px 24px;
        border-radius: 20px;
        font-size: 13px;
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
        margin-bottom: 22px;
    }

    .ep-input-group label {
        display: block;
        font-size: 15px;
        font-weight: 700;
        color: #28282B;
        text-transform: uppercase;
        letter-spacing: 0.8px;
        margin-bottom: 10px;
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
        left: 18px;
        width: 20px;
        height: 20px;
        pointer-events: none;
    }

    /* Text inputs on the left panel */
    .ep-left-panel input[type="text"] {
        width: 100%;
        background-color: #EBEBEB;
        border: none;
        border-radius: 28px;
        padding: 16px 18px 16px 50px;
        color: #28282B;
        font-size: 15px;
        font-family: 'Manrope', sans-serif;
        /* Inner shadow: Y-2, Blur-4, color #878787 at 25% */
        box-shadow: inset 0px 2px 4px rgba(135, 135, 135, 0.25);
        outline: none;
    }

    .ep-left-panel input[type="text"]::placeholder {
        color: #808080;
    }

    /* RIGHT PANEL — Password and Security */
    .ep-right-panel {
        flex: 1;
        padding: 50px 55px 50px 50px;
        display: flex;
        flex-direction: column;
    }

    /* "Password and Security" heading — two lines, same size as left heading */
    .ep-right-panel h2 {
        color: #ffffff;
        font-size: 42px;
        font-weight: 720;
        line-height: 1.25;
        margin-bottom: 68px; /* controls how far down the first field label sits */
    }

    /* Labels in the right panel */
    .ep-right-panel label {
        display: block;
        font-size: 15px;
        font-weight: 700;
        color: #BEBEBE;
        text-transform: uppercase;
        letter-spacing: 0.9px;
        margin-bottom: 26px;
    }

    /* Password input fields */
    .ep-right-panel input[type="password"],
    .ep-right-panel input[type="text"] {
        width: 100%;
        background-color: #EDEDED;
        border: none;
        border-radius: 28px;
        padding: 16px 50px 16px 22px;
        color: #28282B;
        font-size: 15px;
        font-family: 'Manrope', sans-serif;
        outline: none;
    }

    /* Eye icon on the right edge of password fields */
    .ep-eye-icon {
        position: absolute;
        right: 18px;
        width: 22px;
        height: 22px;
        cursor: pointer;
        opacity: 0.75;
        transition: opacity 0.2s ease;
    }

    .ep-eye-icon:hover {
        opacity: 1;
    }

    /* ACTION AREA — Save / Go Back */
    .ep-action-area {
        margin-top: 50px;
        margin-bottom: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 50px; /* equal spacing between Save and Go Back */
    }

    /* Green "Save Changes" button */
    .ep-save-btn {
        background-color: #33A540;
        color: #ffffff;
        border: none;
        border-radius: 28px;
        padding: 15px 60px;
        font-size: 16px;
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
        font-size: 15px;
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

    /* --- Responsive: stack panels on small screens --- */
    @media (max-width: 860px) {
        .ep-main-card {
            flex-direction: column;
            padding: 20px;
            gap: 20px;
        }
        .ep-left-panel,
        .ep-right-panel {
            width: 100%;
        }
    }
</style>
</head>
<body>

    <%@ include file="/components/navbar.jsp"%>

    <main class="ep-page-wrapper">
        <form action="${pageContext.request.contextPath}/UserProfileEdit"
              method="POST"
              enctype="multipart/form-data"
              class="ep-edit-form">

            <div class="ep-main-card">

                <!-- Left Panel: Edit Profile (floats inside dark card) -->
                <div class="ep-left-panel">
                    <h2>Edit Profile</h2>

                    <!-- Profile picture section -->
                    <div class="ep-photo-section">
                        <div class="ep-pic-wrapper">
                            <%-- Load user's uploaded picture or fall back to default --%>
                            <c:choose>
                                <c:when test="${not empty user.userProfile}">
                                    <img src="${pageContext.request.contextPath}/getimage?name=${user.userProfile}&type=user"
                                         alt="Profile Picture"
                                         class="ep-profile-pic"
                                         id="ep-img-preview">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/images/default_profile.png"
                                         alt="Profile Picture"
                                         class="ep-profile-pic"
                                         id="ep-img-preview">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Hidden file input triggered by the button below -->
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

                    <!-- Full Name field -->
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

                    <!-- Username field -->
                    <div class="ep-input-group">
                        <label>Username</label>
                        <div class="ep-field-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/icon/at-sign.svg"
                                 alt="" class="ep-field-icon">
                            <input type="text"
                                   name="username"
                                   placeholder="${user.userName}">
                        </div>
                    </div>
                </div>

                <!-- Right Panel: Password and Security -->
                <div class="ep-right-panel">

                    <h2>Password and<br>Security</h2>

                    <!-- Current Password -->
                    <div class="ep-input-group">
                        <label>Current Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="current_password"
                                   id="ep-pass-cur">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 onclick="epTogglePass('ep-pass-cur')">
                        </div>
                    </div>

                    <!-- New Password -->
                    <div class="ep-input-group">
                        <label>New Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="new_password"
                                   id="ep-pass-new">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 onclick="epTogglePass('ep-pass-new')">
                        </div>
                    </div>

                    <!-- Confirm New Password -->
                    <div class="ep-input-group">
                        <label>Confirm New Password</label>
                        <div class="ep-field-wrapper">
                            <input type="password"
                                   name="confirm_password"
                                   id="ep-pass-conf">
                            <img src="${pageContext.request.contextPath}/assets/icon/eye.svg"
                                 alt="Show/Hide"
                                 class="ep-eye-icon"
                                 onclick="epTogglePass('ep-pass-conf')">
                        </div>
                    </div>

                </div>

            </div>

            <!-- ── Action Buttons: equal spacing above, between, and below ── -->
            <div class="ep-action-area">

                <!-- Save Changes: submits the form -->
                <button type="submit" class="ep-save-btn">Save Changes</button>

                <!-- Go Back: arrow is plain, only "Go Back" text is underlined -->
                <button type="button"
                        class="ep-go-back-btn"
                        onclick="history.back()">
                    <span>&larr;</span>
                    <span class="ep-link-text">Go Back</span>
                </button>

            </div>

        </form>
    </main>


    <%@ include file="/components/footer.jsp"%>

    <script>
        // Toggle password field between hidden and visible
        function epTogglePass(inputId) {
            const field = document.getElementById(inputId);
            field.type = (field.type === 'password') ? 'text' : 'password';
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
    </script>

</body>
</html>
