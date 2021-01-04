<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="buysell_tailorsoft.beans.*" %>
    <%@ page import="buysell_tailorsoft.servlet.*" %>
    <%@ page import="buysell_tailorsoft.usertask.*" %>
     <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Products</title>

<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body  style="background-image: url('/BuySell_TailorSoft/image/userwholebackground.jpg');">

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
	%>

<%@include file="/WEB-INF/menus/userheader.html" %>

<%

String errormsg=(String)request.getAttribute("msg1");

%>

<%
UserOperations vt = UserOperations.getInstance();
ArrayList<Products> productlist = vt.viewProducts();
%> 	
<h2 style="text-align: center; margin-top: 20px;text-decoration: underline;font-weight: bold;">Buy Products</h2>
<div style="width:89%; height:100%; float:left; background-color: #f2f2f2; margin-left: 75px; margin-top: 30px;">
<form method="post" action="/BuySell_TailorSoft/BuyProduct">

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

<table class="table table-hover">
		<thead>
			<tr>
			    <th scope="col">Select</th> 
			    <th scope="col">ProductTitle.</th>
				<th scope="col">How Old It Is</th>
				<th scope="col">MRP Of Product</th>
				<th scope="col">ProductDescription</th>
				<th scope="col">SellingPrice</th>
				<th scope="col">City</th>
				
				
			</tr>
		</thead>
		<tbody>
			<%

				for (int i = 0; i < productlist.size(); i++)
				{
					Products mobject = productlist.get(i);
					    
					    String producttitle = mobject.getProducttitle();
						String howolditis = mobject.getHowolditis();
						String mrpofproduct = mobject.getMrpofproduct();
						String productdescription = mobject.getProductdescription();
						String sellingpriceofproduct = mobject.getSellingpriceofproduct();
						String city = mobject.getCity();
						
						
						
					
			%>

			<tr>
			  <th scope="row" ><input type="checkbox" name="chkmessage" value="<%=producttitle%>"></th>
			    <td><%=producttitle%></td>
                <td><%=howolditis%></td>
				<td><%=mrpofproduct%></td>
				<td><%=productdescription%></td>
				<td><%=sellingpriceofproduct%></td>
				<td><%=city%></td>
				
				
		</tr>
        
       
        
        <%} } %>
        
         <tr>
			    <th colspan="4" scope="row" style=";text-align: center"><button type="submit" name="btn" value="sent" class="btn btn-danger" style="margin-left: 460px;">Buy Now</button></th>
			</tr>
            
        
        
</tbody>
</table>
</form>
</div>
</body>
</html>