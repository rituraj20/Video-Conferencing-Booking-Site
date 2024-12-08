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
 // Retrieve bookings from request scope

  List<BookingManagement> bookings = (List<BookingManagement>) request.getAttribute("bookings");
%>
<!DOCTYPE html>

<html lang="en">



<head>

 <meta charset="UTF-8">

 <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <title>View Bookings</title>

 <!-- Font Awesome CDN for Icons -->

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

   <link rel="stylesheet" href="ViewStyle.css">


</head>



<body>

 <!-- Navbar -->

 <header>
        <h1>Conference Room Booking Portal</h1>
	<div class="welcome-info">
        <h3>Welcome, <%= name %>!</h3>
        <p>Employee ID: <%= empid %></p>
    </div>
    </header>

    <nav class="navbar">
        <a href="Dashboard.jsp">Home</a>
        <a href="LogoutServlet">Log out</a>
	<a href="Booking.jsp">Book Us </a>
        
    </nav>



 <h2>Your Bookings</h2>


   <div class="container">

        <!-- Display bookings without a table structure -->

    <% 

      if (bookings != null && !bookings.isEmpty()) { 

        for (BookingManagement booking : bookings) { 

    %>

      <div class="booking-info">

        <p><span>Booking ID:</span> <%= booking.getBookingId() %></p>

        <p><span>Date:</span> <%= booking.getDate() %></p>

        <p><span>Start Time:</span> <%= booking.getStartTime() %></p>

        <p><span>End Time:</span> <%= booking.getEndTime() %></p>

        <p><span>Location:</span> <%= booking.getLocation() %></p>



        <!-- Edit and Cancel buttons -->

        <a href="UpdateBooking.jsp?bookingId=<%= booking.getBookingId() %>" class="edit-button">Edit</a>

  

          <a href="deleteBooking?bookingId=<%= booking.getBookingId() %>" class="edit-button" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a>


        

      </div>

    <% 

        }

      } else { 

    %>

      <p><b>No bookings found.</b></p>

    <% 

      } 

    %>

   </div>

 <!-- Back to Dashboard Button -->

 <a href="Dashboard.jsp" class="back-button">Back to Dashboard</a>



 <!-- Footer -->

 <div class="footer">

  © 2024 Video Conference Booking. All rights reserved. <br>

  <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>

 </div>



</body>



</html>
