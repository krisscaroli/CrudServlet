<%-- 
    Document   : modificar
    Created on : Jul 25, 2021, 5:08:50 PM
    Author     : kriss
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="modelo.ProductoDAO"%>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
            <div class="container-fluid">
                <a class="navbar-brand" href="#">DecoRoom</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse flex-row-reverse " id="navbarNavDropdown">
                    <ul class="navbar-nav d-flex justify-content-between">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Usuarios</a>
                        </li>

                    </ul>
                </div>
            </div>
             </nav>
        <div class="container">
           
       <%
            
                Producto resultado = (Producto) request.getAttribute("row");
                
           
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
  
            <h1 class="text-center">Modificar Productos</h1>
            <div class="row">
                <form class="p-5" action="ProductoController?accion=Editar" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                          <label for="id" class="form-label"></label>
                          <input type="hidden" class="form-control" id="id" name="id"  value=<%=resultado.getId()%>>
                        </div>
                        <div class="mb-3">
                          <label for="nombre" class="form-label">Nombre</label>
                          <input type="text" class="form-control" id="nombre" name="nombre"  value="<%=resultado.getNombre()%>">
                        </div>
                        <div class="mb-3">
                          <label for="descripcion" class="form-label">Descripción</label>
                          <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%=resultado.getDescripcion()%>">
                        </div>
                        <div class="mb-3">
                          <label for="precio" class="form-label">Precio</label>
                          <input type="precio" class="form-control" id="email" name="precio" value="<%=resultado.getPrecio()%>">
                        </div>
                         <div class="mb-3">
                          <label for="id">Seleccionar Imagen: *</label> 
                                <%
                                    if (icono) {
                                %>
                                <a href="ImageController?id=<%out.print(resultado.getId()); %>" target="_blank"> Ver Imagen</a>
                                <%
                                    } else {
                                        out.print("Sin Imagen");
                                    }
                                %>
                            
                                <input type="file" name="image" value="" id="btn" class="btn" />
                            </div>
                        <button type="submit" class="btn btn-primary">Modificar</button>
                      </form>
            </div>
        </div>
    </body>
</html>
