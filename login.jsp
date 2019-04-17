<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
 HttpSession session2 =request.getSession();
 HttpSession session1 =request.getSession();
       String email=(String)session2.getAttribute("email");
       String category=(String)session1.getAttribute("category");
       if(email==null)
       	{

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<style type="text/css">
		.main-menu ul li a:hover {
	color: gray !important;
}
	</style>

<!--===============================================================================================-->
</head>
<body>
	
	
	<div class="limiter">
		<div class="container-login100" style="background: url('img/gs.png') !important;">
			<div class="wrap-login100" style="margin-top: 60px !important;">
				<form class="login100-form validate-form" action="loginprocess.jsp" name="myForm" ng-app="">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						Email <input class="input100" type="email" name="email" required="" ng-model="text">
						 <span ng-show="myForm.email.$error.email">Not a valid e-mail address</span>
						<span class="focus-input100" data-placeholder=""></span>
						
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						
						Password <input class="input100" type="password" name="password" required="">
		              <!--  <span class="btn-show-pass" >
							<i class="zmdi zmdi-eye"></i>
						</span> -->

					</div>
					<div class="form-group w3ls-opt">
					<label for="Phone" class="control-label">Select Category</label><br>

					<label class="w3layouts">
						<input type="radio" name="category" id="hire" value="faculty" checked>Faculty
					</label>
					<label class="w3layouts label2">
						<input type="radio" name="category" id="work" value="student">Student
					</label>
				</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
					<div class="text-center p-t-115" style="margin-top: -90px;">
						<a class="txt2" href="forgotpassword.jsp" style="font-size: 15px !important;">
							Forgot Password?
						</a>
					</div>

					<div class="text-center p-t-115" style="margin-top: -100px;">
						<span class="txt1" style="font-size: 20px !important;">
							Do not have an account?
						</span>

						<a class="txt2" href="register.jsp" style="font-size: 20px !important;">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main2.js"></script>
	<script src="angular/angular.js"></script>
	<script src="angular/angular.min.js"></script>

</body>
</html>

<%

}
else{	
	response.sendRedirect("profile.jsp");
}


%>