<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

     <!-- Ensures proper responsiveness on different screen sizes -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>User Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
</head>
<style>
    /* Reset default browser styles for consistency */
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Manrope', sans-serif;
    }
    body{
        font-family: 'Manrope', sans-serif;
        background-color: #F3F3F3;
        color: #333;
        min-height: 100vh;
    }
    /* Top section with background image (rectangle) */
    .sm-top-white-bg{
        width: 100%;
        background-image: url('assets/images/rectangle.png');
        background-size: cover;
    }
     /* Container for consistent spacing */
    .seriemeter-container{
        width: 100%;
        max-width: 100%;
        margin: 0 auto;
        padding: 0 20px
    }
     /* Header section (Welcome + Logout) */
    .sm-header{
        width: 100%;
        display: flex;
        align-items: center;
        padding: 20px 0;
        position: relative;
    }
    .sm-welcome-text{
        font-size: 64px;
        font-weight: bold;
        color: #599453;
        transform: translate(150%, 70%);/*Move elements 150% to the right of its width and 70% down*/
    }
     /* Logout button positioned to the right */
    .sm-logout-btn{
        margin-left: auto;
        padding: 10px 35px;
        background-color: #A54A44;
        color: white;
        text-decoration: none;
        border-radius: 32px;
        font-size: 14px;
        font-weight: bold;
    }
    /* Profile summary section (user info + stats) */
    .sm-profile-summary{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 30px;
        width: 100%;
        margin-bottom: 25px;
    }
    .sm-profile-header{
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .sm-avatar{
        width: 110px;
        height: 110px;
        border-radius: 50%;
        object-fit: cover;
        background-color: #e0e0e0;
    }
    .sm-user-name{
        font-size: 24px;
        font-weight: bold;
        color: #000000;
    }
      /* Email + copy icon */
    .sm-user-email{
        font-size: 14px;
        color: #616161;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .sm-copy-icon{
        font-size: 16px;
        cursor: pointer;
        height: 24px;
        width: 24px;
    }
    .sm-stats{
        display: flex;
        gap: 40px;
        text-align: right;
    }
    .sm-stat-item{
        display: flex;
        flex-direction: column;
    }
    .sm-stat-number{
        font-size: 48px;
        font-weight: bold;
        color: #2F2F2F;
    }
    .sm-stat-label{
        font-size: 12px;
        font-weight: bold;
        color: #8D8D8D;
        letter-spacing: 1px;
        margin-top: -5px;
    }
    /* Cards section (Bookmarks & Reviews) */
    .sm-content-cards{
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .sm-card{
        background-color: #fff;
        padding: 25px;
        border-radius: 12px;
        border: 1px solid #e0e0e0;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        min-height: 200px;
    }

     /* Card header (title + sort buttons) */
    .sm-card-header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .sm-card-header h3{
        font-size: 18px;
        font-weight: 600;
        color: #151515;
    }
    .sm-sort-options{
        display: flex;
        gap: 10px;
    }

     /* Sort buttons (Oldest/Newest) */
    .sm-sort-btn{
        padding: 8px 20px;
        border-radius: 20px;
        border: 1px solid #E0E0E0;
        background-color: #F8F9FA;
        font-size: 12px;
        cursor: pointer;
    }
    .sm-sort-btn.sm-active{
        background-color: #D9F1D7;
        color: #43A53A;
        border-color: #B1E6B0;
    }
    .sm-card-body{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    /* Empty state message */
    .sm-empty-message{
        font-size:16px;
        text-align: center;
    }
    .sm-empty-message a{
        color: #629AC4;
    }

     /* Footer section */
    .sm-footer{
        text-align: center;
        margin-top: 40px;
        padding-bottom: 20px;
    }
    .sm-discover-text{
        font-size: 18px;
        font-weight: 600;
        color: #151515;
        margin-bottom: 15px;
    }
    .sm-explore-btn{
        padding: 12px 35px;
        background-color: #008000;
        color: white;
        border: none;
        border-radius: 32px;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
    }
</style>

<body>
     <!-- Top section with background image -->
    <div class="sm-top-white-bg">
        <div class="seriemeter-container">

            <!-- Header with Welcome text and Logout button -->
            <header class="sm-header">
                <h1 class="sm-welcome-text">Welcome,</h1>

                <!-- Logout redirects to Login page -->
                <a href="${pageContext.request.contextPath}/Login" class="sm-logout-btn">Logout</a>
            </header>
            
            <!-- User profile summary section -->
            <section class="sm-profile-summary">
                <div class="sm-profile-header">
                    <img src="assets/images/userProfile.jpg" alt="User Avatar" class="sm-avatar">
                    <div class="sm-user-details">
                        <h2 class="sm-user-name">Alex Berg</h2>
                        <p class="sm-user-email">alex@gmail.com<img src="assets/icon/copy.svg" alt="Copy" class="sm-copy-icon"></p>
                    </div>
                </div>
                <div class="sm-stats">
                    <div class="sm-stat-item">
                        <span class="sm-stat-number">3</span>
                        <span class="sm-stat-label">BOOKMARKS</span>
                    </div>
                    <div class="sm-stat-item">
                        <span class="sm-stat-number">3</span>
                        <span class="sm-stat-label">REVIEWS</span>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- Main content (cards section) -->
    <main class="sm-main-content seriemeter-container">
        <section class="sm-content-cards">
            <div class="sm-card bookmarks-card">
                <div class="sm-card-header">
                    <h3>Bookmarks</h3>
                    <div class="sm-sort-options">
                        <button class="sm-sort-btn sm-active">Oldest</button>
                        <button class="sm-sort-btn">Newest</button>
                    </div>
                </div>
                <div class="sm-card-body">
                    <p class="sm-empty-message"><a href="#">Nothing bookmarked yet!!</a></p>
                </div>
            </div>

            <div class="sm-card reviews-card">
                <div class="sm-card-header">
                    <h3>Reviews</h3>
                    <div class="sm-sort-options">
                        <button class="sm-sort-btn sm-active">Oldest</button>
                        <button class="sm-sort-btn">Newest</button>
                    </div>
                </div>
                <div class="sm-card-body">
                    <p class="sm-empty-message"><a href="#">Nothing reviewed yet!!</a></p>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="sm-footer seriemeter-container">
        <p class="sm-discover-text">Discover more to<br>bookmark & review</p>
        <button class="sm-explore-btn">Explore now</button>
    </footer>

</body>
</html>