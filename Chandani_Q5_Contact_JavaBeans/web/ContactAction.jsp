<%-- 
    Document   : ContactAction
    Created on : 26 Oct, 2022, 9:34:39 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="allcontact" class="Beans.MyAllContact" scope="session"/>
<%@page import="Beans.*" %>

<%

    
    String submit = request.getParameter("btnSubmit");
    
    if(submit.equals("Add")){
        String name = request.getParameter("txtName");
        String mobile = request.getParameter("txtMobile");
        String email = request.getParameter("txtEmail");
        
        
        ContactDetail c = new ContactDetail();
        c.setName(name);
        c.setEmail(email);
        c.setMobile(mobile);
        
        allcontact.addContact(c);
        
        response.sendRedirect("AllContact.jsp");
    }
    
    if(submit.equals("Clear")){
        
        allcontact.clearContact();
        
        response.sendRedirect("AllContact.jsp");
    }
    
    if(submit.equals("Delete")){
        
        int id = Integer.parseInt(request.getParameter("txtId"));
        
        for(ContactDetail c : allcontact.getAllContacts()){
            if(c.getId() == id){
                allcontact.removeContact(c);
                break;
            }
        }
        
        response.sendRedirect("AllContact.jsp");
    }

    if(submit.equals("Update")){
        int id = Integer.parseInt(request.getParameter("txtId"));
        String name = request.getParameter("txtName");
        String mobile = request.getParameter("txtMobile");
        String email = request.getParameter("txtEmail");
        
        
        ContactDetail c = new ContactDetail();
        c.setId(id);
        c.setName(name);
        c.setEmail(email);
        c.setMobile(mobile);
        
        allcontact.updateContact(c);
        
        response.sendRedirect("AllContact.jsp");
    }
%>