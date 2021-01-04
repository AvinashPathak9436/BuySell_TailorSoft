<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/BuySell_TailorSoft/js/validation.js"></script>
<script>
function checkEmpty() 
{
	//alert("okay okay")
	var status= true;
 var uid= document.getElementById("userid").value;
var upass= document.getElementById("userpass").value;
     console.log(uid+upass);
     
if(uid.length==0)
{
document.getElementById("msgid").innerText="*UserId Required"
status= false
}

if(upass.length==0)
{
document.getElementById("msgpass").innerText="*Password Required"
status= false
}

return status;
	
}
</script>

</head>

<body style="background-image: url('/BuySell_TailorSoft/image/BuySell_BgColor.jpg');" >

<%
  String errormsg=(String)request.getAttribute("msg");
%>
<%

String errormsg1=(String)request.getAttribute("msg1");

%>

<div style="margin-left:450px; margin-top:80px;width:450px;height:280px;float:left;
background-color: #f2f2f2;padding-right: 50px;border-radius: 20px;padding: 50px;">

<form action="/BuySell_TailorSoft/Login" method="post" onsubmit="return checkEmpty()">


<h4 style="text-align: center;margin-top: -35px;">Sign in/Create account</h4>


<table style="margin-left: 35px; margin-top: 20px" >
<tr>
<th>EmailId*</th>
<th><input type="text" id="userid" name="userid" style="width: 100%;"></th>
</tr>
<tr>
<td colspan="2" style= "text-align: center;"><label id= "msgid" style= "font-size: 12px;color:red"></label>


<tr>
<th>Password*</th>
<th><input type="password" id="userpass" name="userpass" style="width: 100%;"></th>
</tr>
<tr>
<td colspan="2" style= "text-align: center;"><label id= "msgpass" style= "font-size: 12px;color:red"></label>


<tr><th colspan="2"><button type="submit" style=" width: 100%; height:40px ;background-color: #4CAF50;color: white; margin: 8px ; border: none;border-radius: 4px;margin-left: -1px;margin-top: -5px;">Login</button></th></tr>


</table>

<a href="/BuySell_TailorSoft/jsp/userregistration.jsp" style="margin-left: 80px;text-decoration: underline;">Create New Account</a>

<%
 if(errormsg!=null)
 {
%>

<div class="alert alert-primary alert-dismissible fade show" role="alert" >
  <strong><%=errormsg %></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% } %> 

<%if(errormsg1!=null)
{
%>
<div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong><%=errormsg1%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
   <span aria-hidden="true">&times;</span>
  </button>
</div>
<%}%>

</form>
</div>


</body>
</html>