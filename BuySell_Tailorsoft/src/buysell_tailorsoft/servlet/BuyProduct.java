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
import buysell_tailorsoft.servlet.AddProduct;
import buysell_tailorsoft.usertask.UserOperations;

/**
 * Servlet implementation class VerifyTask
 */
@WebServlet("/BuyProduct")
public class BuyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProduct() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String[]mids=request.getParameterValues("chkmessage");
		String verifystatus=request.getParameter("btn");
		
		
		System.out.println(mids + verifystatus);
		
		UserOperations task=UserOperations.getInstance();
		
		int status=	task.buyProduct(mids,verifystatus);
		if(status==0)
		{
			request.setAttribute("msg1", Messages.BUYPRODUCT);
	    	   RequestDispatcher r=request.getRequestDispatcher("/jsp/buyproduct.jsp");
	    	   r.forward(request, response);

			//response.sendRedirect("/BuySell_TailorSoft/jsp/buyproduct.jsp");
		}
		
	
	}



}
