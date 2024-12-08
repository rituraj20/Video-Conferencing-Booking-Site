    
        
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
<%@ page import="bean.BookingManagement" %>
<%@ page import="dao.BookingDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
	
    BookingManagement booking = new BookingManagement();
    for (BookingManagement b : BookingDao.getBookingsByEmpId((String) session.getAttribute("empid"))) {
        if (b.getBookingId() == bookingId) {
            booking = b;
            break;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Booking</title>
    <link rel="stylesheet" href="UpdateStyle.css">
</head>
<body>
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
	<a href="viewBooking">View Bookings </a>
        
    </nav>
    <div class="container">
        <h2>Update Booking</h2>
      
         <form action="updateBooking" method="post"   onsubmit="return validateForm()">

            <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
        
        <label for="location">Location:</label>
        <select id="location" name="location" >
    <option value="Tikona" <%= "Tikona".equals(booking.getLocation()) ? "selected" : "" %>>Tikona</option>
    <option value="Poorna" <%= "Poorna".equals(booking.getLocation()) ? "selected" : "" %>>Poorna</option>
    <option value="Gauma" <%= "Gauma".equals(booking.getLocation()) ? "selected" : "" %>>Gauma</option>
    <option value="Trauma" <%= "Trauma".equals(booking.getLocation()) ? "selected" : "" %>>Trauma</option>
    <option value="Pvrxl" <%= "Pvrxl".equals(booking.getLocation()) ? "selected" : "" %>>Pvrxl</option>
    <option value="Tracky" <%= "Tracky".equals(booking.getLocation()) ? "selected" : "" %>>Tracky</option>
    <option value="Ripuwaa" <%= "Ripuwaa".equals(booking.getLocation()) ? "selected" : "" %>>Ripuwaa</option>
</select>

        <br>
			
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= booking.getDate()!=null?booking.getDate().toString():"" %>" >
        <br>

        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= booking.getStartTime()!=null?booking.getStartTime().toString().substring(0,5):"" %>">
        <br>

        <label for="endTime">End Time:</label>
         <input type="time" id="endTime" name="endTime" value="<%= booking.getEndTime()!=null?booking.getEndTime().toString().substring(0,5):"" %>">
        <br>
        <button type="submit">Update Booking</button>
    </form>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error-message"  >
        <%= request.getAttribute("errorMessage") %>
    </div>
<% } %>
    </div>
    
    <div class="footer">

    © 2024 Video Conference Booking. All rights reserved. <br>

    <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>

  </div>
  
   <script>

   document.addEventListener("DOMContentLoaded", () => {

		  const today = new Date().toISOString().split("T")[0]; // Get today's date in YYYY-MM-DD format

		  const currentTime = new Date().toLocaleTimeString("en-US", { hour12: false }).slice(0, 5); // Get current time in HH:MM format

		  // Set the minimum date for the date input
		  document.getElementById("date").setAttribute("min", today);
		  // Set the minimum time for the start time input if the selected date is today

		  document.getElementById("date").addEventListener("change", (event) => {

		   const selectedDate = event.target.value;

		   const startTimeInput = document.getElementById("startTime");

		   if (selectedDate === today) {

		    startTimeInput.setAttribute("min", currentTime);

		   } else {

		    startTimeInput.removeAttribute("min"); // Remove the min time for future dates

		   }

		  });

		 });
  function validateForm() {

	  
	   const date = document.getElementById("date").value;

	   const startTime = document.getElementById("startTime").value;

	   const endTime = document.getElementById("endTime").value;

	


	   // Check that end time is after start time

	   if (startTime >= endTime) {

	    alert("End time must be later than start time.");

	    return false;

	   }


	   return true;

	  }
  </script>
</body>
</html>