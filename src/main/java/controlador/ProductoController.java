/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.ProductoDAO;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author kriss
 */
@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
@MultipartConfig
public class ProductoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductoDAO productoDAO = new ProductoDAO();
        Producto producto = new Producto();
        String accion = request.getParameter("accion");
        RequestDispatcher dispactcher = null;
        int id;
         String nombre;
          String descripcion;
           Double precio;
           InputStream inputStream = null;
        if (accion == null || accion.isEmpty()) {
            dispactcher = request.getRequestDispatcher("Vistas/productos.jsp");
        } else {
            switch (accion) {
                case "Listar":
                    dispactcher = request.getRequestDispatcher("Vistas/productos.jsp");
                    break;
                case "Nuevo":
                    dispactcher = request.getRequestDispatcher("Vistas/nuevo.jsp");
                    break;
                case "Modificar":
                    int productoID = Integer.parseInt(request.getParameter("id"));
                    System.out.println("productoID: "+productoID);
                    producto = productoDAO.mostrarProducto(productoID);
                    System.out.println("producto: "+producto);
                    request.setAttribute("row", producto);
                    boolean boo = false;
                    if (producto.getArchivoimg2() != null) {
                        boo = true;
                    }
                    request.setAttribute("row2", boo);
                    
                     dispactcher = request.getRequestDispatcher("Vistas/modificar.jsp");
                    break;
                case "Insertar":
                    System.out.println("entro");
                    

                   nombre = request.getParameter("nombre");
                descripcion = request.getParameter("descripcion");

                    precio = Double.parseDouble(request.getParameter("precio"));

                    try {

                        Part filePart = request.getPart("image");
                        if (filePart.getSize() > 0) {
                            System.out.println(filePart.getName());
                            System.out.println(filePart.getSize());
                            System.out.println(filePart.getContentType());
                            inputStream = filePart.getInputStream();
                        }
                    } catch (Exception ex) {
                        System.out.println("fichero: " + ex.getMessage());
                    }
                    if (inputStream != null) {
                        producto.setImagen(inputStream);
                    } else {
                        producto.setImagen(null);
                    }
                    Producto p = new Producto(nombre, descripcion, precio, inputStream);
                    productoDAO.insertarProducto(p);

                    dispactcher = request.getRequestDispatcher("ProductoController?accion=Listar");

                    break;
                    case "Editar":
                    System.out.println("entro");
                    inputStream = null;
                    id = Integer.parseInt(request.getParameter("id"));
                    nombre = request.getParameter("nombre");
                        System.out.println("nombremo "+nombre);
                    descripcion = request.getParameter("descripcion");

                    precio = Double.parseDouble(request.getParameter("precio"));

                    try {

                        Part filePart = request.getPart("image");
                        if (filePart.getSize() > 0) {
                            System.out.println(filePart.getName());
                            System.out.println(filePart.getSize());
                            System.out.println(filePart.getContentType());
                            inputStream = filePart.getInputStream();
                        }
                    } catch (Exception ex) {
                        System.out.println("fichero: " + ex.getMessage());
                    }
                        System.out.println("inputStream "+inputStream);
                    if (inputStream != null) {
                        producto.setImagen(inputStream);
                        Producto p1 = new Producto(id,nombre, descripcion, precio, inputStream);
                        productoDAO.actualizarProducto(p1);
                    } else {
                        producto.setImagen(null);
                        Producto p1 = new Producto(id,nombre, descripcion, precio);
                        productoDAO.actualizarProductoSinImg(p1);
                    }
                    
                    

                   dispactcher = request.getRequestDispatcher("ProductoController?accion=Listar");

                    break;
                case "Eliminar":
                   id = Integer.parseInt(request.getParameter("id"));
                    productoDAO.eliminarProducto(id);
                    dispactcher = request.getRequestDispatcher("Vistas/productos.jsp");
                    break;
                default:
                    dispactcher = request.getRequestDispatcher("ProductoController?accion=Listar");
                    //request.getRequestDispatcher("ProductoController?accion=Listar").forward(request, response);
                    break;
            }
        }
        dispactcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
