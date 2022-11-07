<%-- 
    Document   : ThankYou
    Created on : 7 Nov, 2022, 11:31:46 AM
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
            HttpSession mysession = request.getSession();
        %>
        <div class="container-fluid">
            <div class="row">
                <h1 class="title">Thank You for Order</h1>
                <h3 class="title">Welcome <%= mysession.getAttribute("name")%></h3>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <a href="Home.jsp"><button class="btn btn-primary">Products</button></a>
                    <a href="Cart.jsp"><button class="btn btn-primary">Cart</button></a>
                    <a href="AllOrder.jsp"><button class="btn btn-primary">My Orders</button></a>
                    <a href="Logout.jsp"><button class="btn btn-danger">Logout</button></a>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </body>
</html>
