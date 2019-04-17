<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%

  String ab = request.getParameter("otp");
  String ba = request.getParameter("hidden");

try{
  if(ab.equals(ba))

    {
  	String email = request.getParameter("a");
 String b = request.getParameter("b");
   %>


<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>Set New Password</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="vf" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	
	<!-- Meta tag Keywords -->

	<!-- css files -->
	<link rel="stylesheet" href="detail/css1/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	 rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body style="margin: 0px; padding: 0px;">
	<div class="main-bg" style="margin-top: -20px; margin-bottom: -35px;">
		
		<!-- content -->
		<div class="sub-main-w3" style="padding-top: 50px;">
			<div class="bg-content-w3pvt">
				<div class="top-content-style">
					<img src="images/user.jpg" alt="" />
				</div>
				<form action="setpassword.jsp" method="post">
					<p class="legend">Please Enter New Password..<span class="fa fa-hand-o-down"></span></p>
					<div class="input" style="background-color: lightblue !important; padding: 7px !important; width: 190px; font-weight: bold; border-radius: 20px !important;" >  
						<%  out.println(email);  %>
					</div>
					<div class="input">
						<input type="password" placeholder="Enter Password.." name="password" required />
						<span class="fa fa-lock"></span>
					</div>
						<input type="hidden" name="email" value="<%=email%>">
			           <input type="hidden" name="category" value="<%= b%>">
					<button type="submit" class="btn submit" style="width: 200px !important;">
						<span class="fa fa-sign-in">Submit</span>
					</button>
				</form>
				</div>
		</div>
		
	</div>
	  <%
  }
  else{
  %>
  <script type="text/javascript">
    alert("Wrong OTP!");
    window.location.href='login.jsp'
  </script>
</body>
</html>
<%
}
}
catch(Exception e)
{
   out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
}

%>