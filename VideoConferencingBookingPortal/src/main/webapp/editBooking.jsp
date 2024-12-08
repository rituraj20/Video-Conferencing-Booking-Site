<%@ page import="bean.BookingManagement" %>
<%@ page import="dao.BookingDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
    String successMessage = (String) request.getAttribute("successMessage"); // Check if update success message exists
    BookingManagement booking = new BookingManagement();
    for (BookingManagement b : BookingDao.getBookingsByEmpId((String) session.getAttribute("empid"))) {
        if (b.getBookingId() == bookingId) {
            booking = b;
            break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Booking</title>
    <style>
        .success-message {
            color: green;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .countdown-timer {
            font-size: 18px;
            font-weight: bold;
            color: blue;
            margin-top: 10px;
        }
    </style>
    <script>
        function startCountdown(seconds) {
            const timerElement = document.getElementById("countdown-timer");
            let remainingSeconds = 5;

            const interval = setInterval(() => {
                timerElement.textContent = `Redirecting to View Booking in ${remainingSeconds} seconds...`;
                remainingSeconds--;

                if (remainingSeconds < 0) {
                    clearInterval(interval);
                    window.location.href = "viewBookings.jsp";
                }
            }, 1000);
        }

        window.onload = function () {
            <% if (successMessage != null) { %>
                startCountdown(5); // Start the countdown with 5 seconds
            <% } %>
        };
    </script>
</head>
<body>
    <h1>Edit Booking</h1>

    <% if (successMessage != null) { %>
        <div class="success-message">
            Booking updated successfully!
        </div>
        <div id="countdown-timer" class="countdown-timer"></div>
    <% } %>

    <form action="updateBooking" method="post">
        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">

        <label for="location">Location:</label>
        <select id="location" name="location">
            <option value="Tikona" <%= "Tikona".equals(booking.getLocation()) ? "selected" : "" %>>Tikona</option>
            <option value="Poorna" <%= "Poorna".equals(booking.getLocation()) ? "selected" : "" %>>Poorna</option>
            <option value="Gauma" <%= "Gauma".equals(booking.getLocation()) ? "selected" : "" %>>Gauma</option>
            <option value="Trauma" <%= "Trauma".equals(booking.getLocation()) ? "selected" : "" %>>Trauma</option>
            <option value="Pvrxl" <%= "Pvrxl".equals(booking.getLocation()) ? "selected" : "" %>>Pvrxl</option>
            <option value="Tracky" <%= "Tracky".equals(booking.getLocation()) ? "selected" : "" %>>Tracky</option>
            <option value="Ripuwaa" <%= "Ripuwaa".equals(booking.getLocation()) ? "selected" : "" %>>Ripuwaa</option>
        </select>
        <input type="hidden" name="defaultLocation" value="<%= booking.getLocation() %>">
        <br>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= booking.getDate() != null ? booking.getDate().toString() : "" %>">
        <br>

        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= booking.getStartTime() != null ? booking.getStartTime().toString().substring(0, 5) : "" %>">
        <br>

        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= booking.getEndTime() != null ? booking.getEndTime().toString().substring(0, 5) : "" %>">
        <br>
        
        <button type="submit">Update Booking</button>
    </form>

</body>
</html>
