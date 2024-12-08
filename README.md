# Video-Conferencing-Booking-Site

**Overview**

The Video Conferencing Booking Portal is a Java-based web application that allows users to book, view, update, and delete conference room reservations. It includes user registration, login/logout functionality, session management, and room availability validation. The project is designed to simplify the booking process for employees and ensure efficient use of conference rooms.

**Features**

**1. User Management:**
        Register a new account.
        Secure login with session management.
        Logout functionality with session invalidation.
**2. Booking Management:**
        Create bookings for available rooms.
        View all bookings for the logged-in user.
        Update or delete existing bookings.
        Suggest alternate rooms and timings when rooms are occupied.
**3. Error Handling:**
        Custom error pages for 404 and 500 errors.
**4. Security:**
        Passwords are hashed before storing in the database.
        Sessions are securely maintained and expire after inactivity.
        
**Technologies Used**

Frontend: JSP, HTML, CSS
Backend: Java Servlets, JDBC
Database: MySQL
Development Environment: Eclipse IDE
Build Tool: Maven

**Database Schema**

**Customer Table
Stores user details.**

**Column Name	Data Type	Constraints** 

empid	VARCHAR(10)	PRIMARY KEY
name	VARCHAR(50)	NOT NULL
email	VARCHAR(50)	UNIQUE, NOT NULL
mobile_number	VARCHAR(15)	NOT NULL
password	VARCHAR(255)	NOT NULL
department	VARCHAR(20)	NOT NULL

**Booking Table**
**Stores booking details.**

Column Name	Data Type	Constraints
booking_id	INT	PRIMARY KEY, AUTO_INCREMENT
empid	VARCHAR(10)	FOREIGN KEY REFERENCES Customer(empid)
location	VARCHAR(50)	NOT NULL
date	DATE	NOT NULL
start_time	TIME	NOT NULL
end_time	TIME	NOT NULL

**Project Structure**

css
Copy code
src/
├── com.project.bean/
│   ├── CustomerManagement.java
│   ├── BookingManagement.java
├── com.project.dao/
│   ├── CustomerDao.java
│   ├── BookingDao.java
├── com.project.servlet/
│   ├── RegisterServlet.java
│   ├── LoginServlet.java
│   ├── LogoutServlet.java
│   ├── CreateBookingServlet.java
│   ├── ViewBookingServlet.java
│   ├── EditBookingServlet.java
│   ├── DeleteBookingServlet.java
├── webapp/
│   ├── WEB-INF/
│   │   ├── web.xml
│   ├── css/
│   │   ├── style.css
│   ├── jsp/
│   │   ├── Register.jsp
│   │   ├── Login.jsp
│   │   ├── Dashboard.jsp
│   │   ├── CreateBooking.jsp
│   │   ├── ViewBookings.jsp
│   │   ├── EditBooking.jsp
│   │   ├── Error404.jsp
│   │   ├── Error500.jsp


**Setup Instructions**

    Prerequisites
    JDK 8 or later
    Apache Tomcat server
    Derby database
    Eclipse IDE (or any Java IDE)
    
**Steps**
Clone the Repository:

bash
Copy code
git clone https://github.com/your-repo/video-conferencing-booking-portal.git
cd Video-Conferencing-Booking-Portal

Setup the Database:

Create a Derby database named booking_portal.
Run the SQL scripts provided in db/ folder to set up the schema and tables.
Import the Project:

Open Eclipse IDE.
Import the project as a Maven project.
Configure Database Connection:

Edit the DatabaseConnection class to include your Derby credentials:
java
Copy code
String dbURL = "url of database";

Deploy to Tomcat:

Build the project using Maven.
Deploy the WAR file to Apache Tomcat.
Run the Application:

Access the application at http://localhost:8080/video-conferencing-booking-portal.

**API Endpoints**

    User Registration: /RegisterServlet
    User Login: /LoginServlet
    Create Booking: /CreateBookingServlet
    View Bookings: /ViewBookingServlet
    Edit Booking: /EditBookingServlet
    Delete Booking: /DeleteBookingServlet

**Usage**

**Register:**
    Fill in user details on the Registration page.
**Login:**
    Log in with empid and password.
**Dashboard:**
    Access booking options.
**Create Booking:**
    Select a room, date, and time.
**View Bookings:**
    View, edit, or delete existing bookings.
**Logout:**
    Click "Logout" to end the session.
**Error Handling**
    Custom error pages for 404 (Not Found) and 500 (Server Error).
**Future Enhancements**
    Add email notifications for booking confirmations.
    Implement advanced search filters for bookings.
    Introduce admin roles for managing users and bookings.

**Contributors**

Ritu Raj Singh

Feel free to contribute to the project by creating pull requests or raising issues.
