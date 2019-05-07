/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Socio;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author sistemas
 */
@Local
public interface ServiceLocal {
    
    void agregarSocio(String rut, String nombre, int edad, int idcat);
    
    ArrayList<Socio> mostrarSocios();
    
    Socio buscar(String rut);
    
    String eliminarSocio(String rut);
    
    String modificarSocio(String rut, String name, int edad, int idcat);
}
