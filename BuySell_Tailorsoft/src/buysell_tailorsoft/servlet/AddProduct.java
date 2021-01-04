package buysell_tailorsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buysell_tailorsoft.beans.Messages;
import buysell_tailorsoft.beans.Products;
import buysell_tailorsoft.usertask.UserOperations;


@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//ProductID, Producttitle, Howolditis, Mrpofproduct, Productdescription, Sellingpriceofproduct, city, Dateofproduct
		
		String Producttitle= request.getParameter("producttile");
		String Howolditis= request.getParameter("howolditis");
		String Mrpofproduct= request.getParameter("mrpofproduct");
		String Productdescription= request.getParameter("desctxt");
		String Sellingpriceofproduct= request.getParameter("sellingprice");
		String city= request.getParameter("cmbcity");
		
		
		
		System.out.println("Product title is:"+Producttitle);
		System.out.println("How old it is:"+Howolditis);
		System.out.println("MRP of product is:"+Mrpofproduct);
		System.out.println("Product description:"+Productdescription);
		System.out.println("Selling price of project is:"+Sellingpriceofproduct);
		System.out.println("City is:"+city);
	
	java.util.Date d=new java.util.Date();
	java.sql.Date dt=new java.sql.Date(d.getTime()); //sql time
	
	Products n=new Products(Producttitle, Howolditis, Mrpofproduct, Productdescription, Sellingpriceofproduct, dt, city); //creating bean class object 
	
	
	UserOperations nt=UserOperations.getInstance();  
	
	     int status=nt.addproducts(n); //passing objects of bean class to the operation class method
	       if(status>0)
	       {
	    	   System.out.println("Product added successfully");
	    	   request.setAttribute("msg1", Messages.ADDPRODUCT);
	    	   RequestDispatcher r=request.getRequestDispatcher("/jsp/addproduct.jsp");
	    	   r.forward(request, response);
	    	  // response.sendRedirect("/BuySell_TailorSoft/jsp/addproduct.jsp");
	       }
	}
		
	}


