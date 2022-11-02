<%-- 
    Document   : ContactAction
    Created on : 26 Oct, 2022, 9:34:39 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="submit" scope="page" value="${param.btnSubmit}"/>
    
<c:if test="${submit.equals('Add')}">
    <c:set var="name" scope="page" value="${param.txtName}"/>
    <c:set var="mobile" scope="page" value="${param.txtMobile}"/>
    <c:set var="email" scope="page" value="${param.txtEmail}"/>
    
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
    <sql:update dataSource="${ds}" var="count">
        insert into contact(name,email,mobile) values('${name}','${email}','${mobile}');
    </sql:update>
    <%
        response.sendRedirect("AllContact.jsp");
    %>
</c:if>
    
<c:if test="${submit.equals('Clear')}">
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
    <sql:update dataSource="${ds}" var="count">
        delete from contact;
    </sql:update>
    <%
        response.sendRedirect("AllContact.jsp");
    %>
</c:if>

<c:if test="${submit.equals('Delete')}">
    <c:set var="id" scope="page" value="${param.txtId}"/>
    
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
    <sql:update dataSource="${ds}" var="count">
        delete from contact where id = ${id};
    </sql:update>
    <%
        response.sendRedirect("AllContact.jsp");
    %>
</c:if>
        
<c:if test="${submit.equals('Update')}">
    <c:set var="id" scope="page" value="${param.txtId}"/>
    <c:set var="name" scope="page" value="${param.txtName}"/>
    <c:set var="mobile" scope="page" value="${param.txtMobile}"/>
    <c:set var="email" scope="page" value="${param.txtEmail}"/>
    
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chandani" user="root" password=""/>
    <sql:update dataSource="${ds}" var="count">
        update contact set name = '${name}', email = '${email}',mobile = '${mobile}' where id = ${id};
    </sql:update>
    <%
        response.sendRedirect("AllContact.jsp");
    %>
</c:if>

    