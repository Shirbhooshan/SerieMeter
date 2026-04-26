<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Content Management</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">

</head>
<style>
    /* Base Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Manrope', sans-serif;
}
.adm-body{
	min-height: 100vh;
    overflow: hidden; /* Disables browser-level scrolling */
    background-color: #000000;
}
.adm-layout-container {
    display: flex;
    height: 100%;
    gap: 10px;
}
/* --- Sidebar Styles --- */ 
.adm-sidebar {
    width: 220px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 10px 5px;
}

.adm-logo-container {
    padding: 0 10px 50px 10px;
}

.adm-logo-container img {
    max-width: 190px;
    height: auto;
}

.adm-nav-menu {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.adm-nav-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px 12px;
    text-decoration: none;
    color: #ffffff;
    font-weight: 500;
    font-size: 12px; 
    border-radius: 10px;
    transition: all 0.2s ease;
}
.adm-nav-item.active {
    background-color: #4ebc57;
    color: #1a1a1a;
    opacity: 0.82;
}

.adm-nav-item:not(.active):hover {
    background-color: rgba(255, 255, 255, 0.1);
}

.adm-nav-icon {
    width: 18px;
    height: 18px;
    transition: filter 0.2s ease;
}
    
/* Turns the icon black when the navigation item is active */
.adm-nav-item.active .adm-nav-icon {
    filter: brightness(0) saturate(100%); 
}

/* Logout Button with hover design */
.adm-logout-container {
    padding: 0 5px;
}

.adm-logout-btn {
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

.adm-logout-btn:hover {
    background-color: #e75a55; 
    color: #1a1a1a;
    opacity: 0.82;
	transform: translateY(-2px);
}

.adm-logout-btn:hover .adm-nav-icon {
    filter: brightness(0) saturate(100%); 
}

/* Main Content */
.adm-main-content{
    flex-grow: 0; /*Stops full-width expansion */
    width: 84%;
    height: 100vh;
    border-radius: 16px;
    background-color: #ffffff;
    padding: 20px 30px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
}
.adm-page-header{
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.adm-page-header h3{
    font-size: 20px;
    font-weight: bold;
}
.adm-header-profile{
    display: flex;
    align-items: center;
    gap: 15px;
}
.adm-header-profile-text{
    display: flex;
    flex-direction: column;
    text-align: right;
}
.adm-profile-name{
    font-size: 14px;
    font-weight: bold;
    color: #0F172A;
}
.adm-profile-email{
    font-size: 14px;
    color: #0F172A;
}
.adm-profile-avatar{
    width: 40px;
    height: 40px;
    background-color: #f3f6f9;
    border-radius: 50%;
}

.adm-content-grid{
    display: flex;
    gap: 30px;
    justify-content: space-between;
    align-items: flex-start;
}
/* Form Controls */
.adm-form-column{
    flex: 2;
    max-width: 650px;
}
.adm-titles{
    margin-bottom: 20px;
}
.adm-titles h1{
    font-size: 34px;
    font-weight: 700;
    color: #0F172A;
    line-height: 1.1;
}
.adm-titles .adm-subtitle{
    font-size: 16px;
    font-weight:400;
    color: #0F172A;
}
.adm-input-group{
    margin-bottom: 12px;
}
.adm-input-group label{
    display: block;
    font-size: 13px;
    font-weight: bold;
    color: #4b5563;
    margin-bottom: 4px;
    text-transform: uppercase;
}

/* Input fields */
.adm-form-control{
    width: 100%;
    margin-bottom: 4px;
    padding: 10px;
    background-color: #f3f6f9;
    border: 1px solid transparent;
    border-radius: 12px;
    outline: none;
    font-size: 14px;
}
.adm-form-control-category{
    width: 100%;
    margin-bottom: 4px;
    padding: 10px;
    font-size: 14px;
    background-color: #f3f6f9;
    border: 1px solid transparent;
    border-radius: 12px;
    outline: none; /*It removes the default focus outline */
    appearance: none; /*It removes the default dropdown arrow */
    background-image: url(assets/icon/drop-down.svg);
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px;
}
.adm-form-control-genre{
    width: 40%;
    padding: 10px;
    font-size: 14px;
    background-color: #f3f6f9;
    border: 1px solid transparent;
    border-radius: 12px;
    outline: none; /*It removes the default focus outline */
    appearance: none; /*It removes the default dropdown arrow */
    background-image: url(assets/icon/drop-down.svg);
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px;
}
.adm-form-control:focus, 
.adm-form-control-category:focus, 
.adm-form-control-genre:focus {
    border: 1px solid #4ebc57;
    background-color: #ffffff;
}
/* Layout for 3 side by side input fields */
.adm-row-3-cols{
    display: flex;
    gap: 15px;
}
.adm-row-3-cols .adm-input-group{
    flex: 1; /*It allows each input group to take up an equal amount of space */
}
/* Textarea */
.adm-synopsis-box{
    resize: none; 
    min-height: 250px;
    width: 100%;
    padding: 12px;
    background-color: #f3f6f9;
    border-radius: 12px;
    border: 1px solid #e0e0e0;
}

/* Media column right side */
.adm-media-column{
    flex: 1;
    max-width: 300px;
    display: flex;
    flex-direction: column;
}
.adm-media-header h4{
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 4px;
    color: #0F172A;
}
.adm-media-header p{
    font-size: 13px;
    font-weight: 400;
    color: #0F172A;
    line-height: 1.5;
    margin-bottom: 15px;
}
.adm-poster-upload-area{
	width: 100%;
	display: flex;
	justify-content: flex-end;
}
.adm-poster-upload-area img{
    position: relative; /*It prevents the image from overflowing its container */
    width: 100%;
    max-width: 320px;
    border-radius: 16px;
    overflow: hidden;
    margin-bottom: 2px;
}
.adm-genre-group{
    width: 100%;
    margin-top: 10px;
}
/* Publish Button */
.adm-publish-button-container{
    display: flex;
    justify-content: flex-end;
    padding-top: 3px;
}
.adm-publish-btn{
    background-color: #008000;
    color: white;
    border: none;
    padding: 10px 30px;
    border-radius: 30px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer; 
}
.adm-publish-btn:hover{
    background-color: #008000da;
}
</style>
<body class="adm-body">
    <!-- Layout Container -->
    <div class="adm-layout-container">
        <!-- Sidebar -->
         <aside class="adm-sidebar">
            <div>
                <div class="adm-logo-container">
                    <img src="${pageContext.request.contextPath}/assets/images/LogoBlack.jpg" alt="Logo">
                </div>
                <nav class="adm-nav-menu">
                    <a href="#" class="adm-nav-item">
                        <img src="${pageContext.request.contextPath}/assets/icon/dashboard-ad-icon.svg" class="adm-nav-icon"> Dashboard
                    </a>
                    <a href="#" class="adm-nav-item active">
                        <img src="${pageContext.request.contextPath}/assets/icon/contentManagement-icon.svg" class="adm-nav-icon"> Content Management
                    </a>
                    <a href="#" class="adm-nav-item">
                        <img src="${pageContext.request.contextPath}/assets/icon/users-ad-icon.svg" class="adm-nav-icon"> Users
                    </a>
                </nav>
            </div>

            <div class="adm-logout-container">
                <a href="${pageContext.request.contextPath}/Logout" class="adm-logout-btn">
                    <img src="${pageContext.request.contextPath}/assets/icon/logout-ad-icon.svg" class="adm-nav-icon"> Logout
                </a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="adm-main-content">
            <header class="adm-page-header">
                <h3>Add new media</h3>
                <div class="adm-header-profile">
                    <div class="adm-header-profile-text">
                        <span class="adm-profile-name">Adams</span>
                        <span class="adm-profile-email">adams234@gmail.com</span>
                    </div>
                    <div class="adm-profile-avatar"></div>
                </div>
            </header>    
        

    <!-- Form Section -->
        <form action="${pageContext.request.contextPath}/AdminContent" method="POST" class="adm-content-grid">
            <div class="adm-form-column">
                <div class="adm-titles">
                    <h1>Create a cinematic<br>masterpiece</h1>
                    <p class="adm-subtitle">Fill in the technical details below</p>
                </div>

                <div class="adm-input-group">
                    <label>Movie Title</label>
                    <input type="text" name="movieTitle" class="adm-form-control" required>
                </div>

                <div class="adm-input-group">
                    <label>Director's Name</label>
                    <input type="text" name="directorName" class="adm-form-control" required>
                </div>

                <div class="adm-row-3-cols">
                    <div class="adm-input-group">
                        <label>Release Date</label>
                        <input type="date" name="releaseDate" class="adm-form-control" required>
                    </div>
                    <div class="adm-input-group">
                        <label>Category</label>
                        <select name="category" class="adm-form-control-category" required>
                            <option value=""></option>
                            <option value="scifi">Sci-Fi</option>
                            <option value="drama">Drama</option>
                        </select>
                    </div>
                    <div class="adm-input-group">
                        <label>Total Time</label>
                        <input type="text" name="totalTime" class="adm-form-control" required>
                    </div>
                </div>
                <div class="adm-input-group">
                    <label>Synopsis</label>
                    <textarea name="synopsis" class="adm-form-control adm-synopsis-box"></textarea>
                </div>
            </div>

            <div class="adm-media-column">
                <div class="adm-media-header">
                    <h4>Visual identity</h4>
                    <p>Upload high quality poster.<br>Recommended ratio 2:3</p>
                </div>

                <div class="adm-poster-upload-area">
                    <img src="assets/images/intersteller.jpg" alt="Poster Upload Placeholder">
                </div>
            
                <div class="adm-input-group adm-genre-group">
                    <label>Genre</label>
                    <select name="genre" class="adm-form-control-genre" required>
                        <option value=""></option>
                        <option value="action">Action</option>
                        <option value="comedy">Comedy</option>
                        <option value="horror">Horror</option>
                    </select>
                </div>

                <div class="adm-publish-button-container">
                    <button type="submit" class="adm-publish-btn">Publish</button>
                </div>
            </div>
        </form>
    	</main>
    </div>
</body>
</html>