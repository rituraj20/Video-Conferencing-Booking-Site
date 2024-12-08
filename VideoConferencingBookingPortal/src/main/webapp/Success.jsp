<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            animation: fadeIn 1.5s ease-in-out; /* Animation for entire page */
        }
        .box {
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            transform: scale(0);
            animation: scaleUp 1s forwards 0.5s; /* Animation for box scale */
        }
        .box .top {
            background: #4caf50; /* Green background for success */
            height: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            opacity: 0;
            animation: fadeInTop 1s forwards 0.5s; /* Fade-in for top box */
        }
        .box .top .success-icon img {
            width: 60px;
            height: 60px;
        }
        .box .top .message {
            font-size: 24px;
            font-weight: bold;
            color: #ffffff;
            margin-top: 10px;
        }
        .box .bottom {
            background: #ffffff; /* White background for details */
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #333333;
            transform: translateY(30px);
            animation: slideIn 1s forwards 1s; /* Slide-in for bottom box */
        }
        .box .bottom p {
            font-size: 16px;
            margin: 5px 0;
        }
        .box .bottom #countdown {
            font-weight: bold;
            color: #ff5722;
            font-size: 20px;
            animation: pulse 1s infinite;
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        @keyframes scaleUp {
            0% {
                transform: scale(0);
            }
            100% {
                transform: scale(1);
            }
        }
        @keyframes fadeInTop {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        @keyframes slideIn {
            0% {
                transform: translateY(30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
                color: #ff5722;
            }
            50% {
                transform: scale(1.1);
                color: #ff7043;
            }
            100% {
                transform: scale(1);
                color: #ff5722;
            }
        }
        button {
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 14px;
            background: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        button:hover {
            background: #388e3c;
            transform: scale(1.05); /* Button hover effect */
        }
    </style>
    <script>
        let countdown = 10; // Start countdown from 5 seconds
        function startCountdown() {
            const countdownElement = document.getElementById('countdown');
            const interval = setInterval(() => {
                countdownElement.textContent = countdown; // Update the countdown display
                countdown--;

                if (countdown < 0) {
                    clearInterval(interval); // Stop the countdown
                    window.location.href = "Login.jsp"; // Redirect to login page
                }
            }, 1000); // Update every second
        }
        window.onload = startCountdown; // Start the countdown when the page loads
    </script>
</head>
<body>
    <div class="box">
        <div class="top">
            <div class="success-icon">
                <img src="success.png" alt="Success">
            </div>
            <div class="message">Success</div>
        </div>
        <div class="bottom">
            <p>Welcome, <strong><%= request.getAttribute("name") %></strong>.</p>
            <p>Your User ID is: <strong><%= request.getAttribute("empid") %></strong></p>
            <p>Redirecting to the login page in <span id="countdown">10</span> seconds.</p>
            <button onclick="window.location.href='Login.jsp'">Go to Login Now</button>
        </div>
    </div>
</body>
</html>