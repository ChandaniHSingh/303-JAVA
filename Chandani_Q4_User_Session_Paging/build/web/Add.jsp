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
        <link rel="stylesheet" href="./css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        <div class="container-fluid">
        
            <div class="row">
                <h1 class="title">Add User</h1>
                
                <a href="Home.jsp"><button class="btn btn-primary">View All User</button></a>
                <br/><br/>
                <a href="Logout.jsp"><button class="btn btn-danger">Logout</button></a>
                
                <div class="col-md-3"></div>
                <div class="col-md-6 ">
                    <form action="Action.jsp" method="post" class="formRow">
                        <div>
                        <label for="name" class="form-label">Name : </label>
                        <input type="text" name="txtName" id="name" class="form-control" placeholder="Name"/>
                        </div>
                        <div>
                        <label for="email" class="form-label">Email : </label>
                        <input type="email" name="txtEmail" id="email" class="form-control" placeholder="Email"/>
                        </div>
                        <div>
                        <label for="password" class="form-label">Password : </label>
                        <input type="password" name="txtPwd" id="password" class="form-control" placeholder="Password"/>
                        </div>
                        <div style="text-align:center;margin:10px">

                        <input type="submit" name="btnSubmit" id="insert" value="Add" class="btn btn-success btn-small" style="margin:0"/>
                        
                    </form>  
                </div>
                <div class="col-md-3 "></div>
            </div>
        </div>
        <%
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
