<%-- 
    Document   : EditContact
    Created on : 28 Oct, 2022, 11:07:20 AM
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
        
        <%
            Beans.ContactDetail c = new Beans.ContactDetail();
            c = allcontact.getOneContact(Integer.parseInt(request.getParameter("txtId")));
        
        %>
        
        <h1>Edit Contact</h1>
        <a href="AllContact.jsp">View ALL Contacts</a>
        
        <form action="ContactAction.jsp" mehtod="POST">
            <input type="hidden" name="txtId" value="<%= c.getId() %>"/><br><br>
            Name : <input type="text" name="txtName" value="<%= c.getName() %>"/><br><br>
            Mobile : <input type="text" name="txtMobile"  value="<%= c.getMobile() %>"/><br><br>
            Email : <input type="email" name="txtEmail"  value="<%= c.getEmail() %>"/><br><br>
            <input type="submit" name="btnSubmit" value="Update" />
        </form>
    </body>
</html>
