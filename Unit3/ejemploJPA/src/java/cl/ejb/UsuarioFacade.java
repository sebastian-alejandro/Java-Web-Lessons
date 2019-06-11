/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ejb;

import cl.model.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sistemas
 */
@Stateless
public class UsuarioFacade implements UsuarioFacadeLocal {

    @PersistenceContext(unitName = "ejemploJPAPU")
    private EntityManager em;

    @Override
    public Usuario buscarUsuario(String rut) {
        return em.find(Usuario.class, rut);
    }

    @Override
    public List getUsuarios() {
        return em.createQuery("SELECT u FROM Usuario u").getResultList();
    }

    @Override
    public Usuario iniciarSesion(String rut, String clave) {
        Usuario us = buscarUsuario(rut);
        if (us != null) {
            if (us.getClave().equals(clave)) {
                return us;
            }
            else
                return null;
        }
        return null;
    }
    
    
    
   
}
