package Session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionAdd
 */
@WebServlet(name = "SessionAdd", urlPatterns = { "/SessionAdd" })
public class SessionAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		 HttpSession sess=request.getSession();
		 ServletContext ct=getServletContext();
		// String logout=(String)ct.getAttribute("logout");
		 sess.setMaxInactiveInterval(3000000);
		
         String sessiondel=request.getParameter("delsession");
                 if(sessiondel!=null)
                 {
                     sess.invalidate();
                     response.sendRedirect("index.html");
                 }
                 else
                 {
                	 String name=request.getParameter("name");
                     String img=request.getParameter("img");
                     String email=request.getParameter("email");
                     String id=request.getParameter("id");
                     
                     sess.setAttribute("name",name);
                     sess.setAttribute("img", img);
                     sess.setAttribute("email", email);
                     sess.setAttribute("id", id);
                 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
