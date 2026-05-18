<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Bookmark - Logged Out</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
	
	<style>
    /* Global Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Global Styles */
    .bm-body {
        font-family: 'Manrope', sans-serif;
        background-color: #ffffff;
        color: #1a1a1a;
    }

    /* Wide container matching the rest of the site */
    .bm-page-container {
        max-width: 1200px;
        margin: 80px auto;
        padding: 0 30px;
    }

    /* Two column layout — left text, right card */
    .bm-main-layout {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 60px;
    }

    /* Left Side */
    .bm-left-side {
        flex: 1;
    }

    .bm-left-side h1 {
        font-size: 64px;
        font-weight: 800;
        line-height: 1.05;
        margin: 0 0 20px 0;
    }

    .bm-green-text {
        color: #2eab4a;
    }

    .bm-left-side .bm-subtitle {
        font-size: 17px;
        color: #555;
        line-height: 1.6;
        max-width: 460px;
        margin-bottom: 40px;
    }

    /* Buttons row */
    .bm-btn-row {
        display: flex;
        align-items: center;
        gap: 16px;
        margin-bottom: 50px;
    }

    .bm-btn {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        padding: 14px 28px;
        font-weight: 600;
        font-size: 15px;
        text-decoration: none;
        border-radius: 30px;
        transition: opacity 0.2s ease, transform 0.15s ease;
    }

    .bm-btn:hover {
        opacity: 0.82;
        transform: translateY(-2px);
    }

    .bm-btn-black {
        background-color: #000000;
        color: #ffffff;
    }

    .bm-btn-green {
        background-color: #2eab4a;
        color: #ffffff;
    }

    /* Login arrow icon inside the button */
    .bm-btn-icon {
        width: 18px;
        height: 18px;
        fill: #ffffff;
    }

    /* Cloud Sync feature note below the buttons */
    .bm-feature-note {
        display: flex;
        flex-direction: column;
        gap: 4px;
    }

    .bm-feature-note .bm-note-title {
        font-size: 15px;
        font-weight: 700;
        color: #1a1a1a;
    }

    .bm-feature-note .bm-note-desc {
        font-size: 14px;
        color: #777;
    }

    /* Right Side Card */
    .bm-right-card {
        width: 380px;
        flex-shrink: 0;
        border-radius: 20px;
        padding: 55px 40px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        gap: 0;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.10);
    }

    /* Black circle with bookmark icon inside */
    .bm-card-title {
        font-size: 26px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 14px;
    }

    .bm-card-desc {
        font-size: 15px;
        color: #666;
        line-height: 1.6;
        max-width: 260px;
        margin-bottom: 50px;
    }

    .bm-explore-link {
        font-size: 13px;
        font-weight: 700;
        letter-spacing: 1.5px;
        color: #1a1a1a;
        text-decoration: none;
        text-transform: uppercase;
    }

    .bm-explore-link:hover {
        color: #2eab4a;
        opacity: 0.82;
        transform: translateY(-2px);
    }

    /* ----- Necessary Media Queries ----- */

    /* For Tablets and smaller laptops */
    @media (max-width: 992px) {
        .bm-page-container {
            margin: 50px auto;
        }
        .bm-left-side h1 {
            font-size: 48px;
        }
        .bm-main-layout {
            gap: 40px;
        }
        .bm-right-card {
            width: 340px;
            padding: 40px 30px;
        }
    }

    /* For Mobile Devices */
    @media (max-width: 768px) {
        .bm-page-container {
            margin: 30px auto;
            padding: 0 20px;
        }

        .bm-main-layout {
            flex-direction: column; /* Stack left text and right card */
            text-align: center;
            gap: 50px;
        }

        .bm-left-side {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .bm-left-side h1 {
            font-size: 38px;
        }

        .bm-left-side .bm-subtitle {
            font-size: 15px;
            margin-bottom: 30px;
        }

        .bm-btn-row {
            flex-direction: column; /* Stack buttons vertically on small mobile if needed */
            width: 100%;
            gap: 12px;
        }

        .bm-btn {
            width: 100%;
            justify-content: center;
        }

        .bm-feature-note {
            align-items: center;
        }

        .bm-right-card {
            width: 100%; /* Card takes full width on mobile */
            max-width: 400px;
        }
    }

    /* Small Mobile Phones */
    @media (max-width: 480px) {
        .bm-left-side h1 {
            font-size: 32px;
        }
        .bm-card-title {
            font-size: 22px;
        }
    }
    </style>

</head>

<body>

<%@ include file="/components/navbar.jsp"%>

<div class="bm-body">
    <div class="bm-page-container">

        <div class="bm-main-layout">

            <div class="bm-left-side">

                <h1>Your Personal<br><span class="bm-green-text">Archive</span></h1>

                <p class="bm-subtitle">Keep track of every cinematic journey. Sign in to access your curated bookmarks across all your devices.</p>

                <div class="bm-btn-row">
                        <a href="${pageContext.request.contextPath}/Login" class="bm-btn bm-btn-black">
                            <img src="${pageContext.request.contextPath}/assets/icon/login_white_icon.svg" alt="login logo" style="width: 18px; height: 18px;">
                                Login to View Bookmarks
                        </a>
           
                    <a href="${pageContext.request.contextPath}/Register" class="bm-btn bm-btn-green">Sign up</a>
                </div>

                <div class="bm-feature-note">
                    <img src="${pageContext.request.contextPath}/assets/icon/cloud_icon.svg" alt="Cloud Sync" style="width: 26px; height: 26px; margin-bottom: 4px;">
                    <span class="bm-note-title">Cloud Sync</span>
                    <span class="bm-note-desc">Access your lists from anywhere.</span>
                </div>

            </div>

            <div class="bm-right-card">

                <div class="bm-card-icon-circle">
                    <img src="${pageContext.request.contextPath}/assets/icon/bookmark_icon.svg" alt="Bookmark">
                </div>

                <h2 class="bm-card-title">Empty Library</h2>
                <p class="bm-card-desc">Your collection is waiting for its first masterpiece. Discover films to start your archive.</p>

                <a href="${pageContext.request.contextPath}/Explore" class="bm-explore-link">Explore Trending</a>

            </div>

        </div>

    </div>
</div>

<%@ include file="/components/footer.jsp"%>

</body>
</html>