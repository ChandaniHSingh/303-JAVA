/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Test
 */

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15,
//        location = "E:/113-Chandani/303-JAVA/Assignment/Uploads/"
        location = "E:\\113-Chandani\\303-JAVA\\Assignment\\Chandani_Q2_Servlet\\build\\web\\uploads"
)

public class UploadImageServlet extends HttpServlet {

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
            
            String photo = "";
            HttpSession mySession = request.getSession();
            int uid = Integer.parseInt(mySession.getAttribute("uid").toString());
            
            for(Part part : request.getParts()){
                if(part.getSize() > 100){
                    part.write(part.getSubmittedFileName());
//                    part.write(part.getName()+".jpg");
                    out.println(part.getSubmittedFileName());
                    photo = part.getSubmittedFileName();
                    
                }
            }
            
            //String photo = request.getParameter("txtPhoto");
            
            String db_url = getServletContext().getInitParameter("db-url");
            String db_user = getServletContext().getInitParameter("db-user");
            String db_password = "";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection(db_url, db_user, db_password);
            Statement st = cn.createStatement();
            out.println("Hii");
            st.executeUpdate("update q2_user set photo = '"+photo+"' where uid = "+uid);
            out.println("Hii");
            
            response.sendRedirect("ThankYouImageServlet");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadImageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadImageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(ClassNotFoundException ex){
            System.out.println(ex);
        }
        catch(SQLException ex){
            System.out.println(ex);
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
