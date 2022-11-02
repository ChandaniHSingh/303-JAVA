<%-- 
    Document   : Logout
    Created on : 1 Nov, 2022, 1:11:27 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logout</h1>
        <%
            HttpSession mysession = request.getSession();
            mysession.invalidate();
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
