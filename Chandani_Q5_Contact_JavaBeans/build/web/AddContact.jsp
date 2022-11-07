<%-- 
    Document   : AddContact
    Created on : 26 Oct, 2022, 9:31:28 PM
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
        <div class="container-fluid">
        
            <div class="row center">
                <h1 class="title">Add Contact</h1>
                
                <a href="AllContact.jsp"><button class="btn btn-primary">View All Contacts</button></a>
                
                <div class="col-md-3"></div>
                <div class="col-md-6 ">
                    <form action="ContactAction.jsp" method="post" class="formRow">
                        <div>
                        <label for="name" class="form-label">Name : </label>
                        <input type="text" name="txtName" id="name" class="form-control" placeholder="Name"/>
                        </div>
                        <div>
                        <label for="email" class="form-label">Email : </label>
                        <input type="email" name="txtEmail" id="email" class="form-control" placeholder="Email"/>
                        </div>
                        <div>
                        <label for="mobile" class="form-label">Mobile : </label>
                        <input type="text" name="txtMobile" id="mobile" class="form-control" placeholder="Mobile"/>
                        </div>
                        <div style="text-align:center;margin:10px">

                        <input type="submit" name="btnSubmit" id="insert" value="Add" class="btn btn-success btn-small" style="margin:0"/>
                        
                    </form>  
                </div>
                <div class="col-md-3 "></div>
            </div>
        </div>
    </body>
</html>
