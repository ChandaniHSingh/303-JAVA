/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sumit
 */
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");     
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
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from product");
                
                out.println("<form action='Action' method='POST'>");
                out.println("<table class=\"table table-hover table-stripped\">\n" +
    "                \n" +
    "           <thead>"+
    "               <tr>\n" +
    "                    <th class=\"head\">PID</th>\n" +
    "                    <th class=\"head\">CID</th>\n" +
    "                    <th class=\"head\">Title</th>\n" +
    "                    <th class=\"head\">Qty</th>\n" +
    "                    <th class=\"head\">Price</th>\n" +
    "                    <th class=\"head\" colspan='2'>Action</th>\n" +
    "                </tr>"+
    "           </thead>"+
    "           <tbody>");
                while(rs.next()){
                    out.println("<tr>");
                    out.println("<td>"+rs.getInt("pid")+"</td>");
                    out.println("<td>"+rs.getInt("cid")+"</td>");
                    out.println("<td>"+rs.getString("title")+"</td>");
                    out.println("<td>"+rs.getString("qty")+"</td>");
                    out.println("<td>"+rs.getString("price")+"</td>");
                    out.println("<input type='hidden' value='"+rs.getString("price")+"' name='txtPrice' />");
                    out.println("<td>\n" +
"                        <input type=\"number\" value=\"1\" name=\"txtQty\" class='form-control' style='width:80px'/>\n" +
"                    </td>");
                    out.println(" <td><input type=\"checkbox\" value=\""+ rs.getInt("pid") +"\" name=\"txtPid\" class='form-check-input'/></td>");
                    out.println("</tr>");
                }
                out.println("</tbody></table>");
                out.println("<button type='submit' name='btnSubmit' value='AddToCart' class='btn btn-success'>AddToCart</button>");
                out.println("</form>");
            }
            catch(ClassNotFoundException e){}
            catch(SQLException e){}
            out.println("</div>\n" +
"                <div class=\"col-md-1\">\n" +
"                <a href=\"Home\"><button class=\"btn btn-primary\">Products</button></a><br/><br/>\n" +
"                <a href=\"Cart\"><button class=\"btn btn-primary\">Cart</button></a><br/><br/>\n" +
"                </div>");
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
