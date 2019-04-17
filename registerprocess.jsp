<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
     String ab=request.getParameter("otp");
     String ba=request.getParameter("hidden");
     

     if(ab.equals(ba))
{

     String a=request.getParameter("fname");
     String b=request.getParameter("lname");
     String c=request.getParameter("email");
   
     String e=request.getParameter("password");
     String f=request.getParameter("work");
     String g=request.getParameter("category");
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
        

     if(g.equals("faculty"))
     {
     	try{
            st=con.createStatement();st2=con.createStatement();
                   rs = st.executeQuery("select email from faculty");
                   rs1 = st2.executeQuery("select count(email) from faculty");
                   rs1.next();
                   int kp = rs1.getInt(1);
                  // out.println(kp);
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
                    out.println("<script>alert('Email alredy exists')</script>");
                     out.println("<script>window.location.href='register.jsp'</script>");
                   }
                   else{         
           st.executeUpdate("insert into faculty values('"+a+"','"+b+"','"+c+"','"+e+"','"+f+"')");

           out.println("<script>alert('Account created successfully, Please Login!')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");
         }
          HttpSession session2 =request.getSession();
                   HttpSession session1 =request.getSession();
                  session2.setAttribute("email",c); 
                   session1.setAttribute("category",g);
                  response.sendRedirect("profile.jsp?category="+g+"&&email="+c+"");

     }
       catch(Exception e4)
       {
          out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }
 }
 else{

   try{
            st=con.createStatement();st2=con.createStatement();
                   rs = st.executeQuery("select email from student");
                   rs1 = st2.executeQuery("select count(email) from student");
                   rs1.next();
                   int kp = rs1.getInt(1);
                   out.println(kp);
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
                    out.println("<script>alert('Email alredy exists')</script>");
                     out.println("<script>window.location.href='register.jsp'</script>");
                   }
                   else{         
           st.executeUpdate("insert into student values('"+a+"','"+b+"','"+c+"','"+e+"','"+f+"')");

          out.println("<script>alert('Account created successfully, Please Login!')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");
         }
          HttpSession session2 =request.getSession();
                   HttpSession session1 =request.getSession();
                  session2.setAttribute("email",c); 
                   session1.setAttribute("category",g);
                  response.sendRedirect("profile.jsp?category="+g+"&&email="+c+"");
     }
       catch(Exception e4)
       {
          out.println("<script>alert('Invalid Operation')</script>");
   out.println("<script>window.location.href='login.jsp'</script>");
       }
}

}

else
  {
     %>
    <!DOCTYPE html>
<html>
<head>
  <title></title>
  <script type="text/javascript">
    alert("Wrong OTP!");
    window.location.href='register.jsp'
  </script>
</head>
<body>

</body>
</html>
     <%

   }
   %>