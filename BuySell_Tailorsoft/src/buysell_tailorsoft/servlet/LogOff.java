package buysell_tailorsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buysell_tailorsoft.beans.Messages;

/**
 * Servlet implementation class LogOff
 */
@WebServlet("/LogOff")
public class LogOff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
	doPost(request, response);	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		
		HttpSession hs=request.getSession(false);
		
		
		
		String userid=(String)hs.getAttribute("idkey");
		String type=(String)hs.getAttribute("typekey");
		
		if(userid!=null)
			hs.removeAttribute(userid);
		if(type!=null &&type!=null)
			
			hs.removeAttribute(userid);
			hs.removeAttribute(type);
		
			hs.invalidate();//it is used to destroy the session

			request.setAttribute("msg", Messages.LOGOUTMESSAGE); RequestDispatcher
			 rd=request.getRequestDispatcher("/jsp/login.jsp"); 
			 rd.forward(request, response);
		
	}
		
	
	
	

}
