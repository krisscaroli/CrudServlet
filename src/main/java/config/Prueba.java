/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.util.List;
import modelo.Producto;
import modelo.ProductoDAO;
import javax.servlet.ServletOutputStream;
/**
 *
 * @author kriss
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ProductoDAO productoDAO= new ProductoDAO();
    Producto producto= new Producto();
     List<Producto> lista=productoDAO.listar();
                System.out.println("lista: "+lista.size());
    }
    
}
