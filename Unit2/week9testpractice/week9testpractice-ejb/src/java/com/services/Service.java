/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;


import com.model.Socio;
import java.util.ArrayList;
import javax.ejb.Singleton;

/**
 *
 * @author sistemas
 */
@Singleton
public class Service implements ServiceLocal {
    
    private ArrayList<Socio> list = new ArrayList();
    

    public Service() {
        list.add(new Socio("11-22", "Pedro", 45, 1));
        list.add(new Socio("12-33", "Juan", 30, 2));
        list.add(new Socio("13-44", "Diego", 55, 2));
        list.add(new Socio("14-55", "Ana", 60, 3));
        
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    @Override
    public void agregarSocio(String rut, String nombre, int edad, int idcat) {
        Socio s = new Socio(rut, nombre, edad, idcat);
        list.add(s);
    }
    
    @Override
    public ArrayList<Socio> mostrarSocios() {
        return list;
    }
    
    @Override
    public Socio buscar(String rut) {
        for (Socio s : list){
            if (s.getRut().equals(rut) ) {
                return s;
            }
        }
        return null;
    }
    
    @Override
    public String eliminarSocio(String rut) {
        Socio s = buscar(rut);
        if (s==null){
            return "Socio no encontrado";
        }
        else {
            list.remove(s);
            return "Socio Eliminado";
        }
    }
    
    @Override
    public String modificarSocio(String rut, String name, int edad, int idcat) {
        Socio s = buscar(rut);
        if (s==null){
            return "Socio no encontrado";
        }
        else {
            s.setNombre(name);
            s.setEdad(edad);
            s.getIdcat();
            return "Socio modificado";
        }
    }
}
