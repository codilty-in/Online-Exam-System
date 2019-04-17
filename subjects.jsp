<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%

    String subject = request.getParameter("subject");
   // out.println(subject);

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>WebUni - Education Template</title>
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
						<a href="index.jsp"> <img src="img/logo.png" alt=""></a>
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
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Page info -->
	<div class="page-info-section set-bg" data-setbg="img/page-bg/1.jpg">
		<div class="container">
			<div class="site-breadcrumb">
				<a href="index.jsp">Home</a>
				<a href="courses.jsp">Courses</a>
				<span><%  out.println(subject); %></span>
			</div>
		</div>
	</div>
	<!-- Page info end -->



	<!-- course section -->
	<section class="course-section spad pb-0" style="margin-bottom: 50px !important;">
		<div class="course-warp">
			<ul class="course-filter controls">
				<li class="control active" data-filter="all">Topics</li>
			</ul>                                       
			<div class="row course-items-area">
	
<%


     Statement st = null; Statement st1 = null;
   ResultSet rs = null;
   ResultSet rs1 = null;
     ResultSet rs2 = null;
      ResultSet rs3 = null;
   Connection con = null;
   String k=""; 
    int n=0; int sid=0; int no_of_quiz=0;

   try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      }
      catch(ClassNotFoundException e1)
       {
           out.println(e1);
       }
       catch(SQLException e2)
       {
           out.println(e2);
       }

      try{
      st = con.createStatement();
      rs = st.executeQuery("select sid from subjects where subject='"+subject+"'");
      rs.next();
      sid = rs.getInt(1);
      rs1 = st.executeQuery("select count(TID) from topics where sid="+sid+"");
      rs1.next();
      n=rs1.getInt(1);    
      rs2 = st.executeQuery("select topic from topics where sid="+sid+"");
      

     
      while(rs2.next())
    {
 	
 	 k=rs2.getString(1);
 	 st1 = con.createStatement();
 	 rs3 = st1.executeQuery("select count(NAME) from quizinfo where topic='"+k+"'");
 	 rs3.next();
 	 no_of_quiz = rs3.getInt(1);
             
%>
				<div class="mix col-lg-3 col-md-4 col-sm-6 finance">
					<div class="course-item">
						<div class="course-info">
							<div class="course-text">
								<h5><a href="quiz.jsp?&topic=<%= k%>"><%  out.println(k); %></a></h5>
								<p>Total Quiz : <% out.println(no_of_quiz); %></p>
							</div>
							
						</div>
					</div>
				</div>

<%
    }
}
      catch(SQLException e3)
       {
        out.println(e3);
       }
       catch(Exception e4)
       {
           out.println(e4);
       }
%>

				
			</div>
			
		</div>
	</section>
	<!-- course section end -->




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
							<li>vids.nagar7@gmail.com</li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Core Subjects</h4>
						<ul>
							<li><a href="dbms.jsp">Database Management System</a></li>
							<li><a href="operating_system.jsp">Operating System</a></li>
							<li><a href="digital_logic.jsp">Digital Logic</a></li>
							<li><a href="compiler.jsp">Compiler Design</a></li>
							<li><a href="#">Theory of Computation</a></li>
							<li><a href="#">Computer Architecture</a></li>
							<li><a href="data_structure.jsp">Data Structure</a></li>
							<li><a href="computer_network.jsp">Computer Network</a></li>
							<li><a href="#">Cryptography & Network Security</a></li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Programming Quiz</h4>
						<ul>
							<li><a href="#">C Programming</a></li>
							<li><a href="#">C++ Programming</a></li>
							<li><a href="java.jsp">Java Programming</a></li>
							<li><a href="python.jsp">Python</a></li>
							<li><a href="javascript.jsp">JavaScript</a></li>
							<li><a href="html.jsp">HTML5</a></li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Other Useful Links</h4>
						<ul>
							<li><a href="#">Artificial Intelligence</a></li>
							<li><a href="#">MySQL Database</a></li>
							<li><a href="#">Machine Learning</a></li>
							<li><a href="nodejs.jsp">Node JS</a></li>
							<li><a href="#">React JS</a></li>
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
</body>
</html>