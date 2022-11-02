<%-- 
    Document   : ContactAction
    Created on : 26 Oct, 2022, 9:34:39 PM
    Author     : Sumit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    
    String submit = request.getParameter("btnSubmit");
    
    if(submit.equals("Login")){
        Boolean isLogin = false;
        String email = request.getParameter("txtEmail");
        String pwd = request.getParameter("txtPwd");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from user where user_type = 'Admin'");
        while(rs.next()){
            if(email.equals(rs.getString("email")) && pwd.equals(rs.getString("password"))){
                HttpSession mysession = request.getSession();
                mysession.setAttribute("email", email);
                mysession.setAttribute("name", rs.getString("username"));
                mysession.setAttribute("isLogin", "true");
                isLogin = true;
            }
        }
        if(isLogin == true){
            response.sendRedirect("Home.jsp");
        }
        else{
            response.sendRedirect("Login.jsp?inValidLogin='true'");
        }
    }
    
    if(submit.equals("Add")){
        String title = request.getParameter("txtTitle");
        String cid = request.getParameter("ddCid");
        String qty = request.getParameter("txtQty");
        String price = request.getParameter("txtPrice");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement st = cn.createStatement();
        int ans = st.executeUpdate("insert into product(cid,title,qty,price) values("+cid+",'"+title+"','"+qty+"','"+price+"')");
        if(ans >= 1){
            System.out.print("<script>alert('Inserted Sucessfully');</script>");
        }
        else{
            System.out.print("<script>alert('Error in Insertion');</script>");
        }
        response.sendRedirect("Home.jsp");
    }
    
    if(submit.equals("Delete")){
        
        int id = Integer.parseInt(request.getParameter("txtId"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement st = cn.createStatement();
        int ans = st.executeUpdate("delete from product where pid = "+id);
        if(ans >= 1){
            System.out.print("<script>alert('Deleted Sucessfully');</script>");
        }
        else{
            System.out.print("<script>alert('Error in Deletion');</script>");
        }
        response.sendRedirect("Home.jsp");
    }

//    if(submit.equals("Update")){
//        int id = Integer.parseInt(request.getParameter("txtId"));
//        String name = request.getParameter("txtName");
//        String email = request.getParameter("txtEmail");
//        String pwd = request.getParameter("txtPwd");
//        
//        Class.forName("com.mysql.jdbc.Driver");
//        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
//        Statement st = cn.createStatement();
//        int ans = st.executeUpdate("update user set username = '"+name+"' ,email = '"+email+"' ,password = '"+pwd+"' where uid = "+id);
//        if(ans >= 1){
//            System.out.print("<script>alert('Updated Sucessfully');</script>");
//        }
//        else{
//            System.out.print("<script>alert('Error in Updation');</script>");
//        }
//        
//        response.sendRedirect("Home.jsp");
//    }
%>