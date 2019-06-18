
package cl.controller;

import cl.ejb.UsuarioFacadeLocal;
import cl.model.Usuario;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sebastian
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/login.do"})
public class loginServlet extends HttpServlet {

    @EJB
    private UsuarioFacadeLocal usuarioFacade;
    
    
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
        switch (btn) {
            case "login":
                iniciarSesion(request, response);
            case "logout":
                cerrarSesion(request, response);
        }
    }
    
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rut = request.getParameter("txtrut");
        String clave = request.getParameter("txtclave");
        
        Usuario user = usuarioFacade.iniciarSesion(rut, clave);
        if (user != null) {
            if (user.getTipo().equals("admin")) {
                request.getSession().setAttribute("admin", user);
                response.sendRedirect("admin.jsp");
            } else if (user.getTipo().equals("cliente")) {
                request.getSession().setAttribute("cliente", user);
                response.sendRedirect("cliente.jsp");
            }
            
        } else {
            request.setAttribute("mensaje", "Usuario Incorrecto");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }
    
    protected void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            HttpSession session = request.getSession(false);
            if(session!=null) session.invalidate();
            
            request.setAttribute("mensaje", "Ha cerrado sesión");
            request.getRequestDispatcher("index.jsp").forward(request, response);
       
        
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
