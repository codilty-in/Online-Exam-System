<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<%
HttpSession session1 = request.getSession();
    String email = (String)session1.getAttribute("email");
      String category = (String)session1.getAttribute("category");

    if(email==null)
    {
        out.println("<script>alert('Login First')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
    }

   response.setContentType("text/html");
   Statement st = null;
   Connection con = null;


   try{
  Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      } 
      
       catch(SQLException e2)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }

       try{
        st = con.createStatement();
       if(category.equals("student")){     
       st.executeUpdate("delete from student where email = '"+email+"'");
        session1.invalidate(); 
        out.println("<script>alert('Account Successfully Deleted')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");

         }
         else{
       st.executeUpdate("delete from faculty where email = '"+email+"'");
        session1.invalidate(); 
       out.println("<script>alert('Account Successfully Deleted')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");
             }
        }
     
       catch(Exception e4)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }

%>