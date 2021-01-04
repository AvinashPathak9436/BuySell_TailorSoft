<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "icon" href =  "/BuySell_TailorSoft/image/BuySell_Fevicon.jpg" type = "image/x-icon">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/forstyle.css" type="text/css">
<script src="/BuySell_TailorSoft/js/customvalidation.js"></script>

<script>

function checkData()
{
//	alert('hello')
	var status=true;
  var FirstName=document.getElementById("ufname").value
  var LastName=document.getElementById("ulname").value
   var Mobile=document.getElementById("mobile").value
   var Email=document.getElementById("email").value
    var City=document.getElementById("city").value
    var Password=document.getElementById("password").value
    var State= document.getElementById("cmbstate").value;
//  alert(State)
  var Genderarr=document.getElementsByName("Gender");
	
 
  
  if (isEmpty(FirstName)==false) {
	  document.getElementById("showfname").innerText="*First name required";
	  status=false;
}
  if (isEmpty(LastName)==false) {
	  document.getElementById("showlname").innerText="*Last name required";
	  status=false;
}
    if (isEmpty(Mobile)==false) {
	  document.getElementById("showmobile").innerText="*Mobile No. required";
	  status=false;
}
  
     if (isEmpty(Email)==false) {
	  document.getElementById("showemail").innerText="*Email id required";
	  status=false;
}
  
       if (isEmpty(City)==false) {
	  document.getElementById("showcity").innerText="*City required";
	  status=false;
}
       if (isEmpty(Password)==false) {
    		  document.getElementById("showpassword").innerText="*Password required";
    		  status=false;
    	}
           if(checkCombo(State)==false)
	{
	document.getElementById("showstate").innerText= "*Please select a valid state";
	status= false;
	}
       
          if(checkBoxRadioCheck(Genderarr)==false)
	{
	
	document.getElementById("showgender").innerText= "*Please select any one of these";
		status= false;
	}   
  
  
  return status;
}  

</script>

<script>
$(document).ready(function()
		
		{
		$("#email").blur(function() 
			{
		
			var Email=this.value;
			//alert(Email)
		 $.get("/BuySell_TailorSoft/UserRegistration", 
				 {
			 email:Email//we are sending to Servlet get method
			    
			 	 },
				 
				 function(data, status)
				 
				 {
		    	// alert("Data: "+data+"Status: "+status)
		  	  document.getElementById("msgajax").innerText=data;
		    	  $("#msgajax").html(data)
				 
				 
				 });
		
		});
		}
		)


</script>

<style type="text/css">
  small {
  text-decoration: none;
  color: red;
  }
</style>



</head>
<body style="background-image: url('/BuySell_TailorSoft/image/BuySell_BgColor.jpg');" > 
	
	
	<div style="margin-left: 150px; background-color: #f2f2f2; width: 80%; height: 800px; margin-top: 70px; border-radius: 10px;">
	
		<div
			style="margin-left: 400px; height: 40px;">
			<h2 style="font-style: italic;text-decoration: underline;">Registration Form</h2>
		</div>
		  
  <form method="post" action="/BuySell_TailorSoft/UserRegistration" style="margin-top: 30px;margin-left: 272px;float: left;" onsubmit="return checkData()">
    
    <div class="form-group row" style="float: left;margin-top: 16px;margin-left: -5px;">
    <label for="inputCompany_Name3" class="col-sm-2 col-form-label"><h6 style="font-size: 20px;margin-left: -7px;float: left;">FirstName*:</h6></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="ufname" placeholder="Enter First Name" name="ufname" style="width: 400px; margin-left: -14px;float: left;">
    <small id="showfname" class="form-text" style="margin-left: 48px;"></small>
    </div>
    
    <div class="form-group row" style="float: left;margin-top: 16px;margin-left: -5px;">
    <label for="inputCompany_Name3" class="col-sm-2 col-form-label"><h6 style="font-size: 20px;margin-left: 0px;float: left;">LastName*:</h6></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="ulname" placeholder="Enter Last Name" name="ulname" style="width: 400px; margin-left: 32.5px;float: left;">
    <small id="showlname" class="form-text" style="margin-left: 48px;"></small>
    </div>
  </div>
  
  <div class="form-group row" style="float: left;margin-top: 2px;margin-left: -5px;">
    <label for="inputRegistration_No.3" class="col-sm-2 col-form-label"><h6 style="font-size: 20px;float: left;">MobileNo*:</h6></label>
    <div class="col-sm-10" >
      <input type="number" class="form-control" id="mobile" placeholder="Enter Mobile Number" name="mobile" style="width: 400px; 
      margin-left: 33px;float: left;">
    <small id="showmobile" class="form-text" style="margin-left: 48px;" ></small>
    </div>
  </div>
  
  <div class="form-group row" style="float: left;margin-top: 2px;margin-left: 2px;">
    <label for="inputEmail3" class="col-sm-2 col-form-label"style="margin-left: -7px;"><h6 style="font-size: 20px;float: left;">Emailid*:</h6></label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" style="width: 400px; margin-left: 15px;float: left;">
    <small id="showemail" class="form-text" style="margin-left: 57px;" ></small>
    </div>
    <span id="msgajax" style="color:red;margin-left: 155px;font-size: 13px;"></span>
  </div>
  
  <div class="form-group row" style="float: left;margin-top: 2px;margin-left: 2px;">
    <label for="inputCity3" class="col-sm-2 col-form-label"style="margin-left: -6.8px;"><h6 style="font-size: 20px;float: left;">City*:</h6></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="city" placeholder="Enter City" name="city" style="width: 400px; margin-left: 41px;float: left;">
    <small id="showcity" class="form-text" style="margin-left: 57px;" ></small>
    </div>
  </div>
  
  <div class="form-group row" style="margin-top: 3px;">
    <label for="inputPassword3" class="col-sm-2 col-form-label"><h6 style="font-size: 20px;margin-left: 8.2px; float: left;">Password*:</h6></label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password" style="width: 400px;margin-left: 58.5px; float: left;">
    <small id="showpassword" class="form-text" style="margin-top: 40px;"></small>
    </div>
  
               <div style="margin-top: 70px;margin-left: -425px;">
    <div>
    <label for="inputState3" class="col-sm-2 col-form-label"style="margin-left: -60px;margin-top: -12px;float: left;"><h6 style="font-size: 20px;
    float: left;">State*:</h6></label>
    <div class="col-sm-10" style="margin-left: 102px;float: left;">
      <select name="cmbstate" id="cmbstate" size="0" style="margin-left: -30px;margin-top: -1px;float: left; width: 180px;" enabled="enabled">       
                	
            			 <option value="default" selected>Select State</option>   			                                             
                	            <option value="andhrapradesh">Andhra Pradesh</option>
                	            <option value="arunachalpradesh">Arunachal Pradesh</option>
                	            <option value="assam">Assam</option>
                	            <option value="bihar">Bihar</option>
                	            <option value="chhattisgarh">Chhattisgarh</option>
                	            <option value="delhi">Delhi</option>
                	            <option value="goa">Goa</option>
                	            <option value="gujarat">Gujarat</option>
                	            <option value="gujarat">Haryana</option>
                	            <option value="himachalpradesh">Himachal Pradesh</option>
                	            <option value="jammuandkashmir">Jammu and Kashmir</option>
                	            <option value="jharkhand">Jharkhand</option>
                	            <option value="karnatka">Karnatka</option>
                	            <option value="kerala">Kerala</option>
                	            <option value="madhyapradesh">Madhya Pradesh</option>
                	            <option value="maharastra">Maharastra</option>
                	            <option value="manipur">Manipur</option>
                	            <option value="meghalaya">Meghalaya</option>
                	            <option value="mizoram">Mizoram</option>
                	            <option value="nagaland">Nagaland</option>
                	            <option value="orissa">Orissa</option>
                	            <option value="punjab">Punjab</option>
                	            <option value="rajasthan">Rajasthan</option>
                	            <option value="sikkim">Sikkim</option>
                	            <option value="tamilnadu">Tamil Nadu</option>
                	            <option value="telangana">Telangana</option>
                	            <option value="tripura">Tripura</option>
                	            <option value="uttarpradesh">Uttar Pradesh</option>
                	            <option value="uttarakhand">Uttarakhand</option>
                	            <option value="westbengal">West Bengal</option>
                		</select>
    <small id="showstate" class="form-text" style="margin-left:-40px;margin-top: 90px;"></small>
    </div>
    </div>
  </div>       
      
   </div>

     <div style="margin-left: -454px; margin-bottom: -30px;margin-top: 130px;"><h5>Gender*:</h5></div>
      <div class="form-check" style="margin-top: 130px;margin-left: -60px;">
  <input type="radio" class="form-check-input" id="male" value="male" name="Gender" style="margin-left: 107px;">
  <label class="form-check-label" for="materialGroupExample1" style="margin-left: 135px;">Male</label>
</div>
  <div class="form-check" style="margin-top: 130px;">
  <input type="radio" class="form-check-input" id="female" value="female" name="Gender"  style="margin-left: 107px;">
  <label class="form-check-label" for="materialGroupExample2" style="margin-left: 135px;">Female</label>
<small id="showgender" class="form-text" style="margin-left: 130px;"></small>
</div>
  
    <div style="margin-top: -90px;float: left;">
      <button type="submit" class="btn btn-primary" style="margin-top: 110px;
       margin-left: 5px;width: 90px;height: 40px;float: left;">Submit</button>
      <button type="reset" class="btn btn-dark" style="margin-top: 110px;
       margin-left: 290px;width: 90px;height: 40px;float: left;">Reset</button>
                </div>
    
  </form> 
  </div>
<a href="/BuySell_TailorSoft/jsp/login.jsp" style="margin-left: 270px;text-decoration: underline;">I ALREADY HAVE A PROFILE</a>	
</body>
</html>