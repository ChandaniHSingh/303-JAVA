<%-- 
    Document   : Login
    Created on : 28 Oct, 2022, 10:23:44 PM
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
        <%
//            if(request.getParameter("inValidLogin") != ""){
//                String inValidUser = request.getParameter("inValidLogin");
//                if(inValidUser.equals("true")){
//                    System.out.print("<script>alert('Invalid User');</script>");
//                }
//            }
        %>
        <h1>Login</h1>
        <form action="Action.jsp" method="POST">
            Email : <input type="email" name="txtEmail" />
            Password : <input type="password" name="txtPwd" />
            <input type="submit" name="btnSubmit" value="Login"/>
        </form> 
    </body>
</html>
