package buysell_tailorsoft.usertask;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buysell_tailorsoft.beans.*;
import buysell_tailorsoft.commontask.LoginTask;
import buysell_tailorsoft.usertask.UserOperations;


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }
    int flag;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
flag=1;
		
		String ID=request.getParameter("email");
		System.out.println(ID);
		UserOperations co=UserOperations.getInstance();
		
		co.checkUserId(ID);
		PrintWriter out=response.getWriter();		
		LoginTask task=LoginTask.getInstance();
		boolean status=	task.checkUserId(ID);
		if(status==true)
		{
			flag=2;
			System.out.println("in if"+flag+"in get");
			out.println("*Emailid Already Exist, Please Choose Another One");
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(flag==2)
		{
		System.out.println(flag+"in post");
		request.setAttribute("msg", Messages.AJAXERROR);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/userregistration.jsp");
		rd.forward(request, response);
			
		}
		else
		{
		
		String FirstName= request.getParameter("ufname"); 
		String LastName= request.getParameter("ulname");
		String Mobile= request.getParameter("mobile");
		String Email= request.getParameter("email");
		String City= request.getParameter("city");
		String Password= request.getParameter("password");
		String State= request.getParameter("cmbstate");
		String Genderarr= request.getParameter("Gender");
		
		System.out.println("FirstName is:"+FirstName);
		System.out.println("LastName is:"+LastName);
		System.out.println("Mobile number is:"+Mobile);
		System.out.println("Email id is:"+Email);
		System.out.println("City is:"+City);
		System.out.println("Password is:"+Password);
		System.out.println("State is:"+State);
		System.out.println("Gender is:"+Genderarr);
		
		java.util.Date date=new java.util.Date();
		java.sql.Date dt=new java.sql.Date(date.getTime());
		
	UsersLogin u=new UsersLogin(Email,Password,"true","ur"); 
	
	//bean class object
	User u1=new User(Email, FirstName,  LastName, Mobile, City, State,Genderarr, dt,Password); 
	UserOperations uo=UserOperations.getInstance();  
	
	       int status=uo.registration(u,u1); 
	       if(status>0)
	       {
	    	   System.out.println("Registration done successfully");
	    	   request.setAttribute("msg1", Messages.REGISTRATIONDONE);
	    	   RequestDispatcher r=request.getRequestDispatcher("/jsp/login.jsp");
	    	   r.forward(request, response);
	    	  // response.sendRedirect("/BuySell_TailorSoft/jsp/login.jsp");
	       }
	}

}
}
