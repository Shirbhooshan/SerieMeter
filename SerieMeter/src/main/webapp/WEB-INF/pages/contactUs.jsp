<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us | SerieMeter</title>
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
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* ── LAYOUT CONTAINER ── */
    .page-wrapper {
        flex: 1;
        display: grid;
        /* max-content prevents the heading from wrapping while keeping the form nearby */
        grid-template-columns: max-content 1fr 0.7fr;
        padding: 75px 40px 80px 40px;
        align-items: start;
        gap: 80px;
    }

    /* ── LEFT: Large Heading ── */
    .contact-left {
        position: relative;
    }

    .contact-heading {
        font-size: 96px;
        font-weight: 800;
        letter-spacing: -2px;
        line-height: 0.9;
        margin: 0;
        /* Explicitly prevent line breaks */
        white-space: nowrap; 
    }

    .visual-bg {
        position: absolute;
        bottom: -200px;
        left: -60px;
        width: 140%;
        height: 450px;
        background-image: url('assets/images/contact-bg.png');
        background-repeat: no-repeat;
        background-position: bottom left;
        background-size: contain;
        z-index: -1;
    }

    /* ── MIDDLE: The Form ── */
    .contact-middle {
        /* Form starts lower than the heading top line */
        padding-top: 130px;
    }

    .contact-form {
        display: flex;
        flex-direction: column;
        gap: 28px;
        max-width: 380px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .form-group label {
        font-size: 14px;
        font-weight: 600;
    }

    .form-group input, .form-group textarea {
        border: none;
        border-bottom: 1.5px solid #000;
        padding: 6px 0;
        font-size: 14px;
        outline: none;
        background: transparent;
        width: 100%;
    }

    .form-group textarea {
        height: 40px;
        resize: none;
    }

    .submit-btn {
        background-color: #000;
        color: #fff;
        border: none;
        padding: 14px 0;
        border-radius: 50px;
        font-size: 15px;
        font-weight: 700;
        cursor: pointer;
        width: 100%;
        margin-top: 10px;
    }

    /* ── RIGHT: Contact Info ── */
    .contact-right {
        display: flex;
        flex-direction: column;
        gap: 12px;
        padding-top: 130px;
        margin-right: 40px;
    }

    .info-label {
        font-size: 20px;
        font-weight: 800;
    }

    .info-email {
        font-size: 14px;
        color: #555;
        text-decoration: none;
        margin-bottom: 10px;
    }

    .social-links {
        display: flex;
        gap: 15px;
    }

    .social-links img {
        width: 22px;
        height: 22px;
        filter: brightness(0);
    }

    @media ( max-width : 1200px) {
        .page-wrapper {
            grid-template-columns: 1fr;
            padding-top: 100px;
        }
        .contact-middle, .contact-right {
            padding-top: 20px;
        }
        .contact-heading {
            font-size: 72px;
            white-space: normal;
        }
    }
</style>
</head>
<body>

    <%@ include file="/components/navbar.jsp"%>

    <div class="page-wrapper">
        <div class="contact-left">
            <h1 class="contact-heading">Contact Us</h1>
            <div class="visual-bg"></div>
        </div>

        <div class="contact-middle">
            <form action="${pageContext.request.contextPath}/Contact" method="POST" class="contact-form">
                <div class="form-group">
                    <label for="name">Full Name</label> 
                    <input type="text" id="name" name="fullName" placeholder="e.g. John Doe" required>
                </div>

                <div class="form-group">
                    <label for="email">E-mail</label> 
                    <input type="email" id="email" name="email" placeholder="e.g. john@gmail.com" required>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>
                </div>

                <button type="submit" class="submit-btn">Contact Us</button>
            </form>
        </div>

        <aside class="contact-right">
            <div class="info-label">Contact</div>
            <a href="mailto:seriemeter@gmail.com" class="info-email">seriemeter@gmail.com</a>

            <div class="social-links">
                <a href="#"><img src="assets/icon/facebook.svg" alt="FB"></a>
                <a href="#"><img src="assets/icon/instagram.svg" alt="IG"></a>
                <a href="#"><img src="assets/icon/linkedin.svg" alt="LI"></a>
            </div>
        </aside>
    </div>

    <%@ include file="/components/footer.jsp"%>

</body>
</html>