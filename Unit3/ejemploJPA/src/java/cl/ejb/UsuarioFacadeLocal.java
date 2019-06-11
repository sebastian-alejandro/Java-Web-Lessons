/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ejb;

import cl.model.Usuario;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author sistemas
 */
@Local
public interface UsuarioFacadeLocal {

    Usuario buscarUsuario(String rut);

    List getUsuarios();

    Usuario iniciarSesion(String rut, String clave);
    
}
