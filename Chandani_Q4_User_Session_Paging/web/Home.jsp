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
    </head>
    <body>
        <h1>All Users</h1>
        <a href="Add.jsp">Add New Users</a><br>
        <a href="Logout.jsp">Logout</a>
        
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
            <h3>Welcome <%= mysession.getAttribute("name")%></h3>
            <table border="2">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>EMail</td>
                    <td>Password</td>
                    <td>Action</td>
                </tr>
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
                            <input type="submit" value="Edit" name="btnEdit"/>
                        </form> 
                    </td>
                    <td>
                        <form action="Action.jsp" method="POST">
                            <input type="hidden" value="<%= rs.getInt("uid")%>" name="txtId"/>
                            <input type="submit" value="Delete" name="btnSubmit"/>
                        </form> 
                    </td>
                </tr>

                <%


                }
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
            %>
        </table>
    </body>
</html>
