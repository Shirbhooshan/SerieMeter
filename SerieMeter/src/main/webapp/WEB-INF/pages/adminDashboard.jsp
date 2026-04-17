<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">

<style>
    /* --- Global Styles --- */
    .ad-body {
        font-family: 'Manrope', sans-serif;
        background-color: #010101;
        color: #ffffff;
        margin: 0;
        padding: 10px; /* Brought white box closer to edges */
        height: 100vh;
        box-sizing: border-box;
        overflow: hidden; /* Prevent body scroll */
    }

    * {
        box-sizing: border-box;
    }

    /* --- Main Layout --- */
    .ad-layout-container {
        display: flex;
        height: 100%;
        gap: 10px;
    }

    /* --- Sidebar Styles --- */
    .ad-sidebar {
        width: 260px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 15px 5px;
    }

    .ad-logo-container {
        padding: 0 10px 50px 10px;
    }

    .ad-logo-container img {
        max-width: 130px;
        height: auto;
    }

    .ad-nav-menu {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .ad-nav-item {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 12px 15px;
        text-decoration: none;
        color: #ffffff;
        font-weight: 500;
        font-size: 13px; 
        border-radius: 10px;
        transition: all 0.2s ease;
    }

    .ad-nav-item.active {
        background-color: #4ebc57;
    }

    .ad-nav-item:not(.active):hover {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .ad-nav-icon {
        width: 18px;
        height: 18px;
        transition: filter 0.2s ease;
    }

    /* Logout Button with specific hover design */
    .ad-logout-container {
        padding: 0 5px;
    }

    .ad-logout-btn {
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        color: #ffffff;
        font-weight: 500;
        font-size: 13px;
        padding: 12px 15px;
        border-radius: 10px;
        transition: all 0.2s ease;
    }

    .ad-logout-btn:hover {
        background-color: #e75a55; 
        color: #1a1a1a;
        opacity: 0.82;
		transform: translateY(-2px);
    }

    .ad-logout-btn:hover .ad-nav-icon {
        filter: brightness(0) saturate(100%); 
    }

    /* --- Main White Box  --- */
    .ad-main-content {
        flex: 1;
        background-color: #ffffff;
        color: #1a1a1a;
        border-radius: 16px; 
        padding: 20px 30px;
        display: flex;
        flex-direction: column;
        overflow: hidden; /* No scrolling in the box */
    }

    /* Header adjustments */
    .ad-top-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .ad-header-title {
        font-size: 16px;
        font-weight: 700;
        margin: 0;
    }

    .ad-profile-section {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .ad-profile-info {
        text-align: right;
    }

    .ad-profile-name {
        font-weight: 700;
        font-size: 13px;
        margin: 0;
    }

    .ad-profile-email {
        font-size: 11px;
        color: #666666;
        margin: 0;
    }

    .ad-profile-pic-label {
        width: 35px;
        height: 35px;
        background-color: #e0e0e0;
        border-radius: 50%;
        cursor: pointer;
    }

    /* Content Area Titles */
    .ad-section-title {
        font-size: 28px;
        font-weight: 800;
        margin: 0;
        letter-spacing: -0.5px;
    }

    .ad-text-orange {
        color: #e37329;
    }

    .ad-section-subtitle {
        font-size: 13px;
        color: #555555;
        margin: 0 0 15px 0;
    }

    /* Search & Sort */
    .ad-controls {
        display: flex;
        justify-content: flex-end;
        gap: 8px;
        margin-bottom: 10px;
    }
		
	.ad-search-wrapper {
	    position: relative;
	    display: flex;
	    align-items: center;
	}
	
	/* Position the icon on the right */
	.ad-search-icon {
	    position: absolute;
	    right: 15px; /* Changed from left to right */
	    width: 14px;
	    height: 14px;
	    opacity: 0.6; 
	    pointer-events: none; 
	}
	
	/* Adjust the padding in the search box */
	.ad-search-box {
	    border: 1px solid #dcdcdc;
	    border-radius: 20px;
	    padding: 9px 32px 9px 15px;   /* Padding: Top: 6px, Right: 32px (Room for icon!), Bottom: 6px, Left: 15px */
	    font-size: 12px;
	    color: #555;
	    outline: none;
	    width: 200px;
	}

    .ad-sort-dropdown{
        border: 1px solid #dcdcdc;
        border-radius: 20px;
        padding: 9px 20px;
        font-size: 12px;
        color: #555;
        outline: none;
    }

    /* Table Density (Maximized for 8 rows) */
    .ad-table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed; /* Ensures consistency */
    }

    .ad-table th, .ad-table td {
        padding: 8px 5px; /* Extremely tight padding */
        text-align: left;
        border-bottom: 1px solid #f2f2f2;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .ad-table th {
        font-weight: 600;
        color: #1a1a1a;
        font-size: 12px;
        border-bottom: 1px solid #e0e0e0;
    }

    .ad-table td {
        font-size: 12px;
        color: #555555;
    }

    .ad-rating {
        display: flex;
        align-items: center;
        gap: 3px;
    }

    .ad-star-icon {
        width: 12px;
        height: 12px;
    }

    .ad-delete-icon {
        width: 16px;
        height: 16px;
    }

    /* Pagination (Fixed to bottom) */
    .ad-pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 12px;
        padding-top: 15px;
        font-size: 12px;
    }

    .ad-page-num {
        color: #888888;
        text-decoration: none;
    }

    .ad-page-num.active {
        color: #1a1a1a;
        background-color: #f0f0f0;
        width: 24px;
        height: 24px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        font-weight: 700;
    }
</style>
</head>
<body class="ad-body">

    <div class="ad-layout-container">
        
        <aside class="ad-sidebar">
            <div>
                <div class="ad-logo-container">
                    <img src="${pageContext.request.contextPath}/assets/admin/logo-white.png" alt="Logo">
                </div>
                <nav class="ad-nav-menu">
                    <a href="#" class="ad-nav-item active">
                        <img src="icon-dash.svg" class="ad-nav-icon"> Dashboard
                    </a>
                    <a href="#" class="ad-nav-item">
                        <img src="icon-cont.svg" class="ad-nav-icon"> Content Management
                    </a>
                    <a href="#" class="ad-nav-item">
                        <img src="icon-user.svg" class="ad-nav-icon"> Users
                    </a>
                </nav>
            </div>

            <div class="ad-logout-container">
                <a href="${pageContext.request.contextPath}/Logout" class="ad-logout-btn">
                    <img src="logout.svg" class="ad-nav-icon"> Logout
                </a>
            </div>
        </aside>

        <main class="ad-main-content">
            <header class="ad-top-header">
                <h2 class="ad-header-title">View medias</h2>
                <div class="ad-profile-section">
                    <div class="ad-profile-info">
                        <p class="ad-profile-name">Adams</p>
                        <p class="ad-profile-email">adams234@gmail.com</p>
                    </div>
                    <label for="pfp" class="ad-profile-pic-label">
                        <input type="file" id="pfp" style="display:none">
                    </label>
                </div>
            </header>

            <h1 class="ad-section-title">Added <span class="ad-text-orange">medias</span></h1>
            <p class="ad-section-subtitle">View all the added medias here</p>

				<div class="ad-controls">
				    <select class="ad-sort-dropdown">
				        <option>Sort by Date</option>
				    </select>
				    
				    <div class="ad-search-wrapper">
				        <img src="${pageContext.request.contextPath}/assets/admin/icon-search.svg" class="ad-search-icon" alt="Search">
				        <input type="text" class="ad-search-box" placeholder="Search...">
				    </div>
				</div>

            <table class="ad-table">
                <thead>
                    <tr>
                        <th style="width: 40px">ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Genre</th>
                        <th>Added Date</th>
                        <th>Total Review</th>
                        <th style="width: 60px">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(int i=1; i<=8; i++) { %>
                    <tr>
                        <td>#<%=i%></td>
                        <td>Beauty and the Beast</td>
                        <td>Movie</td>
                        <td>Romance</td>
                        <td>2026-4-15</td>
                        <td><div class="ad-rating">8.5 <img src="star.svg" class="ad-star-icon"></div></td>
                        <td><button style="background:none; border:none; cursor:pointer"><img src="del.svg" class="ad-delete-icon"></button></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="ad-pagination">
                <a href="#" class="ad-page-num">&lt;</a>
                <a href="#" class="ad-page-num active">1</a>
                <a href="#" class="ad-page-num">2</a>
                <a href="#" class="ad-page-num">3</a>
                <a href="#" class="ad-page-num">&gt;</a>
            </div>
        </main>
    </div>
</body>
</html>