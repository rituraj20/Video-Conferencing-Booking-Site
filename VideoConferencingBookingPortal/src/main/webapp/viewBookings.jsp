<%@ page import="java.util.List" %>
<%@ page import="bean.BookingManagement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("name");
    String empid = (String) session.getAttribute("empid");
    String email = (String) session.getAttribute("email");

    if (name == null || empid == null || email == null) {
        response.sendRedirect("Login.jsp"); // If session is invalid, redirect to login page
        return;
    }
%>

<%
    // Check if the session exists, otherwise redirect to login page
    String empId = (String) session.getAttribute("empid");
    if (empId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    // Retrieve bookings from request scope
    List<BookingManagement> bookings = (List<BookingManagement>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Bookings</title>
    <link rel="stylesheet" href="styles.css"> <!-- Ensure styles.css is correctly linked -->
</head>
<body>
 
    <div class="container">
        <h1>Your Bookings</h1>

        <div class="session-info">
            <p>Welcome, <%= session.getAttribute("name") %> (Employee ID: <%= empId %>)</p>
            <a href="LogoutServlet">Logout</a>
        </div>

        <!-- Bookings Table -->
        <table class="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (bookings != null && !bookings.isEmpty()) { 
                        for (BookingManagement booking : bookings) { 
                %>
                    <tr>
                        <td><%= booking.getBookingId() %></td>
                        <td><%= booking.getDate() %></td>
                        <td><%= booking.getStartTime() %></td>
                        <td><%= booking.getEndTime() %></td>
                        <td><%= booking.getLocation() %></td>
                        <td>
                          <a href="editBooking.jsp?bookingId=<%= booking.getBookingId() %>">Edit</a>
                        
                          <form action="deleteBooking" method="get" style="display: inline;">
                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                        <button type="submit" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</button>
                    </form>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="6">No bookings found.</td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>

        <a href="Dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
