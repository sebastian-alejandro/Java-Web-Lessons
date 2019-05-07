/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Categoria;
import java.util.ArrayList;
import javax.ejb.Singleton;

/**
 *
 * @author sistemas
 */
@Singleton
public class ServiceCategoria implements ServiceCategoriaLocal {
    
    private ArrayList<Categoria> listCat = new ArrayList();
    
    public ServiceCategoria() {
        listCat.add(new Categoria(1, "Oro"));
        listCat.add(new Categoria(2, "Plata"));
        listCat.add(new Categoria(3, "Bronce"));
    }
    
    @Override
    public ArrayList<Categoria> mostrarCategorias() {
        return listCat;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
