<%@ page contentType="text/html; charset=utf-8" language="java" 
import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*,java.io.*,javax.activation.*,java.net.*,javax.servlet.http.*,com.sun.net.ssl.internal.www.protocol.https.*,java.security.Security" errorPage="" %>

<%
Random rand = new Random();
String otp= String.valueOf(rand.nextInt(9000) + 1000);
String toa="";
String b=request.getParameter("category");
try
{

     toa=request.getParameter("email");
     String []to=toa.split(",");           
                     
Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
String host = "smtp.googlemail.com";//GOOGLE SERVER NAME....
String from = "onlinewebexam@gmail.com";//THIS GMAIL ID WILL SEND MAIL....
    String pass = "76625362";//THIS IS PASSWORD OF SPECIFIED ID....
    Properties props = System.getProperties();
    props.put("mail.smtp.starttls.enable", "true"); // IF IT IS TRUE ONLY THEN EMAIL WILL BE //SENT....
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
props.put("mail.smtp.port", "587");//ASSIGN A PORT THROUGH WHICH ALL WORKING IS //DONE....
    props.put("mail.smtp.auth", "true");//MAKE AUTHORIZATION TRUE....
 
    
    Session session1 = Session.getInstance(props,null);

    MimeMessage message = new MimeMessage(session1);//THIS WILL BE USED TO ATTACH A //FILE LATER....
    message.setFrom(new InternetAddress(from));
 
    InternetAddress[] toAddress = new InternetAddress[to.length];
 
    //TO GET THE ADDRESS OF ARRAY....
    for( int i=0; i < to.length; i++ ) 
    { 
        toAddress[i] = new InternetAddress(to[i]);
    }
   
 //THIS WILL READ THE ADDRESSES ONE BY ONE WHICH ARE SPECIFIED TO SEND MAIL....
    for( int i=0; i < toAddress.length; i++)
    { 
        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
    }
    message.setSubject("Verify Mail For Reset Password");
    message.setText(otp);
Transport transport = session1.getTransport("smtp");
  
transport.connect(host, from, pass);

transport.sendMessage(message, message.getAllRecipients());
    transport.close();
    
RequestDispatcher dp=request.getRequestDispatcher("verifyotp.jsp?k="+otp+"&k1="+toa+"&k2="+b+"");
    dp.forward(request, response);
    }
    catch(Exception e1)
    {
         out.println("<script>alert('Invalid Operation')</script>");
        out.println("<script>window.location.href='login.jsp'</script>");
        }


%>
