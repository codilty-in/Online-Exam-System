<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
     
      HttpSession session1 = request.getSession();
    String email = (String)session1.getAttribute("email");

    if(email==null)
    {
        out.println("<script>window.location.href='login.jsp'</script>");
    }

       
       session1.invalidate(); 

       response.sendRedirect("login.jsp");   

%>