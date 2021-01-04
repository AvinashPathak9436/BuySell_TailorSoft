<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="buysell_tailorsoft.beans.*" %>
    <%@ page import="buysell_tailorsoft.usertask.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon"> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>

<body style="background-image: url('/BuySell_TailorSoft/image/userwholebackground.jpg');">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("idkey");
if(uid==null || hs.isNew())
{
 request.setAttribute("msg", Messages.LOGOUTMESSAGE);	
 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
 rd.forward(request, response);
}
else{
%>
<%-- <div style="width: 100%;height: 50px;">
<h1>Hello user <%=uid %></h1>
</div> --%>

<%@include file="/WEB-INF/menus/userheader.html" %>

<%
   UserOperations u=UserOperations.getInstance();
      Products ut=u.viewProduct(uid); 
      
      String path=request.getContextPath();

      System.out.println("path is"+path);

      String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
      System.out.println("basepath is"+basePath);

      UserOperations ct=UserOperations.getInstance();
      Products consultancy=ct.viewPic(uid, basePath);
      String picsrc=consultancy.getProducttitle();//it returns the url(src means path)s of the image
      String name=consultancy.getCity();
%>

<div style="width:250px;height: 250px;margin-top:100px;margin-left: 70px ;">
<img src="<%=picsrc%>" style="width:100%;height: 100%" class="rounded-circle">
<div class="card-body" style="margin-left: 20px;">
    <h4 class="card-text"><%=name %></h4>               <%--  Welcome&nbsp;&nbsp;&nbsp;<%=name %>  --%>
     <%-- <p class="card-text">Your Email is<%=consultancy.getEmail() %></p>  --%>
  </div>	
</div> 
<div style="width:50%; height:250px; float: left; margin-left: 470px; margin-top: -250px;background-color: #f2f2f2;">

<ul class="list-group list-group-horizontal">
  <li class="list-group-item" style="width:50%;height:50px; text-align: center; font-size: 22px;font-weight: bold;font-family:Questa;background-color: #f2f2f2;">Name:</li>
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;background-color: #f2f2f2;"><%=ut.getProducttitle()%></li>
  
</ul>

<ul class="list-group list-group-horizontal" >
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;font-weight: bold;font-family:Questa;background-color: #f2f2f2;">Mobile No.:</li>
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;background-color: #f2f2f2;"><%=ut.getHowolditis()%></li>
  
</ul>

<ul class="list-group list-group-horizontal">
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;font-weight: bold;font-family:Questa;background-color: #f2f2f2;">City:</li>
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;background-color: #f2f2f2;"><%=ut.getMrpofproduct()%></li>
  
</ul>

<ul class="list-group list-group-horizontal" >
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;font-weight: bold;font-family:Questa;background-color: #f2f2f2;">Email:</li>
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;background-color: #f2f2f2;"><%=ut.getProductdescription()%></li>
  
</ul>

<ul class="list-group list-group-horizontal" >
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;font-weight: bold;font-family:Questa;background-color: #f2f2f2;">City Address:</li>
  <li class="list-group-item" style="width:50%;height:50px; text-align: center;font-size: 20px;background-color: #f2f2f2;"><%=ut.getSellingpriceofproduct()%></li>
  
</ul>

</div>


<% } %>
</body>
</html>