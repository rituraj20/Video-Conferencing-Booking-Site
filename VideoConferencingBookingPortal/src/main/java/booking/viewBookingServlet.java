package booking;
import bean.BookingManagement;
import dao.BookingDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBooking")
public class viewBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session, if it exists
        HttpSession session = request.getSession(false);
        
        // Check if the session is valid and the employee is logged in
        if (session == null || session.getAttribute("empid") == null) {
            response.sendRedirect("Login.jsp");  // Redirect to login page if not logged in
            return;
        }

        // Retrieve the employee ID from the session
        String empId = (String) session.getAttribute("empid");

        // Fetch all bookings for the logged-in employee from the database
        List<BookingManagement> bookings = BookingDao.getBookingsByEmpId(empId);

        // Set bookings attribute to be accessible in JSP
        request.setAttribute("bookings", bookings);

        // Forward the request to the JSP page for display
        request.getRequestDispatcher("ViewBooking.jsp").forward(request, response);
    }
}
