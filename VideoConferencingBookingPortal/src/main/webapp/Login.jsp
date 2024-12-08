<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>

<html lang="en">



<head>

 <meta charset="UTF-8">

 <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <title>Login - Video Conference Booking</title>

 <link rel="stylesheet" href="LoginStyle.css">

</head>



<body>

 <header>

  <h1 style="color:white">Conference Room Booking Portal</h1>

 </header>



 <nav class="navbar">

  <a href="Index.html">Home</a>

  <a href="Register.jsp">Register</a>


 </nav>



 <div class="container">

  <div class="image-container" style="flex: 1;">

   <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGoW36HrEDEkWOvTJ_q9C8u_c_A_B37oft6g&s" alt="Login Illustration">

  </div>



  <div class="form-container" style="flex: 1;">

   <h1>Login</h1>

   <form action="LoginServlet" method="post" id="loginForm" onsubmit="return validateLoginForm(event)">

    <label for="username">Username:</label>

    <input type="text" id="username" name="empid" required placeholder="Enter your Employee Id">

    <label for="password">Password:</label>

    <input type="password" id="password" name="password" required minlength="8" placeholder="Enter your password">

    <button type="submit">Login</button>

   </form>

   <% if (request.getAttribute("errorMessage") != null) { %>

    <div class="error-message" style="color:red; margin-top: 15px;">

     <%= request.getAttribute("errorMessage") %>

    </div>

   <% } %>

   <div class="signup-link">

    <p>New user? <a href="Register.jsp">Sign up here</a></p>

   </div>

  </div>

 </div>
 <div class="footer">
  <p>2024 Video Conference Booking. All rights reserved.</p>
   <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>

 </div>



 <script>

  function validateLoginForm(event) {

   const username = document.getElementById("username").value.trim();

   const password = document.getElementById("password").value;

   if (username === "" || password === "") {

    alert("Please fill in all fields.");

    return false;

   }

   if (password.length < 8) {

    alert("Password must be at least 8 characters long.");

    return false;

   }

   return true;

  }

 </script>

</body>



</html>