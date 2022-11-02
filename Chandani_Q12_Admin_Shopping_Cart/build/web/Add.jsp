<%-- 
    Document   : Add
    Created on : 1 Nov, 2022, 12:05:03 PM
    Author     : Sumit
--%>

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
            Boolean isLogin = false;
            HttpSession mysession = request.getSession();
            if(mysession.getAttribute("isLogin") == "true"){
                isLogin = true;
            }
            if(isLogin == true){
        %>
        <h1>Add Products</h1>
        <a href="Home.jsp">View ALL Products</a><br>
        <a href="Logout.jsp">Logout</a>
        
        <form action="Action.jsp" mehtod="POST">
            Category : <select name="ddCid">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from category");

                while(rs.next()){
                %>
                    <option value="<%= rs.getString("cid")%>"><%= rs.getString("name")%></option>
                <%        
                }
            %>
            </select><br><br>
            Title : <input type="text" name="txtTitle" /><br><br>
            Qty : <input type="text" name="txtQty" /><br><br>
            Price : <input type="text" name="txtPrice" /><br><br>
            <input type="submit" name="btnSubmit" value="Add" />
        </form>
        <%
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
