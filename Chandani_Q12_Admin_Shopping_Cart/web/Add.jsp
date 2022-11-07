<%-- 
    Document   : Add
    Created on : 1 Nov, 2022, 12:05:03 PM
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
        %>
        <div class="container-fluid">
        
            <div class="row">
                <h1 class="title">Add Product</h1>
                
                <a href="Home.jsp"><button class="btn btn-primary">View All Products</button></a>
                <br/><br/>
                <a href="Logout.jsp"><button class="btn btn-danger">Logout</button></a>
                
                <div class="col-md-3"></div>
                <div class="col-md-6 ">
                    <form action="Action.jsp" method="post" class="formRow">
                        <div>
                        <label for="cat" class="form-label">Category : </label>
                        <select name="ddCid" class="form-control" id="cat">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                                Statement st = cn.createStatement();
                                ResultSet rs = st.executeQuery("select * from category");

                                while(rs.next()){
                                %>
                                    <option value="<%= rs.getString("cid")%>" class="form-control"><%= rs.getString("name")%></option>
                                <%        
                                }
                            %>
                        </select>
                        </div>
                        <div>
                        <label for="title" class="form-label">Title : </label>
                        <input type="text" name="txtTitle" id="title" class="form-control" placeholder="Title"/>
                        </div>
                        <div>
                        <label for="qty" class="form-label">Qty : </label>
                        <input type="text" name="txtQty" id="qty" class="form-control" placeholder="Qty"/>
                        </div>
                        <div>
                        <label for="price" class="form-label">Price : </label>
                        <input type="text" name="txtPrice" id="price" class="form-control" placeholder="Price"/>
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
