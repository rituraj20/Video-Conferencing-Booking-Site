    
        
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
     <link rel="stylesheet" href="BookingStyle.css">
   
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
	<a href="viewBooking">View Booking </a>
        
    </nav>

    <div class="container">
        <h2>Book Your Conference Room</h2>

        <form id="bookingForm" action="BookingServlet" method="post"  onsubmit="return validateForm()">
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
             <button type="submit">Create Booking</button>
            <br>

            <div class="error" style="color:red">
                <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </div>

           

            
        </form>
        

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

