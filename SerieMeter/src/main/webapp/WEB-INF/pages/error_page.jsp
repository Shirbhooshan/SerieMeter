<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Page</title>

<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
	
	<style>
       
        body {
            font-family: 'Manrope', sans-serif;
            background-color: #ffffff;
            color: #111111;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* -- Main Content Layout -- */
        main {
            flex: 1; 
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .error-container {
            display: flex;
            align-items: center;
            justify-content: center;
            /* Widened the max-width to bring content closer to the sides */
            max-width: 1400px; 
            width: 100%;
            gap: 200px;
        }

        /* --- Left Side Styles --- */
        .left-side {
            display: flex;
            flex-direction: column;
            margin-top: 110px; /* Shifting slightly down to create that vertical offset look */
        }

        .error-code {
            color: #888888;
            font-size: 15px;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 15px; 
            margin-left: 50px; 
        }

        .error-number {
            font-size: 350px; 
            font-weight: 500; 
            line-height: 0.75; /* Keeps the text block tight vertically */
            letter-spacing: -18px;
            color: #0a0a0a;
            margin-top: 25px;
        }

        /* --- Right Side Styles --- */
        .right-side {
            max-width: 440px; /* Controls the line breaks of the paragraph */
            margin-right: 75px;
        }

        h1 {
            font-size: 46px; 
            font-weight: 700;
            margin-bottom: 12px;
            letter-spacing: -1px;
        }

        .description {
            color: #888888;
            font-size: 18px; 
            line-height: 1.6;
            margin-bottom: 35px;
            font-weight: 400;
            text-align: justify
        }

        /* --- Button Styles --- */
        .buttons {
            display: flex;
            gap: 26px;
        }

        .btn {
            text-decoration: none;
            padding: 16px 38px;
            border-radius: 30px; 
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-green {
            background-color: #34a853; 
            color: #ffffff;
            border: 1px solid #34a853;
        }

        .btn-green:hover {
            background-color: #2b8b45; 
            border-color: #2b8b45;
            opacity: 0.82;
        	transform: translateY(-2px);
        }

        .btn-outline {
            background-color: #f7f7f7; /* Added subtle grey color inside */
            color: #555555;
            border: 1px solid #dcdcdc;
        }

        .btn-outline:hover {
            background-color: #e5e5e5; /* New slightly darker grey hover effect */
            color: #111111;
            opacity: 0.82;
        	transform: translateY(-2px);
        }

        /* --- Footer Styles --- */
        footer {
            text-align: center;
            padding: 30px 20px;
            color: #b0b0b0;
            font-size: 14px;
            text-transform: uppercase;
        }

    </style>
</head>
<body>

    <main>
        <div class="error-container">
            
            <div class="left-side">
                <p class="error-code">Error Code</p>
                <div class="error-number">404</div>
            </div>

            <div class="right-side">
                <h1>Scene Not Found.</h1>
                <p class="description">
                    This chapter of your cinematic journey doesn’t exist. The script has reached an unexpected end.
                </p>
                
                <div class="buttons">
                    <a href="#" class="btn btn-green">Return home</a>
                    <a href="#" class="btn btn-outline">Search library</a>
                </div>
            </div>

        </div>
    </main>

    <footer>
        &copy;2026 SERIEMETER
    </footer>

</body>
</html>