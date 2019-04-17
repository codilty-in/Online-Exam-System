<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%

             String otp = request.getParameter("k");
             if(otp==null)
             {
             	 out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
             }
             String a = request.getParameter("k1");
             String b = request.getParameter("k2");
             String c = request.getParameter("k3");            
             String e = request.getParameter("k5");
             String f = request.getParameter("k6");
             String g = request.getParameter("k7");
            

%>


<!DOCTYPE HTML>
<html>
<head><title>Verify OTP</title>
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="detail/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="detail/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="detail/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="detail/css/util.css">
	<link rel="stylesheet" type="text/css" href="detail/css/main.css">
<!--google fonts-->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>

</head>
<body style="background: url('img/gs.png') !important;">
<!--element start here-->
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="registerprocess.jsp" name="form1">
					<span class="login100-form-title p-b-33">
						Please Enter OTP
					</span>
            <input type="hidden" name="hidden" value="<%= otp%>">
			<input type="hidden" name="email" value="<%= a%>">
			<input type="hidden" name="fname" value="<%= b%>">
			<input type="hidden" name="lname" value="<%= c%>">
			
			<input type="hidden" name="password" value="<%= e%>">
			<input type="hidden" name="work" value="<%= f%>">
			<input type="hidden" name="category" value="<%= g%>">
                   <h3 style="text-align: center;">   <% out.println("Time Left");%></h3>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="time">
						
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="otp"  maxlength="4" placeholder="Enter Otp here...">
						
					</div>

					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn" value="submit">
							Submit OTP
						</button>
					</div>

					<br><br>

					<div class="text-center">
						<span class="txt1">
						Please Don't Refresh Pgae..
						</span>

					</div>
				</form>
			</div>
		</div>
	</div>
	

<!--element end here-->
 <script type="text/javascript">
        var a = 120;
        var t;
        function f1()
        {
            document.form1.time.value=a;
            if(a==0)
            {
                window.location.href='login.jsp';
            }
            a=a-1;

            t = setTimeout("f1()",1000)
        }
        f1();
    </script>
</body>
</html>