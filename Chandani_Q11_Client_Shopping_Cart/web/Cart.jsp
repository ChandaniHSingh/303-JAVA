<%-- 
    Document   : Cart
    Created on : 1 Nov, 2022, 3:26:43 PM
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
        <h1>My Cart</h1>
        <a href="Home.jsp">Products</a><br>
        <a href="Add.jsp">Add Products</a><br>
        <a href="Cart.jsp">Cart</a><br>
        <a href="AllOrder.jsp">My Orders</a><br>
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
                ResultSet rs = st.executeQuery("select * from product");

            %>
            <h3>Welcome <%= mysession.getAttribute("name")%></h3>
            <table border="2">
                <tr>
                    <td>PID</td>
                    <td>CID</td>
                    <td>Title</td>
                    <td>Qty</td>
                    <td>Price</td>
                    <td>Action</td>
                </tr>
                <%
                while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("pid")%></td>
                    <td><%= rs.getInt("cid")%></td>
                    <td><%= rs.getString("title")%></td>
                    <td><%= rs.getString("qty")%></td>
                    <td><%= rs.getString("price")%></td>
                    <td>
                        <a href="ViewProduct.jsp">View Detail</a>
                    </td>
                    <form action="Action.jsp" method="POST">
                        <input type="hidden" value="<%= rs.getInt("pid")%>" name="txtPid"/>
                        <input type="hidden" value="<%= rs.getInt("price")%>" name="txtPrice"/>
                        <input type="hidden" value="<%= mysession.getAttribute("uid")%>" name="txtUid"/>
                    <td>
                        <input type="number" value="1" name="txtQty"/>
                        <input type="submit" value="AddToCart" name="btnSubmit"/>
                    </td>
                    </form> 
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
