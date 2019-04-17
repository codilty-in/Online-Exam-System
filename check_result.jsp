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
    else{
          
        String a =request.getParameter("qid");
           Statement st = null; 
            ResultSet rs = null;
            Connection con = null;
            int count=1;

             try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      }
       catch(Exception e2)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }
        String ans1=null;
        String ans2=null;
        String ans3=null;
        String ans4=null;
        String ans5=null;

        try{                 
                st = con.createStatement();
                rs = st.executeQuery("select answer from quizques where qid = '"+a+"'");
                rs.next();
                ans1 = rs.getString(1); rs.next();
                ans2 = rs.getString(1); rs.next();
                ans3 = rs.getString(1); rs.next();
                ans4 = rs.getString(1); rs.next();
                ans5 = rs.getString(1);

                response.sendRedirect("attempt_quiz.jsp?ans1="+ans1+"&ans2="+ans2+"&ans3="+ans3+"&ans4="+ans4+"&ans5="+ans5+"&result=check"+"&qid="+a);


           }
           
             catch(Exception e4)
               {
                    out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
               }
           }


%>