package dao;
import connection.DatabaseConnection;
import bean.CustomerManagement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDao {

    // Method for registering a customer
    public static boolean registerCustomer(CustomerManagement customer) {
        String sql = "INSERT INTO Customer (empid, name, email, mobile_number, password, department) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DatabaseConnection.dbConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customer.getEmpid());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getMobileNumber());
            ps.setString(5, customer.getPassword());
            ps.setString(6, customer.getDepartment());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            
            return false;
        }
    }

    // Method for login customer
    public CustomerManagement loginCustomer(String empid, String password) {
        String sql = "SELECT * FROM Customer WHERE empid = ? AND password = ?";
        try (Connection con = DatabaseConnection.dbConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, empid);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new CustomerManagement(
                        rs.getString("empid"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("mobile_number"),
                        rs.getString("password"),
                        rs.getString("department")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
