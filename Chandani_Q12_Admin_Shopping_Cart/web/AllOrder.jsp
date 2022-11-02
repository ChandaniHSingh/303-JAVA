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
    </head>
    <body>
        <h1>All Orders</h1>
        <a href="Home.jsp">Products</a><br>
        <a href="AllOrder.jsp">Orders</a><br>
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
                ResultSet rs = st.executeQuery("select * from orders");

            %>
            <h3>Welcome <%= mysession.getAttribute("name")%></h3>
            <table border="2">
                <tr>
                    <td>OID</td>
                    <td>UID</td>
                    <td>PID</td>
                    <td>Ord Qty</td>
                    <td>Amt</td>
                </tr>
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
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
            %>
        </table>
    </body>
</html>
