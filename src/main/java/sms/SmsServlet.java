package sms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import com.twilio.Twilio;
import java.io.PrintWriter;
import DAO.GetData;

/**
 * Servlet implementation class SmsServlet
 */
public class SmsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String  ACCOUNT_SID = "acc_sid";
	  public static final String AUTH_TOKEN = "auth_token"; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SmsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession sess=request.getSession();
	    RequestDispatcher rd;
	    String name=(String)sess.getAttribute("name");
	    String uid=(String)sess.getAttribute("id");
	    if(name!=null)
	    {
	        
	   String service =request.getParameter("service");
	   String time=request.getParameter("time");
	   String consulting =request.getParameter("consulting");
	    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    try
	    {
	        String address=GetData.getAddress(uid);
	        String mobile=GetData.getMobile(uid);
	        String applicant="Name:"+name+"\n"+"Address:"+address+"\n"+"Mobile:"+mobile+"\n"+"Service Required:"+service+"\n"+"Time:"+time;
	        if(address==null || mobile==null)
	        {   
	          
	        	response.sendRedirect("Profile.jsp");
	        }
	        else if(address.length()==(int)0 || mobile.length()<10)
	        {
	        	 response.sendRedirect("Profile.jsp");
	        }
	        else
	        {
	        	if(consulting==null)
	        	{
	        		Message message = Message.creator(new PhoneNumber("to"),new PhoneNumber("bought twilio number"), applicant).create();
		   			boolean result=GetData.setService(uid, service);
		            request.setAttribute("ServiceRequired",service);
		            request.setAttribute("Time",time);
		            rd=request.getRequestDispatcher("BookingStatus.jsp");
		            rd.forward(request, response);
	        	}
	        	else
	        	{	applicant=applicant+"\nConsulting";
	        		Message message = Message.creator(new PhoneNumber("to"),new PhoneNumber("bought twilio number"), applicant).create();
//		   			boolean result=GetData.setService(uid, service);
		            request.setAttribute("ServiceRequired",service);
		            request.setAttribute("Time",time);
		            System.out.print("HElloooooo1");
		            rd=request.getRequestDispatcher("BookingStatus.jsp");
		            System.out.print("Hellooooo2");
		            rd.forward(request, response);
	        	}
	        }
	    }
	    catch(Exception ex)
	    {
	       out.print("Sorry for inconvenience !! Try later");
	       
	    }
	        }
	    else
	    {	
	        sess.invalidate();
	        response.sendRedirect("index.html");
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
