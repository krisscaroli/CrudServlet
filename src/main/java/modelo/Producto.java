/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.InputStream;

/**
 *
 * @author kriss
 */
public class Producto {
    private int id;
    private String nombre;
    private String descripcion;
    private Double precio;
    private InputStream imagen;
    private byte[] archivoimg2;
    public Producto() {
    }
    
    
    public Producto(int id, String nombre, String descripcion, Double precio, InputStream imagen) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.imagen = imagen;
    }

    public Producto(int id, String nombre, String descripcion, Double precio) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public Producto(String nombre, String descripcion, Double precio,  InputStream imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.imagen = imagen;
    }

    public Producto(int id, String nombre, String descripcion, Double precio, byte[] archivoimg2) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.archivoimg2 = archivoimg2;
    }
    

    public byte[] getArchivoimg2() {
        return archivoimg2;
    }

    public void setArchivoimg2(byte[] archivoimg2) {
        this.archivoimg2 = archivoimg2;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }
    
    
}
