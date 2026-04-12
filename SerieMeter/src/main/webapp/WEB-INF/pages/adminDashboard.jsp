<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal - Add Media</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<style>
    /* Base Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}
body{
    background-color: black;
    color: #1a1a1a;
}
/* Layout Wrapper */
.dashboard-wrapper{
    display: flex;
    min-height: 100vh;
    width: 100%;
    background-color: #000000;
}
/* Sidebar */
.sidebar{
    width: 250px;
    flex-shrink: 0; /* Prevents the sidebar from shrinking */
    display: flex;
    flex-direction: column;
    padding: 30px 20px;
    background-color: #000000;
}
.brand{
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 60px;
}

.admin-profile-icon{
    font-size: 18px;
    color: #4b5563;
    background-color: #ffffff;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 4px rgb(0, 0, 0, 0.05);
}
.brand h2{
    font-size: 13px;
    font-weight: 600;
    color: white;
}
.navigation{
    flex-grow: 1;
}
.nav-item{
    display: block;
    text-decoration: none;
    color: #356D38;
    padding: 12px 20px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 500;
    text-align: center;
}
.nav-item.active{
    background-color: #8DE586;
}
.user-profile{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    background-color: #F09C6B;
    padding: 10px;
    border-radius: 20px;
}
.user-profile .username{
    font-size: 13px;
    font-weight: 500;
    color: white;
}

/* Main Content */
.main-content{
    flex-grow: 1; /*It promotes the main content to fill the available space.*/
    padding: 30px 50px;
    background-color: #ffffff;
    /* width: 1100px; */
    min-height: 100vh; /*Ensures it goes from top to bottom */
}
.page-header{
    margin-bottom: 40px;
}
.page-header h3{
    font-size: 18px;
    font-weight: 600;
}
.content-grid{
    display: flex;
    gap: 60px;
}
/* Form column left side */
.form-column{
    flex: 2; /*It takes up 2 parts of the available space */
    max-width: 600px;
}
.titles{
    margin-bottom: 30px;
}
.titles h1{
    font-size: 36px;
    font-weight: 700;
    color: #111827;
    margin-bottom: 5px;
}
.titles .subtitle{
    font-size: 16px;
    color: #6b7280;
}
.input-group{
    margin-bottom: 20px;
}
.input-group label{
    display: block;
    font-size: 12px;
    font-weight: 600;
    color: #4b5563;
    margin-bottom: 8px;
    letter-spacing: 0.5px;
}
.form-control{
    width: 100%;
    padding: 14px;
    background-color: #f3f6f9;
    border: 1px solid transparent;
    border-radius: 8px;
    outline: none; /*It removes the default focus outline */
}
.form-control:focus{
    border: 1px solid #00a3ff;
}
.row-3-cols{
    display: flex;
    gap: 15px;
}
.row-3-cols .input-group{
    flex: 1; /*It takes up 1 part of the available space */
}
.synopsis-box{
    resize: vertical;
    min-height: 180px;
}
.button-container{
    display: flex;
    justify-content: flex-end;
    margin-top: 30px;
}
.publish-btn{
    background-color: #008000;
    color: white;
    border: none;
    padding: 14px 60px;
    border-radius: 30px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(9, 255, 0, 0.5);
}
.publish-btn:hover{
    background-color: #008000da;
}
/* Media column right side */
.media-column{
    flex: 1;
    max-width: 320px;
}
.media-header h4{
    font-size: 16px;
    margin-bottom: 4px;
}
.media-header p{
    font-size: 13px;
    color: #6b7280;
    line-height: 1.5;
    margin-bottom: 20px;
}
.poster-upload-area img{
    background-size: cover;
    background-position: center;
    height: 450px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
    position: relative;
    box-shadow: 0 4px 20px rgba(0,0,0,0.5);
    border: 2px dashed #ccc;
}
.genre-group{
    width: 100%;
}
</style>
<body>
<!-- Dashboard -->
    <div class="dashboard-wrapper">
        
        <aside class="sidebar">
            <div class="brand">
                <i class="fa-solid fa-user-tie admin-profile-icon"></i>
                <h2>Admin Portal</h2>
            </div>
            
            <nav class="navigation">
                <a href="#" class="nav-item active">Content Management</a>
            </nav>
            
            <div class="user-profile">
                <i class="fa-solid fa-user-tie admin-profile-icon"></i>
                <span class="username">@Adminuser</span>
            </div>
        </aside>

<!-- Main Content -->
        <main class="main-content">
            
            <header class="page-header">
                <h3>Add new media</h3>
            </header>

            <div class="content-grid">
                
                <div class="form-column">
                    <div class="titles">
                        <h1>Create a cinematic masterpiece</h1>
                        <p class="subtitle">Fill in the technical details below</p>
                    </div>

                    <form action="index.jsp" method="POST">
                        <div class="input-group">
                            <label>MOVIE TITLE</label>
                            <input type="text" name="movieTitle" class="form-control" required>
                        </div>

                        <div class="input-group">
                            <label>DIRECTOR'S NAME</label>
                            <input type="text" name="directorName" class="form-control" required>
                        </div>

                        <div class="row-3-cols">
                            <div class="input-group">
                                <label>RELEASE DATE</label>
                                <input type="date" name="releaseDate" class="form-control" required>
                            </div>
                            <div class="input-group">
                                <label>CATEGORY</label>
                                <select name="category" class="form-control" required>
                                    <option value=""></option>
                                    <option value="scifi">Sci-Fi</option>
                                    <option value="drama">Drama</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label>TOTAL TIME</label>
                                <input type="text" name="totalTime" class="form-control" required>
                            </div>
                        </div>

                        <div class="input-group">
                            <label>SYNOPSIS</label>
                            <textarea name="synopsis" class="form-control synopsis-box"></textarea>
                        </div>

                        <div class="button-container">
                            <button type="submit" class="publish-btn">Publish</button>
                        </div>
                    </form>
                </div>

                <div class="media-column">
                    <div class="media-header">
                        <h4>Visual identity</h4>
                        <p>Upload high quality poster.<br>Recommended ratio 2:3</p>
                    </div>
                    
                    <div class="poster-upload-area">
                        <img src="assets/images/intersteller.jpg" alt="Upload Icon" >
                    </div>

                    <div class="input-group genre-group">
                        <label>GENRE</label>
                        <select name="genre" class="form-control" required>
                            <option value=""></option>
                            <option value="action">Action</option>
                            <option value="thriller">Thriller</option>
                        </select>
                    </div>
                </div>

            </div>
        </main>
    </div>

</body>
</html>