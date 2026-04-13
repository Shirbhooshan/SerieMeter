<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: sans-serif, Arial, Helvetica, ;
    }
    body{
        background-color: #ffffff;
        color: #111;
    }
    .profile-container{
        max-width: 1000px;
        margin: 0 auto;
        padding: 40px 20px;
    }
    /* Section 1: Profile Header */
    .profile-header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 60px;
    }
    .user-group-info{
        display: flex;
        align-items: center;
        gap: 25px;
    }
    .profile-img{
        width: 120px;
        height: 120px;
        border-radius: 24px;
        object-fit: cover;
    }
    .user-details h1{
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 15px;
    }
    .user-action{
        display: flex;
        gap: 10px;
    }
    .btn-secondary{
        background-color: #f0f2f5;
        color: #333;
        border: none;
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 500;
        cursor: pointer;
    }
    .btn-secondary:hover{
        background-color: #e4e6e9;
    }

    /* Stats card */
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
        width: 15px;
        height: auto;
        margin-top: 8px;
    }

    .stat-title {
        font-size: 13px;
        font-weight: 700;
        color: #a67c52;
        margin-top: 5px;
    }
    .profile-section{
        margin-bottom: 50px;
    }
    .section-title{
        font-size: 20px;
        font-weight: 500;
        margin-bottom: 25px;
    }

    /* Section 2: Bookmarked movies */
    .movie-grid{
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 30px;
        margin-bottom: 25px;
    }
    .poster-wrapper{
        position: relative; 
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 12px;
    }
    .poster-wrapper img{
        width: 100%;
        height: auto;
        display: block;
        aspect-ratio: 2/3; /*Keeps standard movie poster ratio*/
        object-fit: cover;
    }
    .heart-btn{
        position:absolute;
        top: 10px;
        right: 10px;
        background: white;
        color: #FA2626;
        border: none;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .title-row{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 4px;
    }
    .title-row h4{
        font-size: 14px;
        font-weight: 600;
        white-space: nowrap; /*It forces the title to stay on one line*/
        overflow: hidden; /*It hides the text that extends beyond the container*/
        text-overflow: ellipsis; /*It displays an ellipsis (...) when the text overflows*/
    }
    .title-row .year{
        font-size: 12px;
        color: #888;
    }
    .genre{
        font-size: 10px;
        color: #888;
        letter-spacing: 0.5px;
    }
    /* Section 3:Discover call to action */
    .discover-section{
        text-align: center;
        margin: 60px 0;
    }
    .discover-section h3{
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 20px;
        line-height: 1.4;
    }
    .btn-primary{
        background-color: #008a00;
        color: white;
        padding: 12px 28px;
        border-radius: 25px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
    }
    .btn-primary:hover{
        background-color: #006b00;
    }
    /* Section 4: Reviews */
    .review-grid{
        display: grid;
        grid-template-columns: 1fr 1fr; 
        /* Two equal columns */
        gap: 20px;
        margin-bottom: 20px;
    }
    .review-card{
        background-color: #f6f6f6;
        padding: 30px;
        border-radius: 16px;
        display: flex;
        flex-direction: column;
    }
    .stars{
        color: #FFD700;
        font-size: 14px;
        margin-bottom: 15px;
        text-align: center;
    }
    .stars .fa-regular{
        color: #e0e0e0;
    }
    .review-text{
        font-size: 13px;
        color: #555;
        line-height: 1.6;
        text-align: center;
        margin-bottom: 30px;
        flex-grow: 1; /*It provides space for the review text to expand */
        /* Pushes meta data to the bottom */
    }
    .review-meta{
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        color: #888;
    }
    /* Pagination */
    .pagination{
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    .page-btn{
        background-color: #f0f2f5;
        border: none;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        color: #666;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .page-btn:hover{
        background-color: #e4e6e9;
    }

</style>
<body>
    <main class="profile-container">

        <header class="profile-header">
            <div class="user-info-group">
                <img src="assets/images/profile_image.png" alt="Profile Picture" class="profile-img">
                <div class="user-details">
                    <h1>Alex Gol. Berg</h1>
                    <div class="user-actions">
                        <button class="btn-secondary">Edit Profile</button>
                        <button class="btn-secondary">Share</button>
                    </div>
                </div>
            </div>

            <div class="stats-group">
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">3</span>
                        <img src="<%= request.getContextPath() %>/assets/icon/lock.png" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">BOOKMARKS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">3</span>
                        <img src="<%= request.getContextPath() %>/assets/icon/lock.png" class="stat-lock" alt="Locked">
                    </div>
                    <div class="stat-title">REVIEWS</div>
                </div>
            </div>
        </header>

        <section class="profile-section">
            <h2 class="section-title">Bookmarked</h2>
            <div class="movie-grid">
                <div class="movie-card">
                    <div class="poster-wrapper">
                        <img src="assets/images/islandofsecrets.jpg" alt="Island of Secrets">
                        <button class="icon-btn heart-btn"><i class="fa-solid fa-heart"></i></button>
                    </div>
                    <div class="movie-info">
                        <div class="title-row">
                            <h4>Island of Secrets</h4>
                            <span class="year">2020</span>
                        </div>
                        <span class="genre">ADVENTURE</span>
                    </div>
                </div>

                <div class="movie-card">
                    <div class="poster-wrapper">
                        <img src="assets/images/The_silent_forest.jpg" alt="The Silent Forest">
                        <button class="icon-btn heart-btn"><i class="fa-solid fa-heart"></i></button>
                    </div>
                    <div class="movie-info">
                        <div class="title-row">
                            <h4>The Silent Forest</h4>
                            <span class="year">2022</span>
                        </div>
                        <span class="genre">DRAMA</span>
                    </div>
                </div>

                <div class="movie-card">
                    <div class="poster-wrapper">
                        <img src="assets/images/galaxyQuest.jpg" alt="Galactic Quest">
                        <button class="icon-btn heart-btn"><i class="fa-solid fa-heart"></i></button>
                    </div>
                    <div class="movie-info">
                        <div class="title-row">
                            <h4>Galactic Quest</h4>
                            <span class="year">2023</span>
                        </div>
                        <span class="genre">SCIENCE FICTION</span>
                    </div>
                </div>
            </div>
        </section>

        <section class="discover-section">
            <h3>Discover more to<br>bookmark</h3>
            <button class="btn-primary">Explore now</button>
        </section>

        <section class="profile-section">
            <h2 class="section-title">Reviews</h2>
            <div class="review-grid">
                <div class="review-card">
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <p class="review-text">I was captivated by the breathtaking visuals and innovative storytelling of 'Echoes of the Nebula.' The d...</p>
                    <div class="review-meta">
                        <span class="date">2 days ago</span>
                        <span class="movie-title">Echoes of the Nebula</span>
                    </div>
                </div>

                <div class="review-card">
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <p class="review-text">From the opening scene to the final credits, 'Whispers of Yesterday' takes you on an emotional rollercoaster...</p>
                    <div class="review-meta">
                        <span class="date">2 days ago</span>
                        <span class="movie-title">Whispers of Yesterday</span>
                    </div>
                </div>
            </div>

            <div class="pagination">
                <button class="icon-btn page-btn"><i class="fa-solid fa-arrow-left"></i></button>
                <button class="icon-btn page-btn"><i class="fa-solid fa-arrow-right"></i></button>
            </div>
        </section>
        
    </main>
</body>
</html>