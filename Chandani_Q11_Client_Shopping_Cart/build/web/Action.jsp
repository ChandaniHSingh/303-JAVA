<%-- 
    Document   : ContactAction
    Created on : 26 Oct, 2022, 9:34:39 PM
    Author     : Sumit
--%>

<%@page import="java.sql.*"%>
<%@page import="Beans.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mycart" class="Beans.ShoppingCart" scope="session"/>

<%
   
        String submit = request.getParameter("btnSubmit");

        if(submit.equals("Login")){
            Boolean isLogin = false;
            String email = request.getParameter("txtEmail");
            String pwd = request.getParameter("txtPwd");

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from user");
            while(rs.next()){
                if(email.equals(rs.getString("email")) && pwd.equals(rs.getString("password"))){
                    HttpSession mysession = request.getSession();
                    mysession.setAttribute("email", email);
                    mysession.setAttribute("uid", rs.getString("uid"));
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

        if(submit.equals("AddToCart")){
            int qty = Integer.parseInt(request.getParameter("txtQty"));
            int price = Integer.parseInt(request.getParameter("txtPrice"));
            int pid = Integer.parseInt(request.getParameter("txtPid"));
            int amt = price * qty;

            
            
            Beans.CartItem c = new Beans.CartItem();
            c.setItemid(pid);
            c.setItemqty(qty);
            c.setAmt(amt);
            mycart.addItem(c);
            
            
            
            response.sendRedirect("Home.jsp");
        }
        
        
    
        if(submit.equals("Clear")){
            mycart.clearCart();
            response.sendRedirect("Cart.jsp");
        }

        if(submit.equals("Remove")){
            int itemId = Integer.parseInt(request.getParameter("txtId"));
            for(Beans.CartItem c : mycart.getAllItems()){
                if(c.getItemid() == itemId){
                    mycart.removeItem(c);
                    break;
                }
            }
            response.sendRedirect("Cart.jsp");
        }
        
        if(submit.equals("Order")){
            int uid = Integer.parseInt(request.getParameter("txtUid"));
            for(CartItem c : mycart.getAllItems()){
                int pid = c.getItemid();
                int qty = c.getItemqty();
                int amt = c.getAmt();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement st = cn.createStatement();
                int ans = st.executeUpdate("insert into orders(uid,pid,qty,amt) values("+uid+","+pid+",'"+qty+"','"+amt+"')");
                
                if(ans >= 1){
                    System.out.print("<script>alert('Inserted Sucessfully');</script>");
                }
                else{
                    System.out.print("<script>alert('Error in Insertion');</script>");
                }
            }
            mycart.clearCart();
            
            response.sendRedirect("ThankYou.jsp");
        }

    //    if(submit.equals("Delete")){
    //        
    //        int id = Integer.parseInt(request.getParameter("txtId"));
    //        Class.forName("com.mysql.jdbc.Driver");
    //        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
    //        Statement st = cn.createStatement();
    //        int ans = st.executeUpdate("delete from product where pid = "+id);
    //        if(ans >= 1){
    //            System.out.print("<script>alert('Deleted Sucessfully');</script>");
    //        }
    //        else{
    //            System.out.print("<script>alert('Error in Deletion');</script>");
    //        }
    //        response.sendRedirect("Home.jsp");
    //    }

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