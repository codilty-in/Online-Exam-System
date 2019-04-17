<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
  HttpSession session1 = request.getSession();
    String email = (String)session1.getAttribute("email");

    if(email==null)
    {
        out.println("<script>alert('Login First')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
    }
     if(category.equals("student"))
    {
        out.println("<script>alert('Students can not create quiz!')</script>");
        out.println("<script>window.location.href='profile.jsp'</script>");
    }
    else{

%>

<html>
<head>
<title>Choose Topic</title>

<link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Reset Password Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--google fonts-->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>

<style type="text/css">	
.form-style-3{
	max-width: 450px;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}
.form-style-3 label{
	display:block;
	margin-bottom: 10px;
}
.form-style-3 label > span{
	float: left;
	width: 100px;
	color: #F072A9;
	font-weight: bold;
	font-size: 13px;
	text-shadow: 1px 1px 1px #fff;
}
.form-style-3 fieldset{
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	margin: 0px 0px 10px 0px;
	border: 1px solid #FFD2D2;
	padding: 20px;
	background: #FFF4F4;
	box-shadow: inset 0px 0px 15px #FFE5E5;
	-moz-box-shadow: inset 0px 0px 15px #FFE5E5;
	-webkit-box-shadow: inset 0px 0px 15px #FFE5E5;
}

.form-style-3 select{
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border: 1px solid #FFC2DC;
	outline: none;
	color: #F072A9;
	padding: 5px 8px 5px 8px;
	box-shadow: inset 1px 1px 4px #FFD5E7;
	-moz-box-shadow: inset 1px 1px 4px #FFD5E7;
	-webkit-box-shadow: inset 1px 1px 4px #FFD5E7;
	background: #FFEFF6;
	width:50%;
}
.form-style-3  input[type=submit],
.form-style-3  input[type=button]{
	background: #EB3B88;
	border: 1px solid #C94A81;
	padding: 5px 15px 5px 15px;
	color: #FFCBE2;
	box-shadow: inset -1px -1px 3px #FF62A7;
	-moz-box-shadow: inset -1px -1px 3px #FF62A7;
	-webkit-box-shadow: inset -1px -1px 3px #FF62A7;
	border-radius: 3px;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;	
	font-weight: bold;
}
.required{
	color:red;
	font-weight:normal;
}

</style>
</head>

<body style="background: url('img/gs.png') !important;">
<div class="elelment" style="margin-bottom: 200px !important;">
<div class="element-main">
		<h1 style="margin-bottom: 30px !important; color: black;">Select Subject</h1>
		
		<div class="form-style-3">
			<%
			         Connection con=null;
                     Statement st=null;                    
                     ResultSet rs = null;
                     ResultSet rs1 = null;
                     String subject_name = request.getParameter("subject");

			      try{
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
                  }
                  catch(ClassNotFoundException e)
                  {
                  	out.println(e);
                  }
                  catch(SQLException e1)
                  {
                  	out.println(e1);
                  }
                  
                  try{
                  st = con.createStatement();
                  rs = st.executeQuery("select sid from subjects where subject='"+subject_name+"'");   
                  rs.next();
                  int sub_id = rs.getInt(1);

                 rs1 = st.executeQuery("select topic from topics where sid='"+sub_id+"'");


			%>

<form name="form1" action="upload_questions.jsp">
	<fieldset>
  <input type="hidden" name="subject" value="<%= subject_name%>">
<label for="topic"><span>Topic</span><select name="topic"  class="select-field" required=""> 
	<% while(rs1.next())
           {
           	%>
           	<option>
           		<%= rs1.getString(1)       %> 
           	</option>
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

</select></label>

<label><span> </span><input type="submit" value="Next" /></label>
</fieldset>
</form>
</div>
	</div>
</div>
<div class="copy-right" >
			<p>© 2019 All rights reserved by <a href="index.jsp" target="_blank">  WebExam </a></p>
</div>
</body>
</html>

<%
}

%>