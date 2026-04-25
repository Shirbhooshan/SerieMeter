<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | SerieMeter</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Manrope', sans-serif;
        }

        body {
            background-color: #fff;
            color: #000;
        }

        .page-content {
            padding: 60px 40px;
        }

        /* HERO SECTION */
        .hero {
            margin-bottom: 100px;
			margin-top: 20px;
        }

        .hero h1 {
            font-size: 96px;
            font-weight: 800;
            line-height: 0.9;
            letter-spacing: -2px;
        }

        .hero .green {
            color: #34A853;
            display: block;
        }

        .hero p {
            font-size: 18px;
            color: #888;
            margin-top: 15px;
        }

        /* SECTION LABELS */
        .section-label {
            font-weight: 800;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .orange-line {
            width: 40px;
            height: 3px;
            background-color: #FF7A59;
            margin-bottom: 30px;
        }

        /* OUR STORY — flexbox: label left, content right */
        .story-section {
            display: flex;
            gap: 40px;
            margin-bottom: 80px;
            align-items: flex-start;
        }

        .story-left {
            flex: 0 0 500px;
        }

        .story-right {
            flex: 1;
            margin-right: 100px;
        }

        .story-header {
            font-size: 36px;
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -0.5px;
            margin-bottom: 20px;
        }

        .story-paras {
            display: flex;
            gap: 30px;
        }

        .story-para-1,
        .story-para-2 {
            flex: 1;
            font-size: 16px;
            color: #555;
            line-height: 1.65;
        }

        /* TEAM SECTION — horizontal 4-column grid */
        .team-section {
            margin-bottom: 60px;
        }

        .team-header-row {
            margin-bottom: 30px;
        }

        .team-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .team-box {
            /* each card */
        }

        .image-placeholder {
            width: 100%;
            aspect-ratio: 3 / 4;
            background-color: #e0e0e0;
            margin-bottom: 12px;
            overflow: hidden;
        }

        .image-placeholder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .name {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 2px;
        }

        .role {
            font-size: 12px;
            font-weight: 700;
            color: #333;
            margin-bottom: 4px;
        }

        .description {
            font-size: 12px;
            color: #777;
            font-style: italic;
        }
    </style>
</head>
<body>

    <div class="page-content">

        <!-- HERO -->
        <div class="hero">
            <h1>The Minds Behind <span class="green">the Screen.</span></h1>
            <p>A team of second year undergraduate students.</p>
        </div>

        <div class="story-section">
            <div class="story-left">
                <p class="section-label">Our Story</p>
                <div class="orange-line"></div>
            </div>

            <div class="story-right">
                <div class="story-header">
                    SerieMeter was born from a simple realization;
                </div>
                <div class="story-paras">
                    <p class="story-para-1">
                        Navigating the vast world of film and television can be overwhelming. With countless options at our fingertips, finding the perfect movie or series to suit your taste can feel like a daunting task. That's where SerieMeter comes in.
                    </p>
                    <p class="story-para-2">
                        We envisioned a platform that not only provides ratings and reviews but also fosters a vibrant community of film enthusiasts. A place where users can connect, share their opinions, and discover hidden gems together. And so, SerieMeter was born.
                    </p>
                </div>
            </div>
        </div>

        <div class="team-section">
            <div class="team-header-row">
                <p class="section-label">Our Team</p>
                <div class="orange-line"></div>
            </div>

            <div class="team-grid">
                <div class="team-box">
                    <div class="image-placeholder">
                        <img src="assets/images/team/shirbhooshan.jpg" alt="Shirbhooshan">
                    </div>
                    <div class="name">Shirbhooshan</div>
                    <div class="role">Team Lead</div>
                    <div class="description">"Description of work done"</div>
                </div>

                <div class="team-box">
                    <div class="image-placeholder">
                        <img src="assets/images/team/safiyah.jpg" alt="Safiyah">
                    </div>
                    <div class="name">Safiyah Malik</div>
                    <div class="role">Role</div>
                    <div class="description">"Description of work done"</div>
                </div>

                <div class="team-box">
                    <div class="image-placeholder">
                        <img src="assets/images/team/shuvam.jpg" alt="Shuvam">
                    </div>
                    <div class="name">Shuvam Karki</div>
                    <div class="role">Role</div>
                    <div class="description">"Description of work done"</div>
                </div>

                <div class="team-box">
                    <div class="image-placeholder">
                        <img src="assets/images/team/avin.jpg" alt="Avin">
                    </div>
                    <div class="name">Avin Subedi</div>
                    <div class="role">Role</div>
                    <div class="description">"Description of work done"</div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>