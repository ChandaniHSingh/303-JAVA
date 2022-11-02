<%-- 
    Document   : allContact
    Created on : 26 Oct, 2022, 9:16:36 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="allcontact" class="Beans.MyAllContact" scope="session"/>
<%@page import="Beans.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>All Contacts</h1>
        <a href="AddContact.jsp">Add Contact</a>
        <table border="2">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Mobile</td>
                <td>Email</td>
                <td>Action</td>
            </tr>
            <%
                for(ContactDetail c : allcontact.getAllContacts()){
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getMobile() %></td>
                <td><%= c.getEmail() %></td>
                <td>
                    <form action="EditContact.jsp" method="POST">
                        <input type="hidden" value="<%= c.getId() %>" name="txtId"/>
                        <input type="submit" value="Edit" name="btnEdit"/>
                    </form> 
                </td>
                <td>
                    <form action="ContactAction.jsp" method="POST">
                        <input type="hidden" value="<%= c.getId() %>" name="txtId"/>
                        <input type="submit" value="Delete" name="btnSubmit"/>
                    </form> 
                </td>
            </tr>
            <% } %>
        </table>
        <form action="ContactAction.jsp">
            <input type="submit" value="Clear" name="btnSubmit"/>
        </form> 
    </body>
</html>
