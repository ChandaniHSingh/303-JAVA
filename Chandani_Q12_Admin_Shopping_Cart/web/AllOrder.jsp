<%-- 
    Document   : AllOrder
    Created on : 1 Nov, 2022, 2:03:23 PM
    Author     : Sumit
--%>

<%@page import="java.sql.*" %>
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
                ResultSet rs = st.executeQuery("select * from orders");

            %>
            <div class="container-fluid">
            <div class="row">
                <h1 class="title">All Orders</h1>
                <h3 class="title">Welcome <%= mysession.getAttribute("name")%></h3>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <table class="table table-hover table-stripped">
                        <thead>
                            <tr>
                                <td class="head">OID</td>
                                <td class="head">UID</td>
                                <td class="head">PID</td>
                                <td class="head">Ord Qty</td>
                                <td class="head">Amt</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            while(rs.next()){
                            %>
                            <tr>
                                <td><%= rs.getInt("oid")%></td>
                                <%
                                    String user = "",title = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                                    Statement st2 = cn2.createStatement();
                                    ResultSet rs2 = st2.executeQuery("select * from user where uid = "+rs.getInt("uid"));
                                    while(rs2.next()){
                                        user = rs2.getString("email");
                                    }
                                %>
                                <td><%= user%></td>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                                    Statement st3 = cn3.createStatement();
                                    ResultSet rs3 = st3.executeQuery("select * from product where pid = "+rs.getInt("pid"));
                                    while(rs3.next()){
                                        title = rs3.getString("title");
                                    }
                                %>
                                <td><%= title %></td>
                                <td><%= rs.getString("qty")%></td>
                                <td><%= rs.getString("amt")%></td>
                            </tr>

                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1">
                <a href="Home.jsp"><button class="btn btn-primary">All Products</button></a><br/><br/>
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
