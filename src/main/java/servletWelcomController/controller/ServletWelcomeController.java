package servletWelcomController.controller;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/welcome")
public class ServletWelcomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Add data for JSP
        req.setAttribute("message", "Welcome to Servlet CRUD Demo (Tomcat 9)!");
        
        // Forward to JSP
        req.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(req, resp);
    }
}
