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
        <link rel="stylesheet" href="./css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        <div class="container-fluid">
        
            <div class="row">
                <h1 class="title">Login</h1>
                <div class="col-md-3"></div>
                <div class="col-md-6 ">
                    <form action="Action.jsp" method="post" class="formRow">
                        <div>
                        <label for="email" class="form-label">Email : </label>
                        <input type="email" name="txtEmail" id="email" class="form-control" placeholder="Email"/>
                        </div>
                        <div>
                        <label for="password" class="form-label">Password : </label>
                        <input type="password" name="txtPwd" id="password" class="form-control" placeholder="Password"/>
                        </div>
                        <div style="text-align:center;margin:10px">

                        <input type="submit" name="btnSubmit" id="login" value="Login" class="btn btn-success btn-small" style="margin:0"/>
                        
                    </form>  

                </div>
                <div class="col-md-2">


                </div>
            </div>
        </div>
    </body>
</html>
