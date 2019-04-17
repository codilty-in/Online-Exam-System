<!DOCTYPE html>
<html lang="en">
<head>
	<title>Computer Science WebExam</title>
	<meta charset="UTF-8">
	<meta name="description" content="WebUni Education Template">
	<meta name="keywords" content="webuni, education, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>


	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="site-logo">
						<img src="img/logo.png" alt="">
					</div>
					<div class="nav-switch">
						<i class="fa fa-bars"></i>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<a href="login.jsp" class="site-btn header-btn">Login</a>
					<nav class="main-menu">
						<ul>
							<li><a href="index.jsp">Home</a></li>							
							<li><a href="courses.jsp">Courses</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="contact.jsp">Our Team</a></li>
							<li><a href="select_subject.jsp">Create Quiz</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Hero section -->
	<section class="hero-section set-bg" data-setbg="img/bg.jpg">
		<div class="container">
			<div class="hero-text text-white">
				<h2>Get The Best Free Online Exams & Test Your Knowledge </h2>
			</div>
			
		</div>
	</section>
	<!-- Hero section end -->



	<!-- Page -->
	<section class="realated-courses spad">
		<div class="course-warp">
			<h2 class="rc-title">Realated Courses</h2>
			<div class="rc-slider owl-carousel">
				<!-- course -->

				<%
				int count=0;
                          for(int i=0;i<10;i++)
                          	{
                          		count++;

				%>
				<div class="course-item">
					
					<div class="course-info">
						<div class="course-text">
							<h5>Art & Crafts<%  out.println(count); %></h5>
							<p>Lorem ipsum dolor sit amet, consectetur</p>
							<div class="students">120 Students</div>
						</div>
						<div class="course-author">
							<div class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
							<p>William Parker, <span>Developer</span></p>
						</div>
					</div>
				</div>
				<%
                    }
				%>		
				
			</div>

		</div>
	</section>
	<!-- Page end -->


	<!-- signup section -->
	<section class="signup-section spad">
		<div class="signup-bg set-bg" data-setbg="img/signup-bg.jpg"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="signup-warp">
						<div class="section-title text-white text-left">
							<h2>Sign up to became a teacher</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus.</p>
						</div>
						<!-- signup form -->
						<form class="signup-form">
							<a href="login.jsp" class="site-btn">Sign Up</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- signup section end -->


	<!-- banner section -->
	<section class="banner-section spad">
		<div class="container">
			<div class="section-title mb-0 pb-2">
				<h2>Join Our Community Now!</h2>
				<p style="font-size: 20px;">Everything you want is out there waiting for you to ask. Everything you want also wants you. But you have to take action to get it.</p>
			</div>
			<div class="text-center pt-5">
				<a href="register.jsp" class="site-btn">Register Now</a>
			</div>
		</div>
	</section>
	<!-- banner section end -->


	<!-- footer section -->
	<footer class="footer-section spad pb-0">
		<div class="footer-top">
			<div class="footer-warp">
				<div class="row">
					<div class="widget-item">
						<h4>Contact Info</h4>
						<ul class="contact-list">
							<li>Rajasthan Technical University, Kota</li>
							<li>+91 7568654150</li>
							<li>onlinewebexam@gmail.com</li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Core Subjects</h4>
						<ul>
							<li><a href="">Database Management System</a></li>
							<li><a href="">Operating System</a></li>
							<li><a href="">Digital Logic</a></li>
							<li><a href="">Compiler Design</a></li>
							<li><a href="">Theory of Computation</a></li>
							<li><a href="">Computer Architecture</a></li>
							<li><a href="">Data Structure</a></li>
							<li><a href="">Computer Network</a></li>
							<li><a href="">Cryptography & Network Security</a></li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Programming Quiz</h4>
						<ul>
							<li><a href="">C Programming</a></li>
							<li><a href="">C++ Programming</a></li>
							<li><a href="">Java Programming</a></li>
							<li><a href="">Python</a></li>
							<li><a href="">JavaScript</a></li>
							<li><a href="">HTML5</a></li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Other Useful Links</h4>
						<ul>
							<li><a href="">Artificial Intelligence</a></li>
							<li><a href="">MySQL Database</a></li>
							<li><a href="">Machine Learning</a></li>
							<li><a href="">Node JS</a></li>
							<li><a href="">React JS</a></li>
						</ul>
					</div>
					<div class="widget-item" >
						<h4>Newsletter</h4>
						<form class="footer-newslatter">
							<input type="email" placeholder="E-mail">
							<button class="site-btn">Subscribe</button>							
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="footer-warp">
				<ul class="footer-menu">
					<li><a href="#">Terms & Conditions</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Privacy</a></li>
				</ul>
				
			</div>
		</div>
	</footer> 
	<!-- footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap1.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/circle-progress.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</html>