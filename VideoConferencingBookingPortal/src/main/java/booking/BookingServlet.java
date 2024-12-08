package booking;
import dao.BookingDao;
import bean.BookingManagement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("empid") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String empId = (String) session.getAttribute("empid");
        String location = request.getParameter("location");
        Date date = Date.valueOf(request.getParameter("date"));
        Time startTime = Time.valueOf(request.getParameter("startTime") + ":00");
        Time endTime = Time.valueOf(request.getParameter("endTime") + ":00");

        BookingManagement booking = new BookingManagement();
        booking.setEmpId(empId);
        booking.setLocation(location);
        booking.setDate(date);
        booking.setStartTime(startTime);
        booking.setEndTime(endTime);

        if (BookingDao.isRoomAvailable(location, date, startTime, endTime)) {
            if (BookingDao.createBooking(booking)) {
                response.sendRedirect("viewBooking");
            } else {
                request.setAttribute("errorMessage", "Booking failed. Please try again.");
                request.getRequestDispatcher("Booking.jsp").include(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Room is already booked. Try a different time or location.");
            request.getRequestDispatcher("Booking.jsp").include(request, response);
        }
    }
}