package Address;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.GetData;

/**
 * Servlet implementation class UpdateAddress
 */
@WebServlet(name = "UpdateAddress", urlPatterns = { "/UpdateAddress" })
public class UpdateAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String address=request.getParameter("add");
        String username=request.getParameter("username");
        String uid=request.getParameter("uid");
        String mobile=request.getParameter("mno");
        try
        {
            boolean result=GetData.addEditDocument(username, address, uid,mobile);
            if(result)
            {
                out.print("Updated Successfully!!!");
            }
            else
            {
                out.print("not updated");
            }
        }
        catch(Exception ex)
                {
                    out.print("exception"+ex.getMessage());
                    ex.printStackTrace();
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
