<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Profile - Logged Out</title>

</head>

<body>
    <style>
    /* Global Container Styles */
    .seriemeter-profile-body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background-color: #ffffff;
        color: #1a1a1a;
        margin: 0;
    }

    .page-container {
        max-width: 1100px;
        margin: 50px auto;
        padding: 0 25px;
    }

    /* Top Hero Header */
    .hero-layout {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 70px;
    }

    .hero-main-info {
        display: flex;
        align-items: center;
        gap: 30px;
    }

    /* The main image on the top left */
    .hero-image {
        width: 170px;
        height: 170px;
        border-radius: 20px;
        object-fit: cover;
    }

    .hero-copy h1 {
        font-size: 45px;
        margin: 0 0 10px 0;
    }

    .green-text {
        color: #2eab4a;
    }

    .hero-copy p {
        color: #555;
        line-height: 26px;
        max-width: 450px;
        margin-bottom: 25px;
        font-size: 17px;
    }

    /* Standard Buttons */
    .btn {
        display: inline-block;
        padding: 12px 28px;
        font-weight: 600;
        text-decoration: none;
        border-radius: 25px;
    }

    .btn-green {
        background-color: #2eab4a;
        color: #ffffff;
    }

    .btn-black {
        background-color: #000000;
        color: #ffffff;
    }

    /* Stats Card Styling */
    .stats-group {
        display: flex;
        gap: 20px;
    }

    .stat-item {
        background-color: #fdf6f0; 
        border: 1px solid #e8ddd3;
        border-radius: 30px;
        padding: 30px;
        min-width: 140px;
        text-align: center;
    }

    .stat-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .stat-count {
        font-size: 48px;
        font-weight: 700;
        color: #a67c52;
    }

    .stat-lock {
        width: 20px;
        height: auto;
    }

    .stat-title {
        font-size: 13px;
        font-weight: 700;
        color: #a67c52;
        letter-spacing: 1px;
        margin-top: 5px;
    }

    /* Section Area Styling */
    .section-label {
        font-size: 26px;
        margin-bottom: 20px;
        font-weight: 600;
    }

    .blur-wrapper {
        position: relative;
        min-height: 350px;
        border-radius: 15px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 50px;
    }

    .blur-background {
        position: absolute;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: 1;
    }

    /* The white box floating over blurred content */
    .overlay-box {
        position: relative;
        z-index: 2;
        background: #ffffff;
        padding: 40px;
        border-radius: 20px;
        text-align: center;
        max-width: 350px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
    }

    .svg-icon-large {
        width: 50px;
        height: auto;
        margin-bottom: 15px;
    }

    /* For the reviews section which has no white box */
    .clear-overlay {
        position: relative;
        z-index: 2;
        text-align: center;
    }

    .lock-black-large {
        width: 65px;
        height: auto;
        margin-bottom: 15px;
    }
</style>

<div class="seriemeter-profile-body">
    <div class="page-container">
        
        <header class="hero-layout">
            <div class="hero-main-info">
                <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_images/blurred_userprofile.jpg" alt="Profile" class="hero-image">
                <div class="hero-copy">
                    <h1>Join the <span class="green-text">Circle</span></h1>
                    <p>Unlock your personal cinematic vault. Rate films, curate watchlists, and share your perspective.</p>
                    <a href="register.jsp" class="btn btn-green">Get Started</a>
                </div>
            </div>

            <div class="stats-group">
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">0</span>
                        <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_icons/brown_colored_lock_icon.svg" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">BOOKMARKS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">0</span>
                        <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_icons/brown_colored_lock_icon.svg" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">REVIEWS</div>
                </div>
            </div>
        </header>

        <h2 class="section-label">Bookmarked</h2>
        <div class="blur-wrapper">
            <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_images/blurred_movies_background.jpg" class="blur-background" alt="Preview">
            <div class="overlay-box">
                <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_icons/black_colored_bookmark_icon.svg" class="svg-icon-large" alt="Library">
                <h2>Build Your Library</h2>
                <p style="font-size: 16px; color: #666;">Create an account to keep track of every film you love and those you're yet to discover.</p>
                <a href="register.jsp" class="btn btn-black">Join the community</a>
            </div>
        </div>

        <h2 class="section-label">Reviews</h2>
        <div class="blur-wrapper" style="min-height: 280px;">
            <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_images/blurred_reviews.jpg" class="blur-background" alt="Preview">
            <div class="clear-overlay">
                <img src="${pageContext.request.contextPath}/assets/userprofile_loggedout_icons/blacked_colored_lock_icon.svg" class="lock-black-large" alt="Locked">
                <br>
                <a href="login.jsp" class="btn btn-black">Login to view reviews</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>

</body>
</html>