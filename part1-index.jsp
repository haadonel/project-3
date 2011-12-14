<%-- 
    Document   : index
    Created on : Dec 6, 2011, 9:15:56 PM
    Author     : dreamlord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <% boolean checkcode = "code".equals(request.getParameter("Code"));
       boolean checkinfo = "info".equals(request.getParameter("Info"));

       if (checkcode) {
          response.sendRedirect(getServletConfig().getInitParameter("myCode"));
       }
       else if (checkinfo) {
          response.sendRedirect(getServletConfig().getInitParameter("myInfo"));
       }
       
else {%>  
    
    <% String[] finalres; 
       String[] prices = new String[3];
       String[] quantities = new String[3];
    
       prices[0]=getServletConfig().getInitParameter("Cafe"); 
       prices[1]=getServletConfig().getInitParameter("Sugar"); 
       prices[2]=getServletConfig().getInitParameter("Water"); 

       Cookie[] cookies = request.getCookies(); 
 
       quantities[0]=request.getParameter("CafeQ");
       quantities[1]=request.getParameter("SugarQ");
       quantities[2]=request.getParameter("WaterQ");
       
       finalres = org.mypackage.hello.Items.calc(cookies, prices, quantities, "calculate".equals(request.getParameter("Submit")),"reset".equals(request.getParameter("Reset"))); 

       Cookie ck1 = new Cookie("Cafe", finalres[0]);
       response.addCookie(ck1);
       Cookie ck2 = new Cookie("Sugar", finalres[1]);
       response.addCookie(ck2);
       Cookie ck3 = new Cookie("Water", finalres[2]);
       response.addCookie(ck3);
    %>
    
    
  <body>
    <form method=GET 
     action="index.jsp">

    <h4>Project 3</h4>

    <table border="1">
        
    <tr>
     <td><b>Item</b></td>
    <td><b>Price</b></td>
     <td><b>Quantity</b></td>
     <td><b>Total</b></td>
    </tr>
    <tr>
     <td>Cafe</td>
     <td><%=prices[0]%></td>
     <td><input type=text name="CafeQ" value="<%=finalres[0]%>"></td>
     <td><%=finalres[3]%></td>
    </tr>
    <tr>
     <td>Sugar</td>
     <td><%=prices[1]%></td>
     <td><input type=text name="SugarQ" value="<%=finalres[1]%>"></td>
     <td><%=finalres[4]%></td>
    </tr>
    <tr>
     <td>Water</td>
     <td><%=prices[2]%></td>
     <td><input type=text name="WaterQ" value="<%=finalres[2]%>"></td>
     <td><%=finalres[5]%></td>
    </tr>
    <tr>
    <td>Total</td>
     <td></td>
     <td></td>
     <td><%=finalres[6]%></td>
    </tr>
    </table>
    
    <input type=submit name="Submit" value="calculate">   <input type=submit name="Reset" value="reset">   <input type=submit name="Code" value="code">   <input type=submit name="Info" value="info"> <br>
   </form>
  </body>
</html>

<%}%>
