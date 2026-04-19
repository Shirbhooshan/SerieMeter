<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body{
        font-family: 'manrope', sans-serif;
        background-color: #F3F3F3;
        color: #333;
        min-height: 100vh; /*It ensures the container takes at least the full viewport height */
    }
    .top-white-bg{
        background-color: white;
        width: 100%;
    }
    .seriemeter-container{
        width: 100%;
        max-width: 100%;
        margin: 0 auto;
        padding: 0 20px; /* Keeps content from touching edges on small screens */
    }
    /* Header Style */
    .header{
        width: 100%;
        display: flex;
        align-items: center;
        padding: 20px 0;
        background-color: white;
        position: relative;
    }
    .welcome-text{
        font-size: 64px;
        font-weight: bold;
        color: #599453;
        transform: translate(150%, 70%);
    }
    .logout-btn{
        margin-left: auto;
        padding: 10px 35px;
        background-color: #A54A44;
        color: white;
        text-decoration: none;
        border-radius: 32px;
        font-size: 14px;
        font-weight: bold;
    }
    /* Profile Summary Styles */
    .profile-summary{
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 30px;
        width: 100%;
        margin-bottom: 25px;
    }
    .profile-header{
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .avatar{
        width: 110px;
        height: 110px;
        border-radius: 50%;
        object-fit: cover;
        background-color: #e0e0e0;
    }
    .user-name{
        font-size: 24px;
        font-family: bold;
        color: #000000;
    }
    .user-email{
        font-size: 14px;
        color: #616161;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .copy-icon{
        font-size: 16px;
        cursor: pointer;
        height: 24px;
        width: 24px;
    }
    .stats{
        display: flex;
        gap: 40px;
        text-align: right;
    }
    .stat-item{
        display: flex;
        flex-direction: column;
    }
    .stat-number{
        font-size: 48px;
        font-weight: bold;
        color: #2F2F2F;
    }
    .stat-label{
        font-size: 12px;
        font-weight: bold;
        color: #8D8D8D;
        letter-spacing: 1px;
        margin-top: -5px;
    }
    /* Content Cards Styles */
    .content-cards{
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .card{
        background-color: #fff;
        padding: 25px;
        border-radius: 12px;
        border: 1px solid #e0e0e0;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        min-height: 200px;
    }
    .card-header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .card-header h3{
        font-size: 18px;
        font-weight: 600;
        color: #151515;
    }
    .sort-options{
        display: flex;
        gap: 10px;
    }
    .sort-btn{
        padding: 8px 20px;
        border-radius: 20px;
        border: 1px solid #E0E0E0;
        background-color: #F8F9FA;
        font-size: 12px;
        cursor: pointer;
    }
    .sort-btn.active{
        background-color: #D9F1D7;
        color: #43A53A;
        border-color: #B1E6B0;
    }
    .card-body{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }
    .empty-message{
        font-size:16px;
        text-align: center;
    }
    .empty-message a{
        color: #629AC4;
    }
    /* Footer Styles */
    .footer{
        text-align: center;
        margin-top: 40px;
        padding-bottom: 20px;
    }
    .discover-text{
        font-size: 18px;
        font-weight: 600;
        color: #151515;
        margin-bottom: 15px;
    }
    .explore-btn{
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
    <div class="top-white-bg">
        <div class="seriemeter-container">
            <header class="header">
                <h1 class="welcome-text">Welcome,</h1>
                <a href="login.jsp" class="logout-btn">Logout</a>
            </header>

            <section class="profile-summary">
                <div class="profile-header">
                    <img src="assets/images/userProfile.jpg" alt="User Avatar" class="avatar">
                    <div class="user-details">
                        <h2 class="user-name"><span style="color: #B84A4A;">@</span>Alex Gol. Berg</h2>
                        <p class="user-email">alex@gmail.com<img src="assets/icon/copy.svg" alt="Copy" class="copy-icon"></p>
                    </div>
                </div>
                <div class="stats">
                    <div class="stat-item">
                        <span class="stat-number">3</span>
                        <span class="stat-label">BOOKMARKS</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">3</span>
                        <span class="stat-label">REVIEWS</span>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <main class="main-content seriemeter-container">
        <section class="content-cards">
            <div class="card bookmarks-card">
                <div class="card-header">
                    <h3>Bookmarks</h3>
                    <div class="sort-options">
                        <button class="sort-btn active">Oldest</button>
                        <button class="sort-btn">Newest</button>
                    </div>
                </div>
                <div class="card-body">
                    <p class="empty-message"><a href="#">Nothing bookmarked yet!!</a></p>
                </div>
            </div>

            <div class="card reviews-card">
                <div class="card-header">
                    <h3>Reviews</h3>
                    <div class="sort-options">
                        <button class="sort-btn active">Oldest</button>
                        <button class="sort-btn">Newest</button>
                    </div>
                </div>
                <div class="card-body">
                    <p class="empty-message"><a href="#">Nothing reviewed yet!!</a></p>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer seriemeter-container">
        <p class="discover-text">Discover more to<br>bookmark & review</p>
        <button class="explore-btn">Explore now</button>
    </footer>

</body>
</html>