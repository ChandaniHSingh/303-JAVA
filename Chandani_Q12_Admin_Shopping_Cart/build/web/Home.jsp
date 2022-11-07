<%-- 
    Document   : Home
    Created on : 1 Nov, 2022, 11:52:51 AM
    Author     : Sumit
--%>

<%@page import="java.sql.*"%>
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
                
            
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from product");

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
                                <td class="head">PID</td>
                                <td class="head">CID</td>
                                <td class="head">Title</td>
                                <td class="head">Avail Qty</td>
                                <td class="head">Price</td>
                                <td class="head" colspan="2">Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            while(rs.next()){
                            %>
                            <tr>
                                <td><%= rs.getInt("pid")%></td>
                                <%
                                    String cat = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                                    Statement st2 = cn2.createStatement();
                                    ResultSet rs2 = st2.executeQuery("select * from category where cid = "+rs.getInt("cid"));
                                    while(rs2.next()){
                                        cat = rs2.getString("name");
                                    }
                                %>
                                <td><%= cat%></td>
                                <td><%= rs.getString("title")%></td>
                                <td><%= rs.getString("qty")%></td>
                                <td><%= rs.getString("price")%></td>
<!--                                <td>
                                    <form action="Action.jsp" method="POST">
                                        <input type="hidden" value="<%= rs.getInt("pid")%>" name="txtId"/>
                                        <button type="submit" value="Edit" name="btnSubmit" class="btn btn-warning">Edit</button>
                                    </form> 
                                </td>-->
                                <td>
                                    <form action="Action.jsp" method="POST">
                                        <input type="hidden" value="<%= rs.getInt("pid")%>" name="txtId"/>
                                        <button type="submit" value="Delete" name="btnSubmit" class="btn btn-danger">Delete</button>
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
                <a href="Home.jsp"><button class="btn btn-primary">Products</button></a><br/><br/>
                <a href="Add.jsp"><button class="btn btn-primary">Add Product</button></a><br/><br/>
                <a href="AllOrder.jsp"><button class="btn btn-primary">All Orders</button></a><br/><br/>
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
        </table>
    </body>
</html>
