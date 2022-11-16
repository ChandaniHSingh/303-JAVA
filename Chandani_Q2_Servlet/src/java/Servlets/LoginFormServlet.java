/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Test
 */
public class LoginFormServlet extends HttpServlet {

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
            
String email = request.getParameter("txtEmail");
String password = request.getParameter("txtPassword");
boolean isLogin = false;

String db_url = getServletContext().getInitParameter("db-url");
String db_user = getServletContext().getInitParameter("db-user");
String db_password = "";
int uid = 0;

Class.forName("com.mysql.jdbc.Driver");
Connection cn = DriverManager.getConnection(db_url, db_user, db_password);
Statement st = cn.createStatement();
ResultSet rs = st.executeQuery("select * from q2_user where email = '"+email+"'");
while(rs.next()){
    if(rs.getString("password").equals(password)){
        HttpSession mySession = request.getSession();
        mySession.setAttribute("uid", rs.getInt("uid"));
        mySession.setAttribute("name", rs.getString("name"));
        mySession.setAttribute("email", rs.getString("email"));
        uid = rs.getInt("uid");
        isLogin = true;
    }
    else{
        isLogin = false;
    }
}

if(isLogin){
    st.execute("update q2_user set last_login_at = now() where uid = "+uid);
    response.sendRedirect("WelcomeServlet");
}
else{
    response.sendRedirect("login.html?notValid=true");
}

out.println("<!DOCTYPE html>");
out.println("<html>");
out.println("<head>");
out.println("<title>Servlet LoginFormServlet</title>");            
out.println("</head>");
out.println("<body>");
out.println("<h1>Servlet LoginFormServlet at " + request.getContextPath() + "</h1>");
out.println("</body>");
out.println("</html>");
        }
        catch(ClassNotFoundException ex){
            System.out.println(ex);
        }
        catch(SQLException ex){
            System.out.println(ex);;
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
