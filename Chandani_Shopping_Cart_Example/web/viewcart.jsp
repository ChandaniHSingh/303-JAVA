<%-- 
    Document   : viewcart
    Created on : 26 Oct, 2022, 8:54:04 PM
    Author     : Sumit
--%>

<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mycart" class="Beans.ShoppingCart" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>View Cart</h1>
        <a href="product.jsp">View Product</a>
        <table border="2">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Ord Qty</td>
                <td>Action</td>
            </tr>
            <%
                for(CratItem c : mycart.getAllItems()){
            
            %>
            <tr>
                <td><%= c.getItemid() %></td>
                <td><%= c.getItemname() %></td>
                <td><%= c.getItemqty() %></td>
                <td>
                    <form action="CartAction.jsp" method="POST">
                        <input type="hidden" name="txtId" value="<%= c.getItemid() %>"/>
                        <input type="submit" name="btnSubmit" value="Remove"/>
                    </form> 
                    
                </td>
            </tr>
            <% } %>
        </table>
        <form action="CartAction.jsp" method="POST">
            <input type="submit" name="btnSubmit" value="Clear"/>
        </form> 
    </body>
</html>
