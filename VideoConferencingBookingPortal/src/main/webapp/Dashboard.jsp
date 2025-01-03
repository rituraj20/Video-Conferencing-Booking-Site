<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <title>Conference Room Booking Portal</title>
	 <link rel="stylesheet" href="stylesDashboard.css">
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
        <a href="Booking.jsp">Book Us</a>
        <a href="#footer">Contact</a>
    </nav>

    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section">
            <div class="hero-text">
                <h2>Book the Perfect Conference Room for Your Meetings</h2>
                <p>Whether you're planning a business meeting, a presentation, or a team workshop, we have the right room for you. Find rooms in prime locations with all the amenities you need for a successful event.</p>
                <button onclick="window.location.href='Booking.jsp'">Get Started</button>
            </div>
            <img src="https://cdn.pixabay.com/photo/2015/07/02/09/52/meeting-room-828547_640.jpg" alt="Conference Room">
        </div>

        <!-- Sample Conference Rooms Section -->
        <div class="sample-rooms-section">
            <h3>Sample Conference Rooms</h3>
            <div class="room-cards">
                <div class="room-card">
                    <img src="https://smartsystems.imgix.net/Top-Floor-Executive-Boardroom/Top-Floor-Executive-Boardroom%20(1).jpg?w=1200&fit=crop" alt="Room 1">
                    <h4>Executive Boardroom</h4>
                    <p>A spacious room equipped with a large table and video conferencing facilities.</p>
                </div>
                <div class="room-card">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR44g6SABIOsFeCFtJLN3bh1M01jidCqJoPQ&s" alt="Room 2">
                    <h4>Creative Workshop Space</h4>
                    <p>A vibrant space with whiteboards and seating arrangements to foster collaboration.</p>
                </div>
                <div class="room-card">
                    <img src="https://img.freepik.com/premium-photo/large-auditorium-with-large-screen-that-says-room_1034928-1018.jpg?semt=ais_hybrid" alt="Room 3">
                    <h4>Large Conference Hall</h4>
                    <p>Perfect for larger gatherings, equipped with a projector and sound system.</p>
                </div>
            </div>
        </div>

        <!-- Services Section -->
           <div class="services-section">
    <h3>Why Choose Us?</h3>
    <div class="services">
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJmLkEcHRqZFNdcYI981nBjLay3hoOgjo1IA&s" alt="High-Speed Wi-Fi" width="50">
                    <h4>High-Speed Wi-Fi</h4>
                </div>
                <div class="flip-card-back">
                    <p>All rooms come equipped with fast, reliable internet access.<br>
                      Stay connected and enjoy seamless video conferencing.</p>
                </div>
            </div>
        </div>
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvIgLbNrswmEa_Jz_7mK-WheSUUJO00z4Kdg&s" alt="24/7 Support" width="50">
                    <h4>24/7 Support</h4>
                </div>
                <div class="flip-card-back">
                    <p>Our team is available around the clock for assistance.<br>
                      	Quick resolution of any issues that may arise.</p>
                </div>
            </div>
        </div>
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <img src="https://img.freepik.com/free-photo/futuristic-school-classroom-future-students_23-2150906095.jpg" alt="Modern Facilities" width="50">
                    <h4>Modern Facilities</h4>
                 </div>
                <div class="flip-card-back">
                    <p>Comfortable and productive environment for your team.<br>
			Fully equipped rooms for all your meeting needs.</p>
                </div>
            </div>
        </div>
    </div>
</div>

        <!-- About Section -->
        <div class="about-section">
            <img src="https://t4.ftcdn.net/jpg/01/08/34/53/360_F_108345358_mREIebrNXJM0iuAlxvEshj1j2QrhhzpK.jpg" alt="About Us">
            <div class="about-text">
                <h3>About Us</h3>
                <p>Our platform streamlines the process of finding and booking conference rooms. With prime locations throughout the city, we offer modern, tech-enabled spaces for every meeting need. From high-speed Wi-Fi to professional setups and on-call support, each space is designed for productivity and convenience, making it easy to host successful business meetings without the hassle.<br>

Book confidently with transparent pricing and flexible options to suit any gathering size. Let us handle the details so you can focus on a productive, impactful meeting</p>
            </div>
        </div>

        <!-- Customer Reviews Section -->
        <div class="reviews-section">
            <h3>What Our Customers Say</h3>
            <div class="reviews">
                <div class="review-card">
                    <p>"Fantastic service! The room was spacious and had all the amenities we needed for a successful presentation."</p>
                    <div class="review-author">- Ritu Raj Singh, Java Backend Developer</div>
                </div>
                <div class="review-card">
                    <p>"Booking a conference room was quick and easy, and the support team was very responsive."</p>
                    <div class="review-author">- Sagar Saekar, Manager</div>
                </div>
                <div class="review-card">
                    <p>"Highly recommend! The environment was professional and perfect for our team workshop."</p>
                    <div class="review-author">- Sonali Deshmukh, HR Specialist</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer id = "footer">
        <p>&copy; 2024 Conference Room Booking Portal | <a href="terms.jsp">Terms of Service</a> | <a href="privacy.jsp">Privacy Policy</a></p>
        <div class="contact-info">
            <p><strong>Contact Us:</strong></p>
            <p>Phone: +123-456-7890</p>
            <p>Email: info@conferenceportal.com</p>
            <div class="social-links">
                <a href="https://instagram.com/yourcompany">Instagram</a> |
                <a href="https://twitter.com/yourcompany">Twitter</a>
            </div>
        </div>
    </footer>

</body>

</html>
