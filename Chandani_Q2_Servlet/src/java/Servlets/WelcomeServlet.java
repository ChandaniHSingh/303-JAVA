/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Test
 */
public class WelcomeServlet extends HttpServlet {

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
            
            HttpSession mySession = request.getSession();
            String name = mySession.getAttribute("name").toString();
            
            
             String cssHtml = "<link rel=\"stylesheet\" href=\"./css/style.css\">\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" >";
             
             String formHtml = "<div class=\"container-fluid\">\n" +
"    <div class=\"row\">\n" +
"        <h1 class=\"title\">Upload Image Form</h1>\n" +
"        <div class=\"col-md-3\"></div>\n" +
"        <div class=\"col-md-6 \">\n" +
"            <form action=\"UploadImageServlet\" method=\"POST\" class=\"formRow\" enctype=\"multipart/form-data\">\n" +
"                <div>\n" +
"                <label for=\"photo\" class=\"form-label\">Photo : </label>\n" +
"                <input type=\"file\" name=\"filePhoto\" id=\"photo\" class=\"form-control\"/>\n" +
"                </div>\n" +
"                <div style=\"text-align:center\">\n" +
"\n" +
"                <input type=\"submit\" name=\"btnUpdate\" id=\"update\" value=\"Update\" class=\"btn btn-success btn-small\"/>\n" +
"                </div>\n" +
"            </form>\n" +
"        </div>\n" +
"        <div class=\"col-md-2\"></div>\n" +
"    </div>\n" +
"</div>";
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WelcomeServlet</title>");  
            out.println(cssHtml);                            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 class=\"title\">Welcome "+name+"</h1>");
//            out.println("<img src=\"#\" width=\"200px\" height=\"200px\"/>");
            out.println("<a class=\"title\" href=\"LogoutServlet\">Logout</a>");
            
            out.println("<br/>");
            out.println(formHtml);
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
