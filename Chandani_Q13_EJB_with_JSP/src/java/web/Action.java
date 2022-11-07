/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import Beans.CartItem;
import ejb.ShoppingCartSessionBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sumit
 */
public class Action extends HttpServlet {
    @EJB
    ShoppingCartSessionBeanLocal mycart;
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String submit = request.getParameter("btnSubmit");

            HttpSession mysession  = request.getSession();

            if(submit.equals("AddToCart")){
                
                
                String itemIds[] = request.getParameterValues("txtPid");
                String itemPrices[] = request.getParameterValues("txtPrice");
                String itemQtys[] = request.getParameterValues("txtQty");

                for(int i=0;i<itemIds.length;i++){
                    Beans.CartItem c = new Beans.CartItem();
                    c.setItemid(Integer.parseInt(itemIds[i]));
                    c.setAmt(Integer.parseInt(itemPrices[i]) * Integer.parseInt(itemQtys[i]));
                    c.setItemqty(Integer.parseInt(itemQtys[i]));
                    mycart.addItem(c);
                }
                
                
                mysession.setAttribute("mycart",mycart.getAllItems());

//                response.sendRedirect("Home");

            }



            if(submit.equals("Clear")){
                mycart.clearCart();
                mysession.removeAttribute("mycart");
//                response.sendRedirect("Cart");
            }

            if(submit.equals("Remove")){
                int itemId = Integer.parseInt(request.getParameter("txtId"));
                for(Beans.CartItem c : mycart.getAllItems()){
                    if(c.getItemid() == itemId){
                        mycart.removeItem(c);
                        break;
                    }
                }
                 mysession.setAttribute("mycart",mycart.getAllItems());
//                response.sendRedirect("Cart");
            }
            
            
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Action</title>");     
            out.println("\n" +
"        <link rel=\"stylesheet\" href=\"./css/style.css\"/>\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />");
            out.println("</head>");
            out.println("<body>");
            out.println(" <a href=\"Home\"><button class=\"btn btn-primary\">Products</button></a><br/><br/>\n" +
"                <a href=\"Cart\"><button class=\"btn btn-primary\">Cart</button></a><br/><br/>\n");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private ShoppingCartSessionBeanLocal lookupShoppingCartSessionBeanLocal() {
        try {
            Context c = new InitialContext();
            return (ShoppingCartSessionBeanLocal) c.lookup("java:global/Chandani_Q13_EJB_with_JSP/ShoppingCartSessionBean!ejb.ShoppingCartSessionBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }


}
