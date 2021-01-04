<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="buysell_tailorsoft.dbtask.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
    <%@page import="buysell_tailorsoft.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Products</title>

<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon"> 
<script src= "/BuySell_TailorSoft/js/customvalidation.js"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
                  <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            border: 3px solid #f1f1f1;

        }

        input[type=text], input[type=password],input[type=email],select,checkbox,radio {
            width: 50%;
            padding: 12px 27px;
            margin: 15px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
          align-content: center;
            color: white;
            padding: 14px 20px;
            margin: 4px 0;
            border: none;
            cursor: pointer;
            width: 10%;
        }

      


        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
            				
        }
       						
    </style>
    
    <script>
    
   
    
    </script>
</head>
<body style="background-image: url('/BuySell_TailorSoft/image/userwholebackground.jpg');">

<%

String errormsg=(String)request.getAttribute("msg1");

%>

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HttpSession hs=request.getSession(false);
String aid=(String)hs.getAttribute("idkey");


if(aid==null ||hs.isNew())
{

request.setAttribute("msg", Messages.LOGIN_UNAUTHORISED);
RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
rd.forward(request, response);
	
}
else{
	
	  String type=(String)hs.getAttribute("idkey");
	 if(type.equalsIgnoreCase("idkey")) 
	{ 
	%>
		<%} %>
		
<%
{%>
     <%@include file="/WEB-INF/menus/userheader.html" %>
     
     <%if(errormsg!=null)
{
%>
<div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong><%=errormsg%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
   <span aria-hidden="true">&times;</span>
  </button>
</div>
<%}%>

	<h2 align="center">Add Product</h2>
<form action="/BuySell_TailorSoft/AddProduct" method="post">

 
      

        <div class="container" align="center">
        
            
           <div>
            
            
              <label for="eventname"><b>Product Title* : </b></label>
            <input type="text"   name="producttile" placeholder="Enter product title" required id="producttile" style="margin-left: 5px;"><br>
            
             <label for="venuename"><b>  How Old it is* : </b></label>
            <input type="text" placeholder="Enter how old product/item is" name="howolditis" required id="howolditis" style="margin-left: 10px;"><br>
            </div>
            
             <label for="orgname" style="margin-left: -30px;"><b>  MRP Of Product* : </b></label>
            <input type="text" placeholder="Enter MRP of the product" name="mrpofproduct" required id="mrpofproduct" style="width: 553px;margin-left: 13px;"><br>
            
            
            
              <label for="description"><b style="margin-top: -55px;float: left;margin-left: -40px;">Product Description* : </b></label>
            <textarea rows="4" cols="67" required id="descname" name="desctxt"  placeholder="Enter product description" id="desctxt" style="margin-left: -6px;width: 553px;margin-top: 15px;"></textarea><br>
            
            <label for="sellingprice" style="margin-left: -80px;"><b>  Selling Price Of Product* : </b></label>
            <input type="text" value="" placeholder="Enter selling price of product" name="sellingprice" required id="sellingprice" style="margin-left: 2px;margin-top: 19px;" ><br>
            </div>
            
            <label for="sellingprice" style="margin-left: 198px;margin-top: 10px;"><b>  City (in which you want to sell)* : </b></label>
            <div class="inputbox">
											<select name="cmbcity" id="cmbcity" onclick="dcity()" required id="cmbcity" style="margin-left: 456px;width: 553px;margin-top: -80px;">
												<option value="default">Select City</option>
												<%
													String strc="select * from citylist";
                                                    ResultSet rs=DbConnection.getData(strc);
                                                    while(rs.next()){
                                                    	String cname=rs.getString(1);
												%>
												<option value="<%=cname %>"><%=cname %></option>
												<%} %>
											</select>
										</div>
            
                 <button type="submit" class="btn btn-sucess" value="submit" style="color: black;margin-left: 670px;"><b>Submit</b></button>
              <button type="reset" class="btn btn-danger" value="submit" style="color: black;"><b>Reset</b></button>


        </div>
</form>

 
	<%} %>


 <%} %>

</body>
</html>