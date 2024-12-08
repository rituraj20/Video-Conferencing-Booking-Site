package booking;
import dao.BookingDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteBooking")
public class deleteBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("empid") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        if (BookingDao.deleteBooking(bookingId)) {
            response.sendRedirect("viewBooking"); // Redirect to view bookings after deletion
        } else {
            request.setAttribute("errorMessage", "Failed to delete the booking.");
            request.getRequestDispatcher("ViewBookings.jsp").forward(request, response);
        }
    }
}
