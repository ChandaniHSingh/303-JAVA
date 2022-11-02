<%-- 
    Document   : allContact
    Created on : 26 Oct, 2022, 9:16:36 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            
            <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
            <sql:query dataSource="${ds}" var="result"> 
                select * from contact;
            </sql:query>
                
            <c:forEach var="row" items="${result.rows}"> 
                <tr> 
                    <td><c:out value="${row.id}"/></td> 
                    <td><c:out value="${row.name}"/></td> 
                    <td><c:out value="${row.mobile}"/></td> 
                    <td><c:out value="${row.email}"/></td> 
                    <td>
                        <form action="EditContact.jsp" method="POST">
                            <input type="hidden" value="${row.id}" name="txtId"/>
                            <input type="submit" value="Edit" name="btnEdit"/>
                        </form> 
                    </td>
                    <td>
                        <form action="ContactAction.jsp" method="POST">
                            <input type="hidden" value="${row.id}" name="txtId"/>
                            <input type="submit" value="Delete" name="btnSubmit"/>
                        </form> 
                    </td>
                </tr> 
            </c:forEach>
                            
        </table>
        <form action="ContactAction.jsp">
            <input type="submit" value="Clear" name="btnSubmit"/>
        </form> 
    </body>
</html>
