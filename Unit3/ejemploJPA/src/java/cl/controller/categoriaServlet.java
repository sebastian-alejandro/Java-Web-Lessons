/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.ejb.CategoriaFacadeLocal;
import cl.model.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "categoria", urlPatterns = {"/categoria.do"})
public class categoriaServlet extends HttpServlet {

    @EJB
    private CategoriaFacadeLocal categoriaFacade;
    
    

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
        
        int idcategoria = Integer.parseInt(request.getParameter("txtidcategoria"));
        String nombreCat = request.getParameter("txtnomcategoria");
        String descripcion = request.getParameter("txtdescripcion");
        String btn = request.getParameter("btn");
        
        Categoria categoria = new Categoria();
        categoria.setIdcategoria(idcategoria);
        categoria.setNomcategoria(nombreCat);
        categoria.setDescripcion(descripcion);
        
        switch (btn) {
            case "agregarCategoria":
                categoriaFacade.create(categoria);
                break;
            case "editarCategoria":
                categoriaFacade.edit(categoria);
                break;
        }
        
        response.sendRedirect("categorias.jsp");
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
