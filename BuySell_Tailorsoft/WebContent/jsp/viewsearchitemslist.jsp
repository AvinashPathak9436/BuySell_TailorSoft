<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="buysell_tailorsoft.beans.*" %>
    <%@ page import="buysell_tailorsoft.usertask.*" %>
    <%@ page import="buysell_tailorsoft.usertask.UserOperations" %>
     <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Search Items List</title>

<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body  style="background-image: url('/BuySell_TailorSoft/image/userwholebackground.jpg');">


<%

/* response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HttpSession hs=request.getSession(false);
String cid=(String)hs.getAttribute("idkey");
if(cid==null || hs.isNew())
{  
 request.setAttribute("msg", Messages.LOGOUTMESSAGE);	
 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
 rd.forward(request, response); 
}
else{ */
%>


<%
UserOperations vt = UserOperations.getInstance();
			ArrayList<Products> productlist = vt.viewSearchitems();
%>	

<h2 align="center">View Products List</h2>
<div style="width:80%; height:100%; float:left; background-color: #f2f2f2; margin-left: 150px; margin-top: 40px;">
<table class="table table-hover">
		<thead>
			<tr>
			    <th scope="col">ProductTitle</th>
				<th scope="col">How Old It Is</th>
				<th scope="col">MRP Of Product</th>
				<th scope="col">Product Description</th>
				<th scope="col">Selling Price</th>

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
			    <td>&nbsp;&nbsp;<%=producttitle%></td>
                <td>&nbsp;&nbsp;<%=howolditis%></td>
                <td>&nbsp;&nbsp;<%=mrpofproduct%></td>
				<td>&nbsp;&nbsp;<%=productdescription %></td>
				<td>&nbsp;&nbsp;<%=sellingpriceofproduct %></td>
		
			</tr>
<%}
	
  %>

            
</tbody>
	</table>
</div>
		

</body>
</html>