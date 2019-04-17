<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
response.setContentType("text/html");
   String pass = request.getParameter("password");
  String email = request.getParameter("email");
   String b = request.getParameter("category");

   if(b==null)
   {
    out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
   }
   else{

        Connection con=null;
        Statement st=null;
 
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
        }
        catch(ClassNotFoundException e1)
       {
           out.println(e1);
       }
       catch(SQLException e2)
       {
           out.println(e2);
       }

      
   if(b.equals("faculty"))
   {
   	try{
     st=con.createStatement();
        st.executeUpdate("update faculty set userpass='"+pass+"' where email='"+email+"'");
        out.println("<script>alert('Password updated successfully, Please Login!')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");
   }
   catch(SQLException e3)
     {
        out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }
       catch(Exception e4)
       {
          out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }
   }
   else
   {
    try{
     st=con.createStatement();
              st.executeUpdate("update student set userpass='"+pass+"' where email='"+email+"'");
        out.println("<script>alert('Password updated successfully, Please Login!')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");

}
catch(SQLException e3)
     {
        out.println(e3);
       }
       catch(Exception e4)
       {
           out.println(e4);
       }

   }

}
%>