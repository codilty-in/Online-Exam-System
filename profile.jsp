<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
    HttpSession session1 = request.getSession();
    HttpSession session2 = request.getSession();
    String email = (String)session1.getAttribute("email");
    String category = (String)session2.getAttribute("category");

    if(email!=null)
        {
               Statement st = null, st1=null; 
            ResultSet rs = null, rs1 = null, rs2 = null;
            Connection con = null;
            String student_name = null;
            String faculty_name = null;
                  

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
                rs2 = st.executeQuery("select firstname, lastname from faculty where email='"+email+"'");
                rs2.next();
                faculty_name = rs2.getString(1) + " " + rs2.getString(2);             

   }

         catch(Exception e4)
                {
                   out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
                 }

%>


<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Profile</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="quiz_list/img/favicon.ico">
      <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
      <link rel="stylesheet" href="quiz_list/css/bootstrap.min.css">
    <link rel="stylesheet" href="quiz_list/css/main.css">
   <link rel="stylesheet" href="quiz_list/css/form/all-type-forms.css">    
    <link rel="stylesheet" href="quiz_list/css/style.css"> 
    <link rel="stylesheet" href="quiz_list/css/responsive.css">
    <link rel="stylesheet" href="css/style.css"/>
   
    <script src="quiz_list/js/vendor/modernizr-2.8.3.min.js"></script>


<!--   For Making Profile -->
  <link href="profile/css/style.css" rel="stylesheet">


  <!--   For Making Table -->
 
    <link rel="stylesheet" type="text/css" href="table_in_profile/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/css/util.css">
    <link rel="stylesheet" type="text/css" href="table_in_profile/css/main.css">

    <!-- Header -->
        <link href="img/favicon.ico" rel="shortcut icon"/>
       

   
</head>

<body>
<!-- Page Preloder -->
  
    <header class="header-section" style="background: url(img/page-top-bg.jpg); height: 200px !important">
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
                    <a href="logout.jsp" class="btn btn-primary" style="float: right; margin-top: 10px;">Logout</a>
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
    
           
        <!-- Single pro tab review Start-->
        <div class="single-pro-review-area mt-t-30 mg-b-15" style="margin-top: 200px !important;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="profile-info-inner">
                        <div class="profile-img" style="text-align: center; margin-top: 3px; margin-bottom: 23px;">
                                <h3 style="color: green;">Personal Details</h3>
                            </div>
                            <div class="profile-details-hr">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr">
                                            <p><b>Name</b><br /> <% out.println(faculty_name); %></p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                            <p><b>Designation</b><br /> <% out.println(category); %></p>
                                        </div>
                                    </div>
                                </div>                         
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr">
                                            <p><b>Email</b><br /> <% out.println(email); %></p>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-lg-12">
                                        <div class="widget user-dashboard-menu">
                                         <ul>
                            
                                                <li>
                                                      <a href="select_subject.jsp"><i class="fa fa-bookmark-o"></i>Create Quiz</a>
                                                </li>
                                                <li>
                                                      <a href="all_quizes.jsp"><i class="fa fa-bookmark-o"></i> Attempt Quiz</a>
                                                </li>
                                                  <li>
                                                        <a href="delete_account.jsp?" onclick="return remove();" ><i class="fa fa-power-off"></i>Delete Account</a>
                                                 </li>
                                         </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="product-payment-inner-st res-mg-t-30 analysis-progrebar-ctn">
                            <ul id="myTabedu1" class="tab-review-design">
                                <li class="active"><a href="#reviews"> Recent Quizes</a></li>
                                <li><a href="#INFORMATION">Update Details</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content custom-product-edit">
                               
                        

                            <%  
                            if(category.equals("faculty"))
                            {

                                 try{
                                  st = con.createStatement();
                                  rs = st.executeQuery("select name, subject, topic, submit_date from quizinfo where email='"+email+"'");
                                  int count=1;
                              %>     <div class="product-tab-list tab-pane active in fade" id="reviews">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="limiter">
                                                    <div class="container-table100" >
                                                         <div class="wrap-table100">
                                                              <div class="table100">
                                                                    <table>
                                                                            <thead>
                                                                               <tr class="table100-head">
                                                                                 <th class="column1">Date</th>
                                                                                 <th class="column2">ID</th>
                                                                                 <th class="column3">Quiz Name</th>
                                                                                 <th class="column4">Subject</th>
                                                                                 <th class="column5">Topic</th>
                                                                                 <th class="column6"></th>                            
                                                                               </tr>
                                                                           </thead>
                                                                          <tbody>

                              <%

                                    while(rs.next())
                                        {

                                    %>

                                                                                <tr>
                                                                                    <td class="column1"><% out.println(rs.getString(4)); %></td>
                                                                                    <td class="column2"><% out.println(count); %></td>
                                                                                   <td class="column3"><% out.println(rs.getString(1)); %></td>
                                                                                   <td class="column4"><% out.println(rs.getString(2)); %></td>
                                                                                  <td class="column5"><% out.println(rs.getString(3)); %></td>
                                                                                   <td style="text-align: center;" class="column6">   <a class="delete" href="delete_quiz.jsp?&quiz_name=<%= rs.getString(1)%>" onclick="return remove();">
                                                                                    <i class="fa fa-trash" onclick="return remove();"></i>
                                                                                   </a></td>
                                    
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
                                                                                  </tbody>
                                                                              </table>
                                                                        </div>
                                                                 </div>
                                                          </div>
                                                    </div>
                                             </div>
                                        </div>
                                    </div>
                                </div>
                                     <%
                                }  


                             ///////////////////////////////////////
///////////////////////////////////////////    STUDENT   ////////////////////////////////////////////////
                           //////////////////////////////////////////

                           else{
                                 try{
                                  st = con.createStatement();
                                  rs = st.executeQuery("select name, subject, topic, submit_date from quizinfo where email='"+email+"'");
                                  int count=1;

                            %>            
                                    <div class="product-tab-list tab-pane active in fade" id="reviews">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="limiter">
                                                    <div class="container-table100" >
                                                         <div class="wrap-table100">
                                                              <div class="table100">
                                                                    <table>
                                                                            <thead>
                                                                               <tr class="table100-head">
                                                                                 <th class="column1">Date</th>
                                                                                 <th class="column2">ID</th>
                                                                                 <th class="column3">Quiz Name</th>
                                                                                 <th class="column4">Subject</th>
                                                                                 <th class="column5">Topic</th>
                                                                                 <th class="column6"></th>                            
                                                                               </tr>
                                                                           </thead>
                                                                          <tbody>

                              <%

                                    while(rs.next())
                                        {

                                    %>

                                                                                <tr>
                                                                                    <td class="column1"><% out.println(rs.getString(4)); %></td>
                                                                                    <td class="column2"><% out.println(count); %></td>
                                                                                   <td class="column3"><% out.println(rs.getString(1)); %></td>
                                                                                   <td class="column4"><% out.println(rs.getString(2)); %></td>
                                                                                  <td class="column5"><% out.println(rs.getString(3)); %></td>
                                                                                   <td style="text-align: center;" class="column6">   <a class="delete" href="delete_quiz.jsp?&quiz_name=<%= rs.getString(1)%>" onclick="return remove();">
                                                                                    <i class="fa fa-trash" onclick="return remove();"></i>
                                                                                   </a></td>
                                    
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
                                                                                  </tbody>
                                                                              </table>
                                                                        </div>
                                                                 </div>
                                                          </div>
                                                    </div>
                                             </div>
                                        </div>
                                    </div>
                                </div>

                            <%
                              }
                            %>                  
                                                                          
                                <div class="product-tab-list tab-pane fade" id="INFORMATION">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                           First Name:  <input name="number" type="text" class="form-control" name="fname" placeholder="First Name">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="lname" placeholder="Last Name">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="email" placeholder="Email">
                                                        </div>
                                                       <div class="form-group">
                                                            <select class="form-control">
                                                                <option>Select Gender</option>
                                                                <option>Male</option>
                                                                <option>Female</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="pass" placeholder="Password">
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="row" style="margin-top: 20px; ">
                                                    <div class="col-lg-6">
                                                        <div class="payment-adress mg-t-15">
                                                            <button type="submit" class="btn btn-primary waves-effect waves-light mg-b-15">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>

    <!-- Footer Bottom -->
<footer class="footer-bottom" style="background-color: #d8214e !important;">
    <!-- Container Start -->
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-12">
          <!-- Copyright -->
          <div class="copyright">
            <p>Copyright © 2019. All Rights Reserved</p>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <!-- Social Icons -->
          <ul class="social-media-icons text-right">
              <li><a class="fa fa-facebook" href=""></a></li>
              <li><a class="fa fa-twitter" href=""></a></li>
              <li><a class="fa fa-pinterest-p" href=""></a></li>
              <li><a class="fa fa-vimeo" href=""></a></li>
            </ul>
        </div>
      </div>
      <div class="footer-warp" >
                <ul class="footer-menu" >
                    <li><a href="#" style="color: lightblue;">Terms & Conditions</a></li>
                    <li><a href="#" style="color: lightblue;">Register</a></li>
                    <li><a href="#" style="color: lightblue;">Privacy</a></li>
                </ul>
            </div>
    </div>
    
    <!-- Container End -->
    <!-- To Top -->   
</footer>



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
   
    <!-- tab JS
		============================================ -->
    <script src="quiz_list/js/tab.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="quiz_list/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="quiz_list/js/main.js"></script>
    <!-- tawk chat JS
		============================================ -->
    <script src="quiz_list/js/tawk-chat.js"></script>



    <!--  For Table -->

    <!--===============================================================================================-->  
    <script src="table_in_profile/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
    <script src="table_in_profile/vendor/bootstrap/js/popper.js"></script>
    <script src="table_in_profile/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
    <script src="table_in_profile/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
    <script src="table_in_profile/js/main.js"></script>
    <script type="text/javascript">
        function remove(){
            var confirmation = confirm('Do you want to delete');
            if(confirmation)  { return true;}
            else {return false; }
        }
    </script>
   

</body>

</html>
    <%
}
else
{
    response.sendRedirect("login.jsp");
}

%>