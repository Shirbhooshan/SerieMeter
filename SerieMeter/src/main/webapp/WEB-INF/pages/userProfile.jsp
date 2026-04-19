<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Manrope', sans-serif;
    }
    body{
        background-color: #ffffff;
        color: #111;
    }
    .profile-container{
        max-width: 1000px;
        margin-left: 40px;
        padding: 40px 20px;
        /* margin: 0 auto; */
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
        font-size: 73px;
        font-weight: 600;
        margin-bottom: 15px;
        white-space: nowrap; /*Prevents the name from breaking into multiple lines*/
    }
    .user-action{
        display: flex;
        gap: 10px;
    }
    .btn-secondary{
        background-color: #f0f2f5;
        height: 36px;
        width: 130px;
        color: black;
        border: none;
        margin-left: 5px;
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
    }
    .btn-secondary:hover{
        background-color: #e4e6e9;
    }

    /* Stats card */
   .stats-group {
        display: flex;
        gap: 20px;
        height: 150px;
        margin-left: 400px;
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
        font-weight: bold;
        color: #a67c52;
    }
    .stat-title {
        font-size: 13px;
        color: #a67c52;
        margin-top: 5px;
    }
    .profile-section{
        margin-bottom: 50px;
    }
    .section-title{
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 25px;
    }

    /* Section 2: Bookmarked movies */
    .movie-grid{
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 30px;
        margin-bottom: 25px;
    }
    .poster-wrapper{
        position: relative; 
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 15px;
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
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }
    .heart-shape{
        display: flex;
        justify-content: center;
        width: 25px;
        height: 25px;
    }
    .title-row{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 4px;
    }
    .title-row h4{
        font-size: 26px;
        font-weight: bold;
        overflow: hidden; /*It hides the text that extends beyond the container*/
        text-overflow: ellipsis;
        white-space: nowrap; 
    }   
    .year{
        font-size: 20px;
        font-weight: 400;
        color: #888;
    }
    .genre{
        font-size: 15px;
        font-weight: 400;
        color: #888;
        letter-spacing: 0.5px;
    }
    /* Section 3:Discover call to action */
    .discover-section{
        text-align: center;
        margin: 60px 0;
    }
    .discover-section h3{
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 20px;
        line-height: 1.4;
    }
    .btn-primary{
        background-color: #008a00;
        color: white;
        padding: 12px 28px;
        border-radius: 25px;
        font-size: 20px;
        font-weight: 700;
        cursor: pointer;
        border: none;
    }
    .btn-primary:hover{
        background-color: #006b00;
    }
    /* Section 4: Reviews */
    .review-grid {
        display: flex;
        justify-content: center;
        align-items: stretch;
        background-color: #f6f6f6;
        border-radius: 20px;
        overflow: hidden; /* important for clean rounded look */
        margin: 0 auto; /* centers the review section */
        max-width: 1000px;
    }
    .review-card, .review-card1 {
        flex: 1;
        padding: 40px 30px;
        display: flex;
        flex-direction: column;
        min-height: 260px;
    }

    .review-card {
        border-top-left-radius: 16px;
        border-bottom-left-radius: 16px;
        border-right: 1px solid #C9C9C9;
    }

    .review-card1 {
        border-top-right-radius: 16px;
        border-bottom-right-radius: 16px;
        width: 100%;
    }
    .star-left{
        margin-bottom: 20px;
        display: flex;
        gap: 2px;
        justify-content: flex-end;

    }
    .star-right{
        margin-bottom: 20px;
        display: flex;
        gap: 2px;
        justify-content: flex-start;

    }
    .star{
        width: 44px;
        height: 44px;
    }
    .review-text-left, .review-text-right{
        font-size: 19px;
        color: #555;
        line-height: 1.6;
        margin-bottom: 30px;
        max-height: 60px;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    .review-meta-left{
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        font-weight: 400;
        color: #888;
    }
    .review-meta-right{
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        font-weight: 400;
        color: #888;
    }
    /* Pagination */
    .pagination{
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .page-btn{
        background-color: #f0f2f5;
        border: none;
        width: 60px;
        height: 40px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        border-right: 1px solid #C9C9C9;
        color: #666;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .page-btn1{
        background-color: #f0f2f5;
        border: none;
        width: 60px;
        height: 40px;
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
        border-left: 1px solid #C9C9C9;
        color: #666;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .arrow{
        width: 16px;
        height: 16px;
    }
    .page-btn:hover{
        background-color: #e4e6e9;
    }
    .page-btn1:hover{
        background-color: #e4e6e9;
    }
    .movie-title-right{
        font-size: 19px;
        font-weight: 400;
        color: #333;
        text-align: right;
        padding-top: 50px;
    }
    .movie-title-left{
        font-weight: 400;
        font-size: 19px;
        color: #333;
        text-align: left;
        padding-top: 50px
    }



</style>
<body>

<%@ include file="/components/navbar.jsp"%>

    <main class="profile-container">

        <header class="profile-header">
            <div class="user-group-info">
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
                    </div>
                    <div class="stat-title">BOOKMARKS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-row">
                        <span class="stat-count">3</span>
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
                        <button class="icon-btn heart-btn">
                            <div class="heart-shape">
                                <img src="assets/icon/heart.svg" alt="Heart Icon">
                            </div>
                        </button>
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
                        <button class="icon-btn heart-btn">
                            <div class="heart-shape">
                                <img src="assets/icon/heart.svg" alt="Heart Icon">
                            </div>
                        </button>
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
                        <button class="icon-btn heart-btn">
                            <div class="heart-shape">
                                <img src="assets/icon/heart.svg" alt="Heart Icon">
                            </div>
                        </button>
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
                    <div class="star-left">
                        <img src="assets/icon/star-none.svg" alt="Empty Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                    </div>
                    <p class="review-text-left">I was captivated by the breathtaking visuals and <br> innovative storytelling of 'Echoes of the Nebula.' The director masterfully crafted a universe teeming with vibrant characters and thought-provoking themes. While the plot had a few slow moments, the overall experience was truly unforgettable. A must-see for any sci-fi enthusiast!</p>
                    <div class="review-meta-left">
                        <span class="date-left" style="font-size: 19px; font-weight: 400; padding-top: 50px;">2 days ago</span>
                        <span class="movie-title-left">Echoes of the Nebula</span>
                    </div>
                </div>

                <div class="review-card1">
                    <div class="star-right">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-full.svg" alt="Filled Star" class="star">
                        <img src="assets/icon/star-none.svg" alt="Empty Star" class="star">
                    </div>
                    <p class="review-text-right">From the opening scene to the final credits, 'Whispers of Yesterday' takes you on an emotional rollercoaster.<br>The stellar performances by the cast, especially Anya Petrova, breathe life into characters grappling with love, loss, and redemption. Director Leo Maxwell weaves a narrative that's both heart-wrenching and uplifting, exploring the complexities of human relationships with nuance and grace. The film's haunting score and breathtaking cinematography only amplify its emotional impact. A must-see for those who appreciate stories that resonate long after the screen fades to black.</p>
                    <div class="review-meta-right">
                        <span class="movie-title-right">Whispers of Yesterday</span>
                        <span class="date-right" style="font-size: 19px; font-weight: 400; padding-top: 50px;">2 days ago</span>
                    </div>
                </div>
            </div>

            <div class="pagination">
                <button class="page-btn"><img src="assets/icon/arrow-left.svg" alt="Previous Page" class="arrow"></button>
                <button class="page-btn1"><img src="assets/icon/arrow-right-black.svg" alt="Next Page" class="arrow"></button>
            </div>
        </section>
        
    </main>
    
    <%@ include file="/components/footer.jsp"%>
    
</body>
</html>