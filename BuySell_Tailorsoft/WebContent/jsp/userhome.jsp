<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="buysell_tailorsoft.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>

<body style="background-color: #f2f2f2;">
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

<div style="text-align: center;margin-top: 20px;">
<h5 style="text-decoration: blink;">styles we love...</h5>
</div>

<div class="container-fluid" style="background-color: #f2f2f2;width: 80%;height: 330px;;float: left;margin-left: 105px;">

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" style="float: left; width: 110%;height: 100%;margin-left: -20px;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/BuySell_TailorSoft/image/carouselimage1.jpg" class="d-block w-100" alt="..." style="float: left; height: 350px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>ALL TIME COMFORT</h5>
        <p>5 mix-and-match comfort pieces that will have you wanting to wear them nonstop.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/BuySell_TailorSoft/image/carouselimage2.jpg" class="d-block w-100" alt="..." style="float: left; height: 350px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>BOLT OF BLUE</h5>
        <p>A new wave of washes and a new approach to styling are pushing classic denim outside its comfort zone.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/BuySell_TailorSoft/image/carouselimage3.jpg" class="d-block w-100" alt="..." style="float: left; height: 350px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>EXTENDED SIZES</h5>
        <p>Find your perfect fit with 14 must-have styles available in extended sizes.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>

<div class="container-fluid" style="background-color: #f2f2f2;width: 1532px;height: 500px;float: left;margin-left: -140px;margin-top: 20px;">  
    <label style="margin-left: 300px;margin-top: 100px;">
    <h3 style="text-decoration: bold;margin-top: -80px;margin-left: 330px;text-decoration: underline;"> more style for your life... </h3>
<h5 style="margin-left: 60px;">TOP BRANDS</h5>
<a href="/BuySell_TailorSoft/html/topbrands.html"><img src="/BuySell_TailorSoft/image/Top 20.jpg" width="200" height="200"
 style="margin-left: 15px;margin-top: -5px;" title="Available The Top 20" alt="image not available"></a>
</label> 
   
   <label style="margin-left: 69px;">
<h5 style="margin-left: -418px;">DENIM GUIDE</h5>
<a href="/BuySell_TailorSoft/html/Denimguide.html">
<img src="/BuySell_TailorSoft/image/Denim Guide.jpeg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Denim Guide" alt="image not available">
</a>
</label>

<div style="margin-left: 1265px;margin-top: -234px;">
  <h5 style="margin-left: -385px;">BLAZERS</h5>
<a href="/BuySell_TailorSoft/html/blazer.html">
<img src="/BuySell_TailorSoft/image/Formal-Blazers.jpeg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Blazers" alt="image not available">
</a>
</div>

<div style="margin-left: 1522px;margin-top: -226px;">
  <h5 style="margin-left: -385px;">T-SHIRTS</h5>
<a href="/BuySell_TailorSoft/html/T-shirt.html">
<img src="/BuySell_TailorSoft/image/T-Shirts.jpg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available T-Shirts" alt="image not available">
</a>
</div>

<div style="margin-left: 759px;margin-top: 3px;">
  <h5 style="margin-left: -399px;">TRACKPANTS</h5>
<a href="/BuySell_TailorSoft/html/trackpant.html">
<img src="/BuySell_TailorSoft/image/Trackpants.jpg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Trackpants" alt="image not available">
</a>
</div>

<div style="margin-left: 1012.5px;margin-top: -227px;">
  <h5 style="margin-left: -401px;">BRAND JEANS</h5>
<a href="/BuySell_TailorSoft/html/jeans.html">
<img src="/BuySell_TailorSoft/image/Black-Slim-Jeans.jpeg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Black Jeans" alt="image not available">
</a>
</div>

<div style="margin-left: 1265.5px;margin-top: -227px;">
  <h5 style="margin-left: -410px;">BLEND SHIRTS</h5>
<a href="/BuySell_TailorSoft/html/shirt.html">
<img src="/BuySell_TailorSoft/image/Blend Shirts.jpeg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Blend Shirts" alt="image not available">
</a>
</div>

<div style="margin-left: 1522.5px;margin-top: -227px;">
  <h5 style="margin-left: -395px;">LEHENGAS</h5>
<a href="/BuySell_TailorSoft/html/Lehanga.html">
<img src="/BuySell_TailorSoft/image/Lehenga.jpg" width="200" height="200" 
style="margin-left: -446px;margin-top: -5px;" title="Available Lehengas" alt="image not available">
</a>
</div>
    
  </div>



<%@include file="/WEB-INF/header_footer/footer.html" %>
<% } %>
</body>
</html>