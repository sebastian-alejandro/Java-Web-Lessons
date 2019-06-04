/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.ejb.CategoriaFacadeLocal;
import cl.ejb.ProductoFacadeLocal;
import cl.model.Categoria;
import cl.model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sistemas
 */
public class controlServlet extends HttpServlet {

    @EJB
    private CategoriaFacadeLocal categoriaFacade;

    @EJB
    private ProductoFacadeLocal producto;

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
        int idproducto = Integer.parseInt(request.getParameter("txtidproducto"));
        int stock = Integer.parseInt(request.getParameter("txtstock"));
        String nomproducto = request.getParameter("txtnomproducto");
        int precio = Integer.parseInt(request.getParameter("txtprecio"));
        int idcategoria = Integer.parseInt(request.getParameter("txtidcategoria"));
        String btn = request.getParameter("btn");
        Categoria categoria= categoriaFacade.find(idcategoria);
       
       
        Producto p = new Producto();
        p.setNomproducto(nomproducto);
        p.setIdproducto(idproducto);
        p.setIdcategoria(categoria);
        p.setPrecio(precio);
        p.setStock(stock);
        
        switch (btn) {
            case "agregarProducto":
                producto.create(p);
                break;
            case "editarProducto":
                producto.edit(p);
                break;
        }
        
        response.sendRedirect("index.jsp");
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
