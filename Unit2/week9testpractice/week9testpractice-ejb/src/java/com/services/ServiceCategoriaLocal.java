/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Categoria;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author sistemas
 */
@Local
public interface ServiceCategoriaLocal {
    
    ArrayList<Categoria> mostrarCategorias();
    
}
