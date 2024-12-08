package booking;

import utils.PasswordUtils;
import bean.CustomerManagement;
import dao.CustomerDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private CustomerDao customerDAO = new CustomerDao();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		//doGet(request, response);
		  String userName = request.getParameter("empid");
	        String password = PasswordUtils.hashPassword(request.getParameter("password")); // Hash the password for security
	        
	          CustomerManagement customer= customerDAO.loginCustomer(userName, password);        
	          if (customer != null) {
	              HttpSession session = request.getSession();
	              session.setAttribute("empid", customer.getEmpid());
	              session.setAttribute("name", customer.getName());
	              session.setAttribute("email", customer.getEmail());
	              response.sendRedirect("Dashboard.jsp");
	          } else {
	              request.setAttribute("errorMessage", "Invalid credentials.");
	              request.getRequestDispatcher("Login.jsp").include(request, response);
	          }
	        } 
	    }
	


