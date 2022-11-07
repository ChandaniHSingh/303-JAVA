/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import ejb.InterestCalcSessionBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sumit
 */
public class InterestCalcTest extends HttpServlet {
    @EJB
    private InterestCalcSessionBeanLocal interestCalcSessionBean;

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
            out.println("<title>Servlet InterestCalcTest</title>");     
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
"        <center><h1 class='title text-primary'>Interest Calc </h1></center>\n");
            out.println("<div class=\"col-md-1\"></div>\n" +
"                <div class=\"col-md-10\">");
            out.println("<center><br/><h3>Principle Amt : 1000</h3>");
            out.println("<h3>Rate Of Interest : 8.5</h3>");
            out.println("<h3>No. Of Year : 2</h3><hr/>");
            out.println("<h2>Simple Interest : "+interestCalcSessionBean.SimpleInterest(1000, Float.parseFloat("8.5"), 2)+"</h2>");
            out.println("<h2>Compound Interest : "+interestCalcSessionBean.CompoundInterest(1000, Float.parseFloat("8.5"), 2)+"</h2>");
            out.println("</center></div>\n" +
"                <div class=\"col-md-1\"></div>");
            out.println("</div></div>");
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

}
