<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String name = (String) session.getAttribute("name");
    String empid = (String) session.getAttribute("empid");
    String email = (String) session.getAttribute("email");

    if (name == null || empid == null || email == null) {
        response.sendRedirect("Login.jsp"); // If session is invalid, redirect to login page
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="container">
        <h1>Welcome, <%= name %>!</h1>
        <p>Employee ID: <%= empid %></p>
        <p>Email: <%= email %></p>
        <form action="LogoutServlet" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>
    <div class="container">
        <h1>Create Booking</h1>

        <form action="BookingServlet" method="post">
            <label for="location">Location</label>
            <select id="location" name="location" required>
                <option value="">Select Location</option>
                <option value="Tikona">Tikona</option>
                <option value="Poorna">Poorna</option>
                <option value="Gauma">Gauma</option>
                <option value="Trauma">Trauma</option>
                <option value="Pvrxl">Pvrxl</option>
                <option value="Tracky">Tracky</option>
                <option value="Ripuwaa">Ripuwaa</option>
            </select>

            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>

            <label for="startTime">Start Time</label>
            <input type="time" id="startTime" name="startTime" required>

            <label for="endTime">End Time</label>
            <input type="time" id="endTime" name="endTime" required>

            <div class="error">
                <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </div>

            <button type="submit">Create Booking</button>
        </form>
    </div>
</body>
</html>
