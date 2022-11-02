<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from item");
        %>
        
        <h1>All Items</h1>
        <a href="viewcart.jsp">View Cart</a>
        
        <form action="CartAction.jsp" method="POST">
            <table border="2">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Qty</td>
                    <td>Action</td>
                </tr>
                <% while(rs.next()){%>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getInt("price")%></td>
                    <td>
                        <input type="hidden" value="<%= rs.getString("name") %>" name="txtName"/>
                        <input type="number" min="1" max="<%= rs.getInt("qty") %>"  value="1" name="txtQty"/>
                    </td>
                    <td><input type="checkbox" value="<%= rs.getInt("id") %>" name="txtId"/></td>
                </tr>
                <% } %>
            </table>
            
            <input type="submit" value="AddToCart" name="btnSubmit"/>

        </form>
    </body>
</html>
