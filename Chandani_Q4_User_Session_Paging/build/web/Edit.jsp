<%-- 
    Document   : Edit
    Created on : 1 Nov, 2022, 12:05:10 PM
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
        <h1>Edit User</h1>
        <a href="Home.jsp">View ALL Users</a><br>
        <a href="Logout.jsp">Logout</a>
        
        <%
            
            Boolean isLogin = false;
            HttpSession mysession = request.getSession();
            if(mysession.getAttribute("isLogin") == "true"){
                isLogin = true;
            }
            if(isLogin == true){
        
                int id = Integer.parseInt(request.getParameter("txtId"));
                String name="",email="",pwd="";
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs  = st.executeQuery("select * from user where uid = "+id);
                while(rs.next()){
                    name = rs.getString("username");
                    email = rs.getString("email");
                    pwd = rs.getString("password");
                }
        
        %>
        
        <form action="Action.jsp" mehtod="POST">
            <input type="hidden" name="txtId" value="<%= id%>"/><br><br>
            Name : <input type="text" name="txtName" value="<%= name%>"/><br><br>
            Email : <input type="email" name="txtEmail" value="<%= email%>"/><br><br>
            Password : <input type="password" name="txtPwd" value="<%= pwd%>"/><br><br>
            <input type="submit" name="btnSubmit" value="Update" />
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
