<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
    String quiz_name = request.getParameter("quiz_name");

    HttpSession session1 = request.getSession();
    String email = (String)session1.getAttribute("email");

    if(email==null)
    {
        out.println("<script>alert('Login First')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
    }
    else{

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>Quiz</title>
	
	<style type="text/css">
    {
     margin: 0; padding: 0; 
 }
body               
 { 
    font: 14px Georgia, serif; 
}

#page-wrap          
{ 
    width: 500px; margin: 0 auto; 
}

h1{ 
    margin-top: 35px ; font: 20px Georgia, Serif; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 40px;
    text-shadow: 2px 1px blue; box-shadow: 3px 2px 3px 3px  yellow; 
}
h1:hover{
    background: url('img/gs.png');
      text-shadow: 2px 1px blue; box-shadow: 3px 2px 3px 3px black; 
}

#quiz input {
    vertical-align: middle;
}

#quiz ol {
   margin: 0 0 10px 20px;
}

#quiz ol li {
   margin: 0 0 20px 0;
}

#quiz ol li div {
   padding: 4px 0;
}

#quiz h4 {
   font-size: 15px; margin: 0 0 1px 0; color: #666;
}

#results {
    font: 44px Georgia, Serif;
}
.time_count{
       float: right; /*margin-top: -10px; margin-right: 150px; */
    box-sizing: border-box; background-color: pink;
}
.answered label{
   color: green !important;
}
.btn{
  width: 500px; height: 50px; }
form .btn button{
      padding: 5px 10px 5px; margin: 20px 200px 10px ; 
}
form .btn button:hover{
  background-color: gray;

}

   
    </style>

</head>

<body>
  <div style="">
                 
  </div>

  <%
        String result = "check";
        String get_result = request.getParameter("result");
       
         Statement st = null; 
            ResultSet rs = null;
             Statement st1 = null; 
            ResultSet rs1 = null;
            Connection con = null;
            int QID = 0;
                  

    try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      }
      
       catch(Exception e2)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }

        if(result.equals(get_result))
        {
        
         
  %>

  <div id="page-wrap" style="background-color: lightblue !important; padding: 2px 20px 10px 20px !important; ">
    <h1 style="text-align: center; padding: 5px;">ANSWERS</h1>
   
    <form action="check_result.jsp" method="post" id="quiz">
    
            <ol>
               
                <%

           try{
                   int qid = Integer.parseInt(request.getParameter("qid"));
                   String ans1 = request.getParameter("ans1");int a1=Integer.parseInt(ans1);
                   String ans2= request.getParameter("ans2");int a2=Integer.parseInt(ans2);
                    String ans3 = request.getParameter("ans3");int a3=Integer.parseInt(ans3);
                    String ans4 = request.getParameter("ans4");int a4=Integer.parseInt(ans4);
                    String ans5 = request.getParameter("ans5");int a5=Integer.parseInt(ans5);
                    int arr[] = {a1,a2,a3,a4,a5};

                   st = con.createStatement(); st1 = con.createStatement();
                   rs = st.executeQuery("select question from quizques where qid = '"+qid+"'");
                    rs1 = st1.executeQuery("select option1,option2,option3,option4 from quizques where qid = '"+qid+"'");
                   int count = 0 ;

                  while(rs.next()&& rs1.next())
                    {
                      

                %>
                <li class="answered">
                
                    <h4><% out.println(rs.getString(1)); %></h4>
                    
                    <div>                      
                        Ans. <label><% out.println(rs1.getString(arr[count])); %> </label>
                    </div>
                    
                </li>
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
            
            </ol>
  
    </form>
  
  </div>
  
  <script type="text/javascript">
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  </script>
  <script type="text/javascript">
  var pageTracker = _gat._getTracker("UA-68528-29");
  pageTracker._initData();
  pageTracker._trackPageview();
  </script>

    <%
  }
  else{
%>
 <div class="time_count">        
        <form name="form1">
       Time Left: <input type="text" name="time" style=" border: none; background-color: pink">
    </div>
</form>
  <div id="page-wrap" style="background-color: lightblue !important; padding: 2px 20px 10px 20px !important; ">

    <h1 style="text-align: center; padding: 5px;"><% out.println(quiz_name); %></h1>
    
    <form action="check_result.jsp" method="post" id="quiz">
    
            <ol>
               
                <%

           try{
                   
                   st = con.createStatement();
                   rs = st.executeQuery("select qid from quizinfo where name = '"+quiz_name+"'");
                   rs.next();
                   QID = rs.getInt(1);
                   rs = st.executeQuery("select question, option1, option2, option3, option4 from quizques where qid = '"+QID+"'");
                   int count = 1;

                  while(rs.next())
                    {

                %>
                <li>
                
                    <h4><% out.println(rs.getString(1)); %></h4>
                    
                    <div>
                        <input type="radio" name="question-<%= count %>-answers" id="question-<%= count %>-answers-A" value="1"/>
                        <label for="question-<%= count %>-answers-A">1) <% out.println(rs.getString(2)); %> </label>
                    </div>
                    
                    <div>
                        <input type="radio" name="question-<%= count %>-answers" id="question-<%= count %>-answers-B" value="2" />
                        <label for="question-<%= count %>-answers-B">2) <% out.println(rs.getString(3)); %></label>
                    </div>
                    
                    <div>
                        <input type="radio" name="question-<%= count %>-answers" id="question-<%= count %>-answers-C" value="3"  />
                        <label for="question-<%= count %>-answers-C">3) <% out.println(rs.getString(4)); %></label>
                    </div>
                    
                    <div>
                        <input type="radio" name="question-<%= count %>-answers" id="question-<%= count %>-answers-D" value="4"   />
                        <label for="question-<%= count %>-answers-D">4) <% out.println(rs.getString(5)); %></label>
                    </div>
                
                </li>
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
            
            </ol>

            <input type="hidden" name="qid" value="<%= QID%>">
            
        <div class="btn">    <button type="submit" onclick="return cnf()">Submit Quiz</button></div>
    
    </form>
  
  </div>
  
  <script type="text/javascript">
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  </script>
  <script type="text/javascript">
  var pageTracker = _gat._getTracker("UA-68528-29");
  pageTracker._initData();
  pageTracker._trackPageview();
  </script>

    <script type="text/javascript">
        var a = 300;
        var t, b=0;
        var n;
        function f1()
        {
            b=a%60;
            n=Math.floor(a/60);
            document.form1.time.value=n+" : "+b;
            if(a==0)
            {
                cnf();
            }
            a=a-1;

            t = setTimeout("f1()",1000)
        }
        f1();

        function cnf()
        {
          var v = confirm('You want to submit quiz!');
    if(v)
    {
      return true;
    }
    else
    {
     return false;
    }
        }
    </script>

<%
}

%>
    

</body>

</html>

<%
}
%>