/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.*;

/**
 *
 * @author Test
 */

    
@MultipartConfig(
        
)
            
public class RegistrationFormServlet extends HttpServlet {

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
            
            String name = request.getParameter("txtName");
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String dob = request.getParameter("txtDOB");
            String phone = request.getParameter("txtPhone");
            String photo = request.getParameter("filePhoto");
            
            /*
            
            System.out.println(getServletContext().getRealPath("/uploads"));
            
            
            
//            Part filePart = request.getPart("filePhoto");
            String targetPath = getServletContext().getRealPath("/uploads");
            
            for(Part p : request.getParts()){
//                String fileName = extractFileName(p);
                p.write(targetPath + "/" + name +".jpg");
            }
//            java.nio.file.Files.copy(new File("d:\\files\\test.jpg").toPath(), new File(targetPath+"\\"+"test.jpg").toPath());
            
            
            */
            
            String html="<div class=\"container-fluid\">\n" +
"    <div class=\"row tableRow\">\n" +
"        <h1 class=\"title\">Registration-Form Details Result</h1>\n" +
"        <div class=\"col-md-2\"></div>\n" +
"        <div class=\"col-md-8\">\n" +
"            <table class=\"table table-hover table-primary table-bordered\">\n" +
"                <tbody>\n" +
"                    <tr>\n" +
"                        <td class=\"head\">Name</td>\n" +
"                        <td>"+name+"</td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td class=\"head\">Email</td>\n" +
"                        <td>"+email+"</td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td class=\"head\">Password</td>\n" +
"                        <td>"+password+"</td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td class=\"head\">Age</td>\n" +
"                        <td>"+dob+"</td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td class=\"head\">Phone</td>\n" +
"                        <td>"+phone+"</td>\n" +
"                    </tr>\n" +
"                </tbody>\n" +
"            </table>\n" +
"            <form action=\"ConfirmFormServlet\" method=\"get\">\n" +
"                <div style=\"text-align:center\">\n" +
"                    <input type=\"hidden\" name=\"txtName\" value="+name+" />\n" +
"                    <input type=\"hidden\" name=\"txtEmail\" value="+email+" />\n" +
"                    <input type=\"hidden\" name=\"txtPassword\" value="+password+" />\n" +
"                    <input type=\"hidden\" name=\"txtDOB\" value="+dob+" />\n" +
"                    <input type=\"hidden\" name=\"txtPhone\" value="+phone+" />\n" +
"                    \n" +
"                    <input type=\"submit\" name=\"btnConfirm\" id=\"confirm\" value=\"Confirm\" class=\"btn btn-success btn-small\"/>\n" +
"                </div>\n" +
"            </form>\n" +
"        </div>\n" +
"        <div class=\"col-md-2\"></div>\n" +
"    </div>\n" +
"</div>";
            
            String cssHtml = "<link rel=\"stylesheet\" href=\"./css/style.css\">\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" >";
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationFormServlet</title>");     
            out.println(cssHtml);        
            out.println("</head>");
            out.println("<body>");
            out.println(html);
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
