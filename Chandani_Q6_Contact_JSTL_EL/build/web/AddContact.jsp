<%-- 
    Document   : AddContact
    Created on : 26 Oct, 2022, 9:31:28 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add Contact</h1>
        <a href="AllContact.jsp">View ALL Contacts</a>
        
        <form action="ContactAction.jsp" mehtod="POST">
            Name : <input type="text" name="txtName" /><br><br>
            Mobile : <input type="text" name="txtMobile" /><br><br>
            Email : <input type="email" name="txtEmail" /><br><br>
            <input type="submit" name="btnSubmit" value="Add" />
        </form>
    </body>
</html>
