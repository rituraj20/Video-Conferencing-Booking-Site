
package booking;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ErrorHandlerServlet")
public class ErrorHandlerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve error details
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");

        // Redirect to appropriate JSP based on status code
        if (statusCode == 404) {
        	response.sendRedirect("404.jsp");
        } else if (statusCode == 500) {
        	response.sendRedirect("500.jsp");
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Delegate POST to GET
    }
}
