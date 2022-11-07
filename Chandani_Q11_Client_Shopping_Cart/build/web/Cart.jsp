<%-- 
    Document   : Cart
    Created on : 1 Nov, 2022, 3:26:43 PM
    Author     : Sumit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<jsp:useBean id="mycart" class="Beans.ShoppingCart" scope="session"/>
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
                
            
//                Class.forName("com.mysql.jdbc.Driver");
//                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
//                Statement st = cn.createStatement();
//                ResultSet rs = st.executeQuery("select * from product");
                
                

            %>
            <div class="container-fluid">
                <div class="row">
                    <h1 class="title">All Products</h1>
                    <h3 class="title">Welcome <%= mysession.getAttribute("name")%></h3>
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <table class="table table-hover table-stripped">
                            <thead>
                                <tr>
                                    <td class="head">ID</td>
                                    <td class="head">Ord Qty</td>
                                    <td class="head">Amt</td>
                                    <td class="head" colspan="2">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                int totalAmt = 0;
                                for(CartItem c : mycart.getAllItems()){
                                    totalAmt = totalAmt + c.getAmt();

                            %>
                                <tr>
                                    <td><%= c.getItemid() %></td>
                                    <td><%= c.getItemqty() %></td>
                                    <td><%= c.getAmt() %></td>
                                    <td>
                                        <form action="Action.jsp" method="POST">
                                            <input type="hidden" name="txtId" value="<%= c.getItemid() %>"/>
                                            <button type="submit" name="btnSubmit" value="Remove" class="btn btn-danger">Remove</button>
                                        </form> 

                                    </td>
                                </tr>
                            <% 
                                } 
                            %>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1">
                        <form action="Action.jsp" method="POST">
                            <button type="submit" name="btnSubmit" value="Clear" class="btn btn-danger">Clear</button>
                        </form> 
                        <br/><br/>
                        <form action="Action.jsp" method="POST">
                            <input type="hidden" name="txtUid" value="<%= session.getAttribute("uid") %>"/>
                            <input type="hidden" name="txtTotalAmt" value="<%= totalAmt %>"/>
                            <button type="submit" name="btnSubmit" value="Order" class="btn btn-success">Order</button>
                        </form>
                        <br/><br/>
                        <a href="Home.jsp"><button class="btn btn-primary">Products</button></a><br/><br/>
                        <a href="Cart.jsp"><button class="btn btn-primary">Cart</button></a><br/><br/>
                        <a href="AllOrder.jsp"><button class="btn btn-primary">My Orders</button></a><br/><br/>
                        <a href="Logout.jsp"><button class="btn btn-danger">Logout</button></a>
                    </div>
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
