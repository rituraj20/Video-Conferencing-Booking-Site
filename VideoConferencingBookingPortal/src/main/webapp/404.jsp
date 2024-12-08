<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Error - Page Not Found</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
            flex-direction: column;
            animation: fadeIn 1s ease-in-out;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            transform: scale(0);
            animation: scaleUp 1s forwards 0.5s;
        }

        h1 {
            font-size: 80px;
            color: #d9534f;
            margin-bottom: 20px;
            font-weight: bold;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #555;
        }

        button {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            transform: scale(1.1);
            background-color: #218838;
        }

        /* Animation for fading in the page */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        /* Animation for scaling up the container */
        @keyframes scaleUp {
            0% {
                transform: scale(0);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>404</h1>
        <p>Oops! The page you are looking for doesn't exist.</p>
        <button onclick="window.location.href='Index.html'">Go to Home</button>
    </div>

</body>
</html>

