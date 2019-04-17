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
<link href="upload_questions/style.css" rel="stylesheet" type="text/css">
<style>
/*custom font*/

@import url(http://fonts.googleapis.com/css?family=Montserrat);
/*basic reset*/
* {
margin: 0;
padding: 0;
}
html {
height: 100%;
/*Image only BG fallback*/
background: url('img/gs.png');
/*background = gradient + image pattern combo*/
background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)),  url('img/gs.png');
}
body {
font-family: montserrat, arial, verdana;
}
/*form styles*/
#msform {
width: 900px; 
margin: 50px auto;
text-align: center;
position: relative;
}
#msform fieldset {
background: white;
border: 0 none;
border-radius: 3px;
box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
padding: 20px 30px;
box-sizing: border-box;
width: 80%;
margin: 0 10%;
/*stacking fieldsets above each other*/
position: absolute;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
display: none;
}
/*inputs*/
#msform input{
padding: 15px;
border: 1px solid #ccc;
border-radius: 3px;
margin-bottom: 10px;
width: 100%;
box-sizing: border-box;
font-family: montserrat;
color: #2C3E50;
font-size: 13px;
}
#msform textarea{
padding: 15px;
border: 1px solid #ccc;
border-radius: 3px;
margin-bottom: 10px;
width: 100%; max-width: 650px; min-width: 650px;
box-sizing: border-box;
font-family: montserrat;
color: #2C3E50;
font-size: 13px;
}
#msform select{
padding: 8px;
border: 1px solid #ccc;
border-radius: 3px;
margin-bottom: 10px;
box-sizing: border-box;
font-family: montserrat;
color: #2C3E50;
font-size: 13px;
}
/*buttons*/
#msform .action-button {
width: 100px;
background: #27AE60;
font-weight: bold;
color: white;
border: 0 none;
border-radius: 1px;
cursor: pointer;
padding: 10px 5px;
margin: 10px 5px;
}
#msform .action-button:hover, #msform .action-button:focus {
box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
font-size: 15px;
text-transform: uppercase;
color: #2C3E50;
margin-bottom: 10px;
}
.fs-subtitle {
font-weight: normal;
font-size: 13px;
color: #666;
margin-bottom: 20px;
}
/*progressbar*/
#progressbar {
margin-bottom: 30px;
overflow: hidden;
/*CSS counters to number the steps*/
counter-reset: step;
}
#progressbar li {
list-style-type: none;
color: white;
text-transform: uppercase;
font-size: 9px;
width: 16.667%;
float: left;
position: relative;
}
#progressbar li:before {
content: counter(step);
counter-increment: step;
width: 20px;
line-height: 20px;
display: block;
font-size: 10px;
color: #333;
background: white;
border-radius: 3px;
margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
content: '';
width: 100%;
height: 2px;
background: white;
position: absolute;
left: -50%;
top: 9px;
z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
/*connector not needed before the first step*/
content: none;
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before, #progressbar li.active:after {
background: #27AE60;
color: white;
}
/* For scrolling in textbox */
.scrollabletextbox {
    height:100px;
    width:200px;
    font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
    font-size: 82%;
    /*overflow:scroll;*/
    overflow-y: scroll;
}
#msform textarea:focus {
	outline: none;
	border-bottom: 2px solid #d82a4e;
}




</style>
<title>Upload Questions</title>
</head>
<body>

	<%
        String subject_name = request.getParameter("subject");
        String topic_name = request.getParameter("topic");
	%>

<h1 style="margin-top:20px" align="center">Upload Questions</h1>
<!-- multistep form -->
<form id="msform" name="form1" method="post" action="quiz_uploaded.jsp">
 
 <!-- Subject and Topic Name -->
	<input type="hidden" name="subject" value="<%= subject_name%>">
	<input type="hidden" name="topic" value="<%= topic_name%>">
<!-- progressbar -->
<ul id="progressbar">
	<li class="active">Quiz Name</li>
<li>Question 1</li>
<li>Question 2</li>
<li>Question 3</li>
<li>Question 4</li>
<li>Question 5</li>
</ul>
<!-- QuizName -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Give A Name To Quiz</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Quiz Name</h4><textarea maxlength="200"  maxlength="2000" class="scrollabletextbox" name="quiz_name" placeholder="Enter Quiz Name..." required=""></textarea>
<input type="button" name="next" class="next action-button" value="Next" />
</fieldset>
<!--  question 1 -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Question 1</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Question</h4><textarea maxlength="2000"  maxlength="2000" class="scrollabletextbox" name="question1" placeholder="Enter Question..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 1</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option11" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 2</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option12" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 3</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option13" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 4</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option14" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Select Answer</h4><select name="answer1" style="width: 30% !important;">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select><br><br>
<input type="button" name="previous" class="previous action-button" value="Previous" />
<input type="button" name="next" class="next action-button" value="Next" />
</fieldset>

<!--  question 2 -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Question 2</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Question</h4><textarea   maxlength="2000" class="scrollabletextbox" name="question2" placeholder="Enter Question..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 1</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option21" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 2</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option22" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 3</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option23" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 4</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option24" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Select Answer</h4><select name="answer2" style="width: 30% !important;">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select><br><br>
<input type="button" name="previous" class="previous action-button" value="Previous" />
<input type="button" name="next" class="next action-button" value="Next" />
</fieldset>

<!--  question 3 -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Question 3</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Question</h4><textarea   maxlength="2000" class="scrollabletextbox" name="question3" placeholder="Enter Question..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 1</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option31" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 2</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option32" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 3</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option33" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 4</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option34" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Select Answer</h4><select name="answer3" style="width: 30% !important;">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select><br><br>
<input type="button" name="previous" class="previous action-button" value="Previous" />
<input type="button" name="next" class="next action-button" value="Next" />
</fieldset>

<!--  question 4 -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Question 4</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Question</h4><textarea   maxlength="2000" class="scrollabletextbox" name="question4" placeholder="Enter Question..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 1</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option41" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 2</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option42" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 3</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option43" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 4</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option44" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Select Answer</h4><select name="answer4" style="width: 30% !important;">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select><br><br>
<input type="button" name="previous" class="previous action-button" value="Previous" />
<input type="button" name="next" class="next action-button" value="Next" />
</fieldset>

<!--  question 5 -->
<fieldset>
<h2 class="fs-title" style="margin-bottom: 25px !important;">Question 5</h2>
<h4 class="fs-subtitle" style="margin-bottom: 2px !important;">Question</h4><textarea   maxlength="2000" class="scrollabletextbox" name="question5" placeholder="Enter Question..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 1</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option51" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 2</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option52" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 3</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option53" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Option 4</h4><textarea   maxlength="2000" class="scrollabletextbox" name="option54" placeholder="Enter Option..." required=""></textarea>
<h4 class="fs-subtitle" style="float: left !important; margin-bottom: 2px !important;">Select Answer</h4><select name="answer5" style="width: 30% !important;">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select><br><br>
<input type="button" name="previous" class="previous action-button" value="Previous" />
<input type="submit" name="submit" class="submit action-button" value="Submit" />
</fieldset>

</form>

<!-- jQuery --> 
<script src="upload_questions/jquery.min.js"></script>
<script src="upload_questions/jquery-1.9.1.min.js"></script>
<!-- jQuery easing plugin --> 
<script src="upload_questions/jquery.easing.min.js" type="text/javascript"></script> 
<script>
$(function() {

//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	return true;
})

});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>

<%
}

%>