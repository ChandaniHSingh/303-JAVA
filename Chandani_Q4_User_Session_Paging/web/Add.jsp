<%-- 
    Document   : Add
    Created on : 1 Nov, 2022, 12:05:03 PM
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
            Boolean isLogin = false;
            HttpSession mysession = request.getSession();
            if(mysession.getAttribute("isLogin") == "true"){
                isLogin = true;
            }
            if(isLogin == true){
        %>
        <h1>Add User</h1>
        <a href="Home.jsp">View ALL Users</a><br>
        <a href="Logout.jsp">Logout</a>
        
        <form action="Action.jsp" mehtod="POST">
            Name : <input type="text" name="txtName" /><br><br>
            Email : <input type="email" name="txtEmail" /><br><br>
            Password : <input type="password" name="txtPwd" /><br><br>
            <input type="submit" name="btnSubmit" value="Add" />
        </form>
        <%
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
