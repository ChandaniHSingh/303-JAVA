<%-- 
    Document   : EditContact
    Created on : 28 Oct, 2022, 11:07:20 AM
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
        
        <c:set var="id" scope="page" value="${param.txtId}"/>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
        <sql:query dataSource="${ds}" var="result"> 
            select * from contact where id = ${id};
        </sql:query>
            
        <c:forEach var="row" items="${result.rows}"> 
            <c:set var="name" scope="page" value="${row.name}"/>
            <c:set var="email" scope="page" value="${row.email}"/>
            <c:set var="mobile" scope="page" value="${row.mobile}"/>
        </c:forEach>
        
        <h1>Edit Contact</h1>
        <a href="AllContact.jsp">View ALL Contacts</a>
        
        <form action="ContactAction.jsp" mehtod="POST">
            <input type="hidden" name="txtId" value="${id}"/><br><br>
            Name : <input type="text" name="txtName" value="${name}"/><br><br>
            Mobile : <input type="text" name="txtMobile"  value="${mobile}"/><br><br>
            Email : <input type="email" name="txtEmail"  value="${email}"/><br><br>
            <input type="submit" name="btnSubmit" value="Update" />
        </form>
    </body>
</html>
