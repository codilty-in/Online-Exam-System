<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
    
     response.setContentType("text/html");
       Connection con=null;
        Statement st=null;
         ResultSet rs=null;

       try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/oq","root","76625362");
        }
       catch(Exception e2)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }

        String a=request.getParameter("email");
     String b=request.getParameter("password");
      String c=request.getParameter("category");
    
    if(c.equals("faculty"))
      {
     try
       {
           st=con.createStatement();
            rs=st.executeQuery("select * from faculty where email='"+a+"' and userpass='"+b+"'");
                if(rs.next())
                {

                  HttpSession session2 =request.getSession();
                   HttpSession session1 =request.getSession();
                  session2.setAttribute("email",a); 
                   session1.setAttribute("category",c);
                  response.sendRedirect("profile.jsp?category="+c+"&&email="+a+"");
                }
                else                
                {
                  out.println("<script>alert('Wrong Password')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");                    
                }
       }
     
       catch(Exception e4)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }
      }
      else
      {
        try
       {
           st=con.createStatement();
            rs=st.executeQuery("select * from student where email='"+a+"' and userpass='"+b+"'");
                if(rs.next())
                {
                  HttpSession session2 =request.getSession();
                   HttpSession session1 =request.getSession();
                  session2.setAttribute("email",a); 
                   session1.setAttribute("category",c);
                  response.sendRedirect("profile.jsp?category="+c+"&&email="+a+"");
                }
                else                
                {
                  out.println("<script>alert('Wrong Password')</script>");
                     out.println("<script>window.location.href='login.jsp'</script>");                    
                }
       }
       
       catch(Exception e4)
       {
            out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
       }
      }

%>