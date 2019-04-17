<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%

HttpSession session1 = request.getSession();
    String email = (String)session1.getAttribute("email");

    if(email==null)
    {
      

%>



<!DOCTYPE HTML>
<html>
<head>
<title>Reset Password </title>
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Reset Password Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--google fonts-->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>

<script type="text/javascript">
	function f1()
	{
		 var x = document.forms['form1']['email'].value;
              var atpos = x.indexOf('@');
              var dotpos = x.lastIndexOf('.');
              if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) 
                 {
                      alert('Not a valid E-mail address');
                      return false;
                  }
                  else
                  {
                  	return true;
                  }
	}
</script>
</head>
<body style="background: url('img/gs.png') !important;">
<!--element start here-->
<div class="elelment" style="margin-bottom: 200px !important;">
	
	<div class="element-main">
		<h1 style="margin-bottom: 30px !important; color: black;"><u>Forgot Password</u></h1>
		
		<form name="form1" onsubmit="return f1()" action="mailingotp.jsp">
			<input type="text" placeholder="Your e-mail address" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your e-mail address';}">
			<div class="form-group w3ls-opt">
					<label for="Phone" class="control-label">Select Category</label><br>

					<label class="w3layouts">
						<input type="radio" name="category" id="hire" value="faculty" checked>Faculty
					</label>
					<label class="w3layouts label2">
						<input type="radio" name="category" id="work" value="student">Student
					</label>
				</div>
			<input type="submit" value="submit" onclick="f1();">
		</form>
	</div>
</div>
<div class="copy-right" >
			<p>© 2019 Reset Password. All rights reserved by <a href="index.jsp" target="_blank">  WebExam </a></p>
</div>

<!--element end here-->
</body>
</html>

<%
}
else{
	 out.println("<script>window.location.href='profile.jsp'</script>");
}

%>