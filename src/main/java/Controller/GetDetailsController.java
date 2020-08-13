package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GetData;
import DTO.ServicesDTO;

/**
 * Servlet implementation class GetDetailsController
 */
@WebServlet(name = "GetDetailsController", urlPatterns = { "/GetDetailsController" })
public class GetDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDetailsController() {
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
		if(sess.getAttribute("id")==null)
		{
			sess.invalidate();
			response.sendRedirect("index.html");
		}
		else
		{	String service=request.getParameter("servicename");
			String id=(String)sess.getAttribute("id");
			try 
			{
			ServicesDTO obj=GetData.getServiceDetails(service, id);
			out.print("<h3>Name:&nbsp;"+(String)sess.getAttribute("name")+"</h3>");
			out.print("<h3>Address:&nbsp;"+GetData.getAddress(id)+"</h3>");
			out.print("<h3>Mobile:&nbsp;"+GetData.getMobile(id)+"</h3>");
			out.print("<h3>Service Acquired:&nbsp;"+obj.getServicename()+"</h3>");
			out.print("<h3>Booking Time:&nbsp;"+obj.getBookingtime().toDate()+"</h3>");
			}
			catch(Exception ex)
			{
				
			}
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
