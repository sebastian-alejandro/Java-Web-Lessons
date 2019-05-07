/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author sistemas
 */
public class Socio {
    private String  rut;
    private String nombre;
    private int edad;
    private int idcat;

    public Socio() {
    }

    public Socio(String rut, String nombre, int edad, int idcat) {
        this.rut = rut;
        this.nombre = nombre;
        this.edad = edad;
        this.idcat = idcat;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
    }
    
    
}
