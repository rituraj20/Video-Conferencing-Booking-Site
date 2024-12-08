package booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CustomerDao;
import bean.CustomerManagement;
import utils.PasswordUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    String empid = request.getParameter("empid");
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String mobileNumber = request.getParameter("mobile_number");
	        String password = request.getParameter("password");
	        String department = request.getParameter("department");
        String confirmPassword = request.getParameter("confirmPassword");
        // Check if password and confirm password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("Register.jsp?error=Passwords do not match");
            return;
        }

        // Hash the password
        String hashedPassword = PasswordUtils.hashPassword(password);
        CustomerManagement customer = new CustomerManagement(empid, name, email, mobileNumber, hashedPassword, department);
        boolean isRegistered = CustomerDao.registerCustomer(customer);

        if (isRegistered) {
        	 request.setAttribute("empid", empid);
             request.setAttribute("name", name);
             request.getRequestDispatcher("Success.jsp").forward(request, response);


        } else {
            request.setAttribute("errorMessage", "Registration failed, try again.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }

           }
	}


