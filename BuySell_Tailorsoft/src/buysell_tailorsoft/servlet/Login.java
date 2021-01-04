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
import buysell_tailorsoft.beans.UsersLogin;
import buysell_tailorsoft.commontask.LoginTask;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Userid=request.getParameter("userid").trim();
		String Password=request.getParameter("userpass");
		
		System.out.println("Userid is:"+Userid+"User Password is:"+Password);
		
		UsersLogin u=new UsersLogin();
		u.setId(Userid);
		u.setPass(Password);
		
		LoginTask login=LoginTask.getInstance();
		String userdata=login.authenticateUser(u);
		System.out.println(userdata);
		if(userdata!=null)
		{
			
			String[] userdetails=userdata.split(",");
			String type=userdetails[0];
			
			String status=userdetails[1];
			
			System.out.println(type+status);
			
			HttpSession hs=request.getSession();
			hs.setAttribute("idkey", Userid); //We are binding Userid within session
			hs.setAttribute("typekey", type);
			hs.setMaxInactiveInterval(120);  //120 in seconds  (it is used for automatic session destroy with 120 seconds i.e; logout)
			          if(type.equalsIgnoreCase("ur"))
			          {
			        response.sendRedirect("/BuySell_TailorSoft/jsp/userhome.jsp");
			          }
			          
			/*
			 * if(type.equalsIgnoreCase("ur2")) {
			 * response.sendRedirect("#"); }
			 */
		}
		else {
			request.setAttribute("msg", Messages.LOGIN_ERROR);
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response);
		}
	}

}
