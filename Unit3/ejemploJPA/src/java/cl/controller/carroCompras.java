/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.ejb.ProductoFacadeLocal;
import cl.model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sistemas
 */
@WebServlet(name = "carroCompras", urlPatterns = {"/carroCompras"})
public class carroCompras extends HttpServlet {

    @EJB
    private ProductoFacadeLocal productoFacade;
    
    

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
        
        String btn = request.getParameter("btn");
        
        switch (btn){
            case "agregarCarro":
                agregarCarro(request,response);
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

    private void agregarCarro(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String codigo = request.getParameter("codigo");
        Producto p = productoFacade.find(Integer.parseInt(codigo));
        
        ArrayList<Producto> carrolist = (ArrayList) request.getSession().getAttribute("carro");
        if (carrolist==null) {
            carrolist = new ArrayList();
        }
        
        if (!carrolist.contains(p)){
            carrolist.add(p);
            request.getSession().setAttribute("carro", carrolist);
        }
        
        response.sendRedirect("misventas.jsp");
    }

}
