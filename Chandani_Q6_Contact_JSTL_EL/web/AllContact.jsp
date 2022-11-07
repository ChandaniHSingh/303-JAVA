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
        <link rel="stylesheet" href="./css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <h1 class="title">All Contacts</h1>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <table class="table table-hover table-stripped">
                        <thead>
                            <tr>
                                <th class="head">ID</th>
                                <th class="head">Name</th>
                                <th class="head">Mobile</th>
                                <th class="head">Email</th>
                                <th class="head" colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
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
                                            <button type="submit" value="Edit" name="btnEdit" class="btn btn-warning">Edit</button>
                                        </form> 
                                    </td>
                                    <td>
                                        <form action="ContactAction.jsp" method="POST">
                                            <input type="hidden" value="${row.id}" name="txtId"/>
                                            <button type="submit" value="Delete" name="btnSubmit" class="btn btn-danger">Delete</button>
                                        </form> 
                                    </td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1">
                    <a href="AddContact.jsp"><button class="btn btn-primary">Add Contact</button></a>
                    <br/><br/>
                    <form action="ContactAction.jsp">
                        <button type="submit" value="Clear" name="btnSubmit" class="btn btn-danger">Clear</button>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
