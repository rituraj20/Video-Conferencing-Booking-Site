package booking;

import bean.BookingManagement;

import dao.BookingDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/updateBooking")
public class updateBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String location = request.getParameter("location");
        Date date = Date.valueOf(request.getParameter("date"));
        Time startTime = Time.valueOf(request.getParameter("startTime") + ":00");
        Time endTime = Time.valueOf(request.getParameter("endTime") + ":00");

        BookingManagement booking = new BookingManagement();
        booking.setBookingId(bookingId);
        booking.setLocation(location);
        booking.setDate(date);
        booking.setStartTime(startTime);
        booking.setEndTime(endTime);
        if (BookingDao.isRoomAvailable(location, date, startTime, endTime)){

        if (BookingDao.updateBooking(booking)) {
            response.sendRedirect("viewBooking");
        } else {
            request.setAttribute("errorMessage", "Failed to update booking. Please try again.");
            request.getRequestDispatcher("UpdateBooking.jsp").forward(request, response);
        } }
        else {
            request.setAttribute("errorMessage", "Room is already booked. Try a different time or location.");
            request.getRequestDispatcher("UpdateBooking.jsp").forward(request, response);
        }
    
}
}
