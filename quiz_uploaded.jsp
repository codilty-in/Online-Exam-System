<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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

         Connection con=null;
         Statement st=null;
         Statement st1=null;
         ResultSet rs = null;
          ResultSet rs1 = null;

       
        
         try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
          }
    
         catch(Exception e2)
         {
          out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
         }

         String subject_name = request.getParameter("subject");
          String topic_name = request.getParameter("topic");
           String quiz_name = request.getParameter("quiz_name");

           try{
           st = con.createStatement();  
            st1 = con.createStatement();  
           rs = st.executeQuery("select curdate()");
           rs.next();
           String date = rs.getString(1);   

      st1.executeUpdate("insert into quizinfo(name,subject,topic,email,submit_date) values('"+quiz_name+"','"+subject_name+"','"+topic_name+"','"+email+"','"+date+"')");

       rs1 = st.executeQuery("select QID from quizinfo where name = '"+quiz_name+"'");
       rs1.next();
       int sid = rs1.getInt(1);
      for(int i=1;i<6;i++)
      {
        String question = request.getParameter("question"+i);
        String answer = request.getParameter("answer"+i);
       
         String option1 = request.getParameter("option"+i+"1");
          String option2 = request.getParameter("option"+i+"2");
           String option3 = request.getParameter("option"+i+"3");
            String option4 = request.getParameter("option"+i+"4");             
    st1.executeUpdate("insert into quizques value('"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"','"+sid+"')");  
      }

       out.println("<script>alert('Quiz Successfully Uploaded')</script>");
                     out.println("<script>window.location.href='profile.jsp'</script>"); 

       
       }
       catch(Exception e4)
       {
           out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }
}


%>