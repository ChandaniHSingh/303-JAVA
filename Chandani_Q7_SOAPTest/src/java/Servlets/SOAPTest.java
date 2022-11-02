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
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author Sumit
 */
public class SOAPTest extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/Chandani_Q7_SOAPService/TemperatureConversionService.wsdl")
    private TemperatureConversionService_Service service;

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
            
            TemperatureConversionService tcs = service.getTemperatureConversionServicePort();
            
            float c = 0;
            float f = 0;
            try{
                c = Float.parseFloat(request.getParameter("txtC"));
            }
            catch(Exception e){}
            try{
                f = Float.parseFloat(request.getParameter("txtF"));
            }
            catch(Exception e){}
            
            if(c != 0){
                f = tcs.degCtoDegF(c);
            }
            else{
                c = tcs.degFtoDegC(f);
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SOAPTest</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SOAPTest at " + request.getContextPath() + "</h1>");
            out.println("Celcius : "+c+"<br/><br/>");
            out.println("Feranhite : "+f+"<br/><br/>");
            out.println("<a href='Form'>Back</a>");
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

    private float degCtoDegF(float c) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        Servlets.TemperatureConversionService port = service.getTemperatureConversionServicePort();
        return port.degCtoDegF(c);
    }

    private float degFtoDegC(float f) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        Servlets.TemperatureConversionService port = service.getTemperatureConversionServicePort();
        return port.degFtoDegC(f);
    }

}
