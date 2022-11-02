<%-- 
    Document   : AddToCart
    Created on : 26 Oct, 2022, 8:43:01 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mycart" class="Beans.ShoppingCart" scope="session"/>
<%
    String submit = request.getParameter("btnSubmit");
    
    if(submit.equals("AddToCart")){
        String itemIds[] = request.getParameterValues("txtId");
        String itemNames[] = request.getParameterValues("txtName");
        String itemQtys[] = request.getParameterValues("txtQty");

        for(int i=0;i<itemIds.length;i++){
            Beans.CratItem c = new Beans.CratItem();
            c.setItemid(Integer.parseInt(itemIds[i]));
            c.setItemname(itemNames[i]);
            c.setItemqty(Integer.parseInt(itemQtys[i]));
            mycart.addItem(c);
        }
        response.sendRedirect("product.jsp");
    }
    
    if(submit.equals("Clear")){
        mycart.clearCart();
        response.sendRedirect("viewcart.jsp");
    }
    
    if(submit.equals("Remove")){
        int itemId = Integer.parseInt(request.getParameter("txtId"));
        for(Beans.CratItem c : mycart.getAllItems()){
            if(c.getItemid() == itemId){
                mycart.removeItem(c);
                break;
            }
        }
        response.sendRedirect("viewcart.jsp");
    }
%>
