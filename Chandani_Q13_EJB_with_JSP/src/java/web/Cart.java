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
import java.util.ArrayList;
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
public class Cart extends HttpServlet {
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cart</title>");      
            out.println("\n" +
"        <link rel=\"stylesheet\" href=\"./css/style.css\"/>\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"container-fluid\">\n" +
"            <div class=\"row\">");
            out.println("\n" +
"        <center><h1 class='title text-primary'>Session Beans Examples </h1></center>\n" +
"        <a href=\"InterestCalcTest\"><button class=\"btn btn-primary\">Interest Calc Test (Stateless)</button></a>\n" +
"        <br/><br/>\n" +
"        <a href=\"Home\"><button class=\"btn btn-primary\">Shopping Cart (Stateful)</button></a>");
            out.println("\n" +
"        <center><h1 class='title text-primary'>All Products</h1></center>\n");
            out.println("<div class=\"col-md-1\"></div>\n" +
"                <div class=\"col-md-10\">");
            Boolean isLogin = true;
//            HttpSession mysession = request.getSession();
//            if(mysession.getAttribute("isLogin") == "true"){
//                isLogin = true;
//            }
            if(isLogin == true){
                out.println("<table class=\"table table-hover table-stripped\">\n" +
    "                \n" +
    "           <thead>"+
    "               <tr>\n" +
    "                    <th class=\"head\">ID</th>\n" +
    "                    <th class=\"head\">Ord Qty</th>\n" +
    "                    <th class=\"head\">Amt</th>\n" +
    "                    <th class=\"head\">Action</th>\n" +
    "                </tr>"+
    "           </thead>"+
    "           <tbody>");
                
                int totalAmt = 0;
                
                HttpSession mysession  = request.getSession();
               
                for(CartItem c : (ArrayList<CartItem>)mysession.getAttribute("mycart")){
                    totalAmt = totalAmt + c.getAmt();
                    out.println("<tr>");
                    out.println("<td>"+c.getItemid()+"</td>");
                    out.println("<td>"+c.getItemqty()+"</td>");
                    out.println("<td>"+c.getAmt()+"</td>");
                    out.println("<td>\n" +
"                        <form action=\"Action\" method=\"POST\">\n" +
"                            <input type=\"hidden\" name=\"txtId\" value=\""+c.getItemid()+"\"/>\n" +
"                            <button type=\"submit\" name=\"btnSubmit\" value=\"Remove\" class='btn btn-danger'/>Remove</button>\n" +
"                        </form> \n" +
"\n" +
"                    </td>");
                    out.println("</tr>");
                }
                out.println("</tbody></table>");
                
                out.println("</form>");
            out.println("</div>\n" +
"                <div class=\"col-md-1\">\n" + 
                    "</table>\n" +
"                <form action=\"Action\" method=\"POST\">\n" +
"                    <button type=\"submit\" name=\"btnSubmit\" value=\"Clear\" class='btn btn-danger'>Clear</button>\n" +
"                </form> " +
"                </div>");
            out.println("</div></div>");
               
            }
            else{
                System.out.print("<script>alert('Please Login First...');</script>");
                response.sendRedirect("Login.jsp");
            }
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
