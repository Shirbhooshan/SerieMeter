<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Profile - Logged Out</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

    <style>
    /* Global Container Styles */
    .seriemeter-profile-body {
        font-family: 'Manrope', sans-serif;
        background-color: #ffffff;
        color: #1a1a1a;
        margin: 0;
    }

    /* Wide container with small side padding */
    .page-container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 0 30px;
    }

    /* Top Hero Header */
    .hero-layout {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 100px;
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
        font-size: 15px;
        text-decoration: none;
        border-radius: 25px;
        transition: opacity 0.2s ease, transform 0.15s ease;
    }

    .btn:hover {
        opacity: 0.82;
        transform: translateY(-2px);
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
        
    }

    .stat-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .stat-count {
        font-size: 58px;
        font-weight: 700;
        color: #a67c52;
        margin-left: 0;
    }

    .stat-lock {
        width: 20px;
        height: auto;
        margin-top: 5px;
        margin-right: auto;
        margin-left: 0;
    }

    .stat-title {
        font-size: 18px;
        font-weight: 700;
        color: #a67c52;
        margin-top: 5px;
        margin-right: auto;
        margin-left: 0;
    }

    /* Section spacing — consistent gap between all sections */
    .section-block {
        margin-bottom: 100px;
    }

    .section-label {
        font-size: 26px;
        margin-bottom: 18px;
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
    }

    /* Smaller height variant for the reviews blur wrapper */
    .blur-wrapper-reviews {
        min-height: 280px;
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
        padding: 40px;
        text-align: center;
        max-width: 300px;
    }

    /* Paragraph inside the overlay box */
    .overlay-box p {
        font-size: 16px;
        color: #2b2b2b;
        margin-bottom: 20px;
    }

    .svg-icon-large {
        width: 50px;
        height: auto;
        margin-bottom: 15px;
    }

    /* For the reviews section */
    .clear-overlay {
        position: relative;
        z-index: 2;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }

    .lock-black-large {
        width: 38px;
        height: auto;
    }
    </style>
</head>

<body>



<div class="seriemeter-profile-body">
    <div class="page-container">

        <!-- Hero Section -->
        <header class="hero-layout">
            <div class="hero-main-info">
                <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_images/blurred_userprofile.jpg" alt="Profile" class="hero-image">
                <div class="hero-copy">
                    <h1>Join the <span class="green-text">Circle</span></h1>
                    <p>Unlock your personal cinematic vault. Rate films, curate watchlists, and share your perspective.</p>
                    <a href="register.jsp" class="btn btn-green">Get Started</a>
                </div>
            </div>

            <!-- Locked stats shown to guests -->
            <div class="stats-group">
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">0</span>
                        <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_icons/brown_colored_lock_icon.svg" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">BOOKMARKS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">0</span>
                        <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_icons/brown_colored_lock_icon.svg" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">REVIEWS</div>
                </div>
            </div>
        </header>

        <!-- Bookmarked Section -->
        <div class="section-block">
            <h2 class="section-label">Bookmarked</h2>
            <div class="blur-wrapper">
                <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_images/blurred_movies_background.jpg" class="blur-background" alt="Preview">
                <div class="overlay-box">
                    <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_icons/black_colored_bookmark_icon.svg" class="svg-icon-large" alt="Library">
                    <h2>Build Your Library</h2>
                    <p>Create an account to keep track of every film you love and those you're yet to discover.</p>
                    <a href="register.jsp" class="btn btn-black">Join the community</a>
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="section-block">
            <h2 class="section-label">Reviews</h2>
            <div class="blur-wrapper blur-wrapper-reviews">
                <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_images/blurred_reviews.png" class="blur-background" alt="Preview">
                <!-- Lock icon and login button stacked using flexbox -->
                <div class="clear-overlay">
                    <img src="<%= request.getContextPath() %>/assets/userprofile_loggedout_icons/blacked_colored_lock_icon.svg" class="lock-black-large" alt="Locked">
                    <a href="login.jsp" class="btn btn-black">Login to view reviews</a>
                </div>
            </div>
        </div>

    </div>
</div>

<%-- <%@ include file="footer.jsp" %> --%> 

</body>
</html>