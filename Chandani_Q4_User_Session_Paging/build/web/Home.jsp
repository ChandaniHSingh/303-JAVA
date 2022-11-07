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
                ResultSet rs = st.executeQuery("select * from user");

        %>
                
        <div class="container-fluid">
            <div class="row">
                <h1 class="title">All Users</h1>
                <h3 class="title">Welcome <%= mysession.getAttribute("name")%></h3>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <table class="table table-hover table-stripped">
                        <thead>
                            <tr>
                                <td class="head">ID</td>
                                <td class="head">Name</td>
                                <td class="head">Email</td>
                                <td class="head">Password</td>
                                <td class="head" colspan="2">Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            while(rs.next()){
                            %>
                            <tr>
                                <td><%= rs.getInt("uid")%></td>
                                <td><%= rs.getString("username")%></td>
                                <td><%= rs.getString("email")%></td>
                                <td><%= rs.getString("password")%></td>
                                <td>
                                    <form action="Edit.jsp" method="POST">
                                        <input type="hidden" value="<%= rs.getInt("uid")%>" name="txtId"/>
                                        <button type="submit" value="Edit" name="btnEdit" class="btn btn-warning">Edit</button>
                                    </form> 
                                </td>
                                <td>
                                    <form action="Action.jsp" method="POST">
                                        <input type="hidden" value="<%= rs.getInt("uid")%>" name="txtId"/>
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
                <a href="Add.jsp"><button class="btn btn-primary">Add New User</button></a>
                <br/><br/>
                <a href="Logout.jsp"><button class="btn btn-danger">Logout</button></a>
                </div>
            </div>
            <%
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
            %>
        </div>
    </body>
</html>
