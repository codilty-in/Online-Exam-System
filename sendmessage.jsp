<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%

   response.setContentType("text/html");
  
        Connection con=null;
        Statement st=null;
         Statement st2=null;
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

         String a=request.getParameter("name");
     String b=request.getParameter("email");
      String c=request.getParameter("subject");
     String d=request.getParameter("message");

     try{
            st=con.createStatement();st2=con.createStatement();
                   rs = st.executeQuery("select email from contact");
                   rs1 = st2.executeQuery("select count(email) from contact");
                   rs1.next();
                   int kp = rs1.getInt(1);
                //   out.println(kp);
                   int kp1 = 0;
                   while(rs.next())
                   {
                    if(c.equals(rs.getString(1)) || kp==0)
                    {
                      break;
                    }
                    kp1++;
                   }
                   if(kp1 != kp)
                   {
                    out.println("<script>alert('You already have a message with this email')</script>");
                     out.println("<script>window.location.href='contact.jsp'</script>");
                   }
                   else
                   {         
           st.executeUpdate("insert into contact values('"+a+"','"+b+"','"+c+"','"+d+"')");
           out.println("<script>alert('Message sent successfully')</script>");
                     out.println("<script>window.location.href='contact.jsp'</script>");
         }
     }
       catch(Exception e4)
       {
           out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }

%>