<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Register - Video Conference Booking</title>
 <link rel="stylesheet" href="RegisterStyle.css">
</head>
<body>
<header>

    <h1 style="color:white;">Conference Room Booking Portal</h1>

  </header>

  <nav class="navbar">

    <a href="Index.html">Home</a>

    <a href="Login.jsp">Log in</a>


    <a href="Login.jsp">Book Us</a>


  </nav>

 <div class="container">

 <h1>Register</h1>

 <form action="RegisterServlet" method="post" id="registerForm" onsubmit="return validateRegistrationForm(event)">
 <label for="empId">Employee ID:</label>
            <input type="text" id="empid" name="empid" required placeholder="Enter your Employee ID">
            
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter your full name">
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email">
            
            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile_number" required placeholder="Mobile number must have 10 digits" pattern="^[0-9]{10}$">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required  placeholder="Password must be 8 character and atleast 1 special and 1 upper case character" >
            
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Re-enter the password">
            
            <label for="department">Department:</label>
            <select id="department" name="department" required>
                <option value="">Select Department</option>
                <option value="IT">IT</option>
                <option value="HR">HR</option>
                <option value="Finance">Finance</option>
                <option value="Sales">Sales</option>
            </select>
  

 <button type="submit">Register</button>

 </form>
 <br>
 <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error-message" style="color:red;" >
        <%= request.getAttribute("errorMessage") %>
    </div>
<% } %>
</div>
<div class="footer">

  © 2024 Video Conference Booking. All rights reserved. <br>

  <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>

 </div>
 
 <script>

 function validateRegistrationForm(event) {
 const empId = document.getElementById("empid").value.trim();
 const fullName = document.getElementById("name").value.trim();
 const email = document.getElementById("email").value.trim();

 const mobile = document.getElementById("mobile").value.trim();

 const password = document.getElementById("password").value;

 const confirmPassword = document.getElementById("confirmPassword").value;

 const department = document.getElementById("department").value;

  

 if (!empId ) {

  alert("Please enter your Employee ID.");

  return false;

 }
 if(isNaN(empId)){
	 alert("Your Employee ID sould be a number.");
	 return false;
 } 
 

	 
 const nameRegex = /^[A-Za-z\s]{1,50}$/;
 if (!nameRegex.test(fullName)) {
     alert("Name must contain only letters and spaces, and be up to 50 characters.");
     return false;
 }

 // Email validation
 const emailRegex = /^[^\s@]+@[^\s@]+\.[a-zA-Z]{2,}$/;
 if (!emailRegex.test(email)) {
     alert("Invalid email format.");
     return false;
 }

 // Mobile number validation: exactly 10 digits
 const mobileNumberRegex = /^\d{10}$/;
 if (!mobileNumberRegex.test(mobile)) {
     alert("Mobile number must be a 10-digit number.");
     return false;
 }

 // Password strength check
 const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@#$!%*?&]{8,}$/;
 if (!passwordRegex.test(password)) {
     alert("Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character, and be at least 8 characters long.");
     return false;
 }


 if (password !== confirmPassword) {

  alert("Passwords do not match.");

  return false;

 }

 if (!department) {

  alert("Please select a Department.");

  return false;

 }

  

 return true;

 }

 </script>

</body>

</html>