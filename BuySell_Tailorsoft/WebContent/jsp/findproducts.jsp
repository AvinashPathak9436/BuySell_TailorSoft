<%@page import="buysell_tailorsoft.dbtask.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buysell_tailorsoft.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Find Products</title>
<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">
<link rel="stylesheet" href="/Hostels/css/style.css" type="text/css">
<script src="/BuySell_TailorSoft/js/customvalidation.js"></script>

<!-- ----------FA cdn------------ -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
           <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
           <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
 

 <script>
  
  $(document).ready(function()
  		
  		{
      $("#cmbcity").change(
      		function(){
      			var city=this.value;
       
      			 $.get("/BuySell_TailorSoft/jsp/viewsearchitemslist.jsp",{cid:city},
      			        function(data,status){
      			        	
      			         // alert("Data: " + data + "\nStatus: " + status);
      			             $("#clist").html(data);
      			             $("#clist").show();
      			             //$("#div1").hide(5000);
      			             
      			        });
      			
      });
  });
  
</script> 



</head>

<body style="background-color: GhostWhite;">
    <%@include file="/WEB-INF/menus/userheader.html" %>
	<%

response.setHeader("Cache-Control", "no-cache");
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
else{
%>		
    		
	<div class="fhwrap" style="background-image: url('/BuySell_TailorSoft/image/registration_bgcolor.jpg');margin-top: 50px;">
	<h2 align="center" style="text-decoration: blink;">Search Products Using City</h2>
		<div class="search-bar" style="margin-left: 350px;">
			<div class="backh">
				<a href="/BuySell_TailorSoft/jsp/userhome.jsp">
					<p>Back</p>
				</a>
			</div>
			<div class="backh">
				<select name="cmbcity" id="cmbcity">
					<option value="default">Select City</option>
					<%
                    	String cit="select * from citylist";
                    	ResultSet cn=DbConnection.getData(cit);
                    	while(cn.next()){
                    		String cname=cn.getString(1);
                    %>
					<option value="<%=cname%>"><%=cname%></option>
					<%} %>
				</select>
			</div>
		</div>
		<div class="resultbox">
			<div class="clist" id="clist">
			
			</div>
		</div>
	</div>
	<%} %>
</body>

</html>