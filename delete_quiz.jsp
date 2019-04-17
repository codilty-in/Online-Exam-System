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

   response.setContentType("text/html");
   Statement st = null;
   Connection con = null;
   ResultSet rs = null;
   int QID=0;
  
  String quiz_name = request.getParameter("quiz_name");

  

   try{
  Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
      } 
       catch(Exception e2)
       {
           out.println("<script>alert('Invalid Operation')</script>");
            out.println("<script>window.location.href='profile.jsp'</script>");
       }

       try{
        st = con.createStatement();

        rs = st.executeQuery("select qid from quizinfo where name = '"+quiz_name+"'");
                   rs.next();
                   QID = rs.getInt(1);
        st.executeUpdate("delete from quizques where qid = '"+QID+"'");
       
        st.executeUpdate("delete from quizinfo where name = '"+quiz_name+"'");
        st.executeUpdate("ALTER TABLE quizinfo AUTO_INCREMENT=1");
        
        response.sendRedirect("profile.jsp");

        }
        catch(SQLException e3)
       {
            out.println("<script>alert('Invalid Operation')</script>");
            out.println("<script>window.location.href='profile.jsp'</script>");
       }
       catch(Exception e4)
       {
           out.println("<script>alert('Invalid Operation')</script>");
            out.println("<script>window.location.href='profile.jsp'</script>");
       }

%>