package dao;
import connection.DatabaseConnection;
import bean.BookingManagement;
import java.sql.*;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
public class BookingDao {
    public static boolean isRoomAvailable(String location, Date date, Time startTime, Time endTime) {
        try (Connection con = DatabaseConnection.dbConnect()) {
            String sql = "SELECT COUNT(*) FROM Booking WHERE location = ? AND date = ? " +
                         "AND ((start_time < ? AND end_time > ?) OR " +
                         "(start_time < ? AND end_time > ?) OR " +
                         "(start_time >= ? AND end_time <= ?))";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, location);
            ps.setDate(2, date);
            ps.setTime(3, endTime);
            ps.setTime(4, startTime);
            ps.setTime(5, startTime);
            ps.setTime(6, endTime);
            ps.setTime(7, startTime);
            ps.setTime(8, endTime);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0; // True if no conflicting bookings found
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean createBooking(BookingManagement booking) {
        try (Connection con = DatabaseConnection.dbConnect()) {
            String sql = "INSERT INTO Booking (empid, location, date, start_time, end_time) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, booking.getEmpId());
            ps.setString(2, booking.getLocation());
            ps.setDate(3, booking.getDate());
            ps.setTime(4, booking.getStartTime());
            ps.setTime(5, booking.getEndTime());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<BookingManagement> getBookingsByEmpId(String empId) {
        List<BookingManagement> bookings = new ArrayList<>();
        try (Connection con = DatabaseConnection.dbConnect()) {
            String sql = "SELECT * FROM Booking WHERE empid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, empId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingManagement booking = new BookingManagement();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setEmpId(rs.getString("empid"));
                booking.setLocation(rs.getString("location"));
                booking.setDate(rs.getDate("date"));
                booking.setStartTime(rs.getTime("start_time"));
                booking.setEndTime(rs.getTime("end_time"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    public static boolean deleteBooking(int bookingId) {
        try (Connection con = DatabaseConnection.dbConnect()) {
            String sql = "DELETE FROM Booking WHERE booking_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bookingId);

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateBooking(BookingManagement booking) {
        try (Connection con = DatabaseConnection.dbConnect()) {
            String sql = "UPDATE Booking SET location = ?, date = ?, start_time = ?, end_time = ? WHERE booking_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, booking.getLocation());
            ps.setDate(2, booking.getDate());
            ps.setTime(3, booking.getStartTime());
            ps.setTime(4, booking.getEndTime());
            ps.setInt(5, booking.getBookingId());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}