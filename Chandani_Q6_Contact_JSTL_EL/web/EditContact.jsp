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
        <link rel="stylesheet" href="./css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            
        <div class="container-fluid">
        
            <div class="row center">
                <h1 class="title">Edit Contact</h1>
                
                <a href="AllContact.jsp"><button class="btn btn-primary">View All Contacts</button></a>
                
                <div class="col-md-3"></div>
                <div class="col-md-6 ">
                    <form action="ContactAction.jsp" method="post" class="formRow">
                        <input type="hidden" name="txtId" value="${id}"/>
                        <div>
                        <label for="name" class="form-label">Name : </label>
                        <input type="text" name="txtName" value="${name}" id="name" class="form-control" placeholder="Name"/>
                        </div>
                        <div>
                        <label for="email" class="form-label">Email : </label>
                        <input type="email" name="txtEmail" value="${email}" id="email" class="form-control" placeholder="Email"/>
                        </div>
                        <div>
                        <label for="mobile" class="form-label">Mobile : </label>
                        <input type="text" name="txtMobile" value="${mobile}" id="mobile" class="form-control" placeholder="Mobile"/>
                        </div>
                        <div style="text-align:center;margin:10px">

                        <input type="submit" name="btnSubmit" id="insert" value="Update" class="btn btn-success btn-small" style="margin:0"/>
                        
                    </form>  
                </div>
                <div class="col-md-3 "></div>
            </div>
        </div>
    </body>
</html>
