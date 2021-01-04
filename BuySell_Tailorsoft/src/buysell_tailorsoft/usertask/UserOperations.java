package buysell_tailorsoft.usertask;
//datalayer 

import java.sql.*;
import java.util.ArrayList;


import buysell_tailorsoft.beans.Products;
import buysell_tailorsoft.beans.*;
import buysell_tailorsoft.dbtask.DbConnection;


public class UserOperations 
{
	private PreparedStatement psuser,pscs;
	private Connection con;
	
private static UserOperations obj;
	
	
	public static UserOperations getInstance()
	{
		
		
		if(obj==null)
		{
			//System.out.println("in first if");
			
			synchronized (UserOperations.class) 
			{ 
				if(obj==null)
				{
					System.out.println("in second if");
				obj=new UserOperations();
				}
			}
		}
		return obj;
	}
	
	
	public int registration(UsersLogin userlg,User ur)
	{
		//i need to insert data into two tables usercredentials and user
		int rowstatus=0;
		con=DbConnection.createConnection();//database connection is established
		
		
		try {
			String struserlogin="insert into usercredentials values(?,?,?,?)";
			String struser="insert into user(emailid, firstname, lastname, mobile, city, state, gender, date) values(?,?,?,?,?,?,?,?)";
			psuser=con.prepareStatement(struserlogin);
			psuser.setString(1, userlg.getId());
			psuser.setString(2, userlg.getPass());
			
			psuser.setString(3, userlg.getType());
			psuser.setString(4, userlg.getStatus());
			
			System.out.println(psuser);
					
			pscs=con.prepareStatement(struser);
			pscs.setString(1, ur.getEmailid());
			pscs.setString(2, ur.getFirstname());
			pscs.setString(3, ur.getLastname());
			pscs.setString(4, ur.getMobile());
			pscs.setString(5, ur.getCity());
			pscs.setString(6, ur.getState());
			pscs.setString(7, ur.getGender());
			pscs.setDate(8, ur.getDate());
			System.out.println(pscs);
			
			//rowstatus=psfeedback.executeUpdate();
			
			int ruser=psuser.executeUpdate();//insert/update/delete
			int rc=pscs.executeUpdate();
			if(ruser>0 && rc>0)
			{
				rowstatus=1;
			}
				
			
			
		}
		
		
		
		catch(SQLException se)
		{
			
			se.printStackTrace();
		}
		
		finally {
			
			try {
				if(psuser!=null)
					psuser.close();
				if(pscs!=null)
					pscs.close();
				if(con!=null)
					con.close();
				
			}
			catch(SQLException se) {System.out.println(se);}
			
		}
		
		return rowstatus;
	}
	


public boolean checkUserId(String id)
{
	PreparedStatement ps=null;
	ResultSet rs=null;
	Connection con=DbConnection.createConnection();
	
	
	try {
		String strsql="select * from usercredentials where userid=?";
		ps=con.prepareStatement(strsql);
		ps.setString(1, id);
		System.out.println(ps);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
		return  true;
		}
		
			
		
	}
	catch(SQLException se)
	{
		se.printStackTrace();
					
	}
	
	finally {
		
		
		
		if(ps!=null)
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		if(con!=null)
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//con.close();
	}
	
	
	
	return false;
	
}

public int addproducts(Products c)
{
	int status=0;
	Connection con=DbConnection.createConnection();
	PreparedStatement ps=null;
	try {
		
		String strinsert="insert into cityproducts(Producttitle, Howolditis, Mrpofproduct, Productdescription, Sellingpriceofproduct, city, Dateofproduct)values(?,?,?,?,?,?,?)";
		ps=con.prepareStatement(strinsert);
		ps.setString(1, c.getProducttitle());
		ps.setString(2, c.getHowolditis());
		ps.setString(3, c.getMrpofproduct());
		ps.setString(4, c.getProductdescription());
		ps.setString(5, c.getSellingpriceofproduct());
		ps.setString(6, c.getCity());
		ps.setDate(7, c.getDate());
	//	System.out.println(ps);
		status=ps.executeUpdate();




		
	}
	catch(SQLException se)
	{
		
		se.printStackTrace();
		
		
	}
	
	finally {
		
		try {
		ps.close();
		DbConnection.closeConnection();
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
				
		
		
	}
	return status;
	
	
}	


public Products viewProduct(String id) {
	Connection con = DbConnection.createConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	Products ut = null;

	try {

		String strsql = "select * from cityproducts where city=?";
		ps = con.prepareStatement(strsql);
		ps.setString(1, id);// from jsp page session
		System.out.println(ps);
		rs = ps.executeQuery();
		if (rs.next()) {

			ut = new Products();
			 ut.setProducttitle(rs.getString("producttile"));
			 ut.setHowolditis(rs.getString("howolditis"));
			  ut.setMrpofproduct(rs.getString("mrpofproduct")); 
			  ut.setProductdescription(rs.getString("desctxt"));
			  ut.setSellingpriceofproduct(rs.getString("sellingprice"));
			  ut.setCity(rs.getString("cmbcity"));
			 
		}

	} catch (SQLException se) {
		System.out.println(se);
	}

	finally {

		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();

		} catch (SQLException se) {

			se.printStackTrace();
		}
	//	DbConnection.closeConnection();// for closing connection
	}
	return ut;

}

public Products viewPic(String cid,String basePath)
{
	Products ct=new Products();
	Connection con = DbConnection.createConnection();
	PreparedStatement ps = null;
	ResultSet rs=null;
	String imgname="";
	String picsrc=null;

	System.out.println(cid+basePath+"in viewPicmethod");
	String strsql="select * from cityproducts where city=?";
	try {
	ps=con.prepareStatement(strsql);
	ps.setString(1, cid);
	rs=ps.executeQuery();
	if(rs.next())
	{
	imgname=rs.getString("pic");
		System.out.println("image name from table is"+imgname);
		if(imgname==null)
		{
		picsrc="/BuySell_TailorSoft/image/productdefaultpic.png";
		
		}
		else{
		
		picsrc=basePath+cid+"/"+imgname;
		}
	
	ct.setProducttitle(rs.getString("name"));
	ct.setPicname(picsrc);
	System.out.println("final picpath"+picsrc);
	//ct.setEmail(rs.getString("email"));
	}
	}
	catch(SQLException se) {se.printStackTrace();}
	
	finally {

		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();

		} catch (SQLException se) {

			se.printStackTrace();
		}
		DbConnection.closeConnection();// for closing connection
	}
	
	return ct;
	}

public ArrayList<Products> viewProducts()
{
	Connection con=DbConnection.createConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	Products ur=null;
	ArrayList<Products>productlist=new ArrayList<>();
	try
	{
		String strsql="select* from cityproducts";
		ps=con.prepareStatement(strsql);
		rs=ps.executeQuery();
		while(rs.next())
		{
			ur=new Products();
			ur.setProducttitle(rs.getString("Producttitle"));
			ur.setHowolditis(rs.getString("Howolditis"));
			ur.setMrpofproduct(rs.getString("Mrpofproduct"));
			ur.setProductdescription(rs.getString("Productdescription"));
			ur.setSellingpriceofproduct(rs.getString("Sellingpriceofproduct"));
			ur.setCity(rs.getString("city"));
			
			
			productlist.add(ur);
			
			
		}
		
	}
	catch (SQLException se) {
		System.out.println(se);
	}
	finally {

		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();

		} catch (SQLException se) {

			System.out.println(se);
		}
		
	}
	return productlist;

}

public int buyProduct(String[]mids, String verifystatus)
{
	String sql=null;

	sql="update cityproducts set buyingstatus=? where ProductID=?" ;
			
	int flag=0;
	Connection con=DbConnection.createConnection();
	try {
		con.setAutoCommit(false);
		 PreparedStatement ps;
		 ps=con.prepareStatement(sql);
		 for(int i=0;i<mids.length;i++)
		 { 
		 ps.setString(1,"false");
		 
		 ps.setString(2, mids[i]); 
		 ps.addBatch();
		 }
		 
		 int []rows=ps.executeBatch();
		 for(int i=0;i<rows.length;i++)
		 {
		 
		  System.out.println(rows[i]); 
		  if(rows[i]<0) 
		  { 
			
		  flag=1; 
		  break;
		  }
		  	  
		 }
		  
		  if(flag==0) {
		 
		  con.commit(); 
		  System.out.println("Product Bought Successfully,Thank You For Shopping With Us!!");
		 
		  }
		 
		
		
	}
	catch(SQLException se)
	{
		
		System.out.println(se);
	}
	
	finally {

		try {
			if (con != null)
				con.close();
			if (pscs != null)
				pscs.close();

		} catch (SQLException se) {

			System.out.println(se);
		}
		
	}
	
	
	return flag;
	
}



public ArrayList<Products> viewSearchitems()
{
	Connection con=DbConnection.createConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	Products ur=null;
	ArrayList<Products>productlist=new ArrayList<>();
	try
	{
		String strsql="select* from cityproducts";
		ps=con.prepareStatement(strsql);
		rs=ps.executeQuery();
		while(rs.next())
		{
			ur=new Products();
			ur.setProducttitle(rs.getString("Producttitle"));
			ur.setHowolditis(rs.getString("Howolditis"));
			ur.setMrpofproduct(rs.getString("Mrpofproduct"));
			ur.setProductdescription(rs.getString("Productdescription"));
			ur.setSellingpriceofproduct(rs.getString("Sellingpriceofproduct"));
			ur.setCity(rs.getString("city"));
			
			
			
			productlist.add(ur);
			
			
		}
		
	}
	catch (SQLException se) {
		System.out.println(se);
	}
	finally {

		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();

		} catch (SQLException se) {

			System.out.println(se);
		}
		
	}
	return productlist;

}


}

