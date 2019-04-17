<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%


String topic = request.getParameter("topic");

%>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Library Assets | Kiaalap - Kiaalap Admin Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/owl.carousel.css">
    <link rel="stylesheet" href="quiz_list/css/owl.theme.css">
    <link rel="stylesheet" href="quiz_list/css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/main.css">
    <!-- educate icon CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/educate-custon-icon.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="quiz_list/css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="quiz_list/css/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="quiz_list/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="quiz_list/js/vendor/modernizr-2.8.3.min.js"></script>

    <!-- Stylesheets -->
    <link href="img/favicon.ico" rel="shortcut icon"/>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
</head>

<body>
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
				<span><%  out.println(topic); %></span>
			</div>
		</div>
	</div>
	<!-- Page info end -->

  
    <div class="all-content-wrapper">   
            
        <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Available Quizes</h4>
                           
                            <div class="asset-inner">
                                <table>

                                    <tr>
                                        <th>No</th>                                      
                                        <th>Name</th>
                                        <th>Topic</th>                                       
                                        <th>Subject</th>
                                         <th>Date</th> 
                                    </tr>

    <%

            Statement st = null; 
            ResultSet rs = null;
            Connection con = null;
                  

    try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      }
     
       catch(Exception e2)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }

                                 try{
                                  st = con.createStatement();
                                  rs = st.executeQuery("select name, subject,submit_date from quizinfo where topic = '"+topic+"'");
                                  int count=1;

                                    while(rs.next())
                                    	{

                                    %>
                                    <tr>
                                        <td><% out.println(count); %></td>                                    
                                        <td><% out.println(rs.getString(1)); %></td>
                                        <td><% out.println(topic); %></td>  
                                        <td><% out.println(rs.getString(2)); %></td>
                                        <td><% out.println(rs.getString(3)); %></td>
                                         <td>
                                            <a href="attempt_quiz.jsp?&quiz_name=<%= rs.getString(1)%>"><button class="pd-setting">Attempt</button></a>
                                        </td>                                    
                                    </tr>
                                    <%
                                    count++;
                                           }
                                       }
                                      
                                   catch(Exception e4)
                                   {
                                    out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
                                     }
             %>

                                </table>
                            </div>
                             
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
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

    <!-- jquery
		============================================ -->
    <script src="quiz_list/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="quiz_list/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="quiz_list/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="quiz_list/js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="quiz_list/js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="quiz_list/js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="quiz_list/js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="quiz_list/js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="quiz_list/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="quiz_list/js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="quiz_list/js/metisMenu/metisMenu.min.js"></script>
    <script src="quiz_list/js/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="quiz_list/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="quiz_list/js/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="quiz_list/js/calendar/moment.min.js"></script>
    <script src="quiz_list/js/calendar/fullcalendar.min.js"></script>
    <script src="quiz_list/js/calendar/fullcalendar-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="quiz_list/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="quiz_list/js/main.js"></script>
    <!-- tawk chat JS
		============================================ -->
    <script src="quiz_list/js/tawk-chat.js"></script>
</body>

</html>