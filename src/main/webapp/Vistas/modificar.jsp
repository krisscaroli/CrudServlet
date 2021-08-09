<%-- 
    Document   : modificar
    Created on : Jul 25, 2021, 5:08:50 PM
    Author     : kriss
--%>
<%@page import="modelo.ProductoDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.A"%>
<%@page import="modelo.Alumnos"%>
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
           
        
            <h1>Productos</h1>
        <%
            String id = request.getParameter ("id"); // Use request para obtener 
            int mid;
            mid =Integer.parseInt(id);
            Producto resultado=null;
            ProductoDAO productoDAO = new ProductoDAO(); 
            resultado =  productoDAO.mostrarProducto(mid);
            
            
        %>
  
            <h1 class="text-center">Modificar Productos</h1>
            <div class="row">
                <form class="p-5" action="ProductoController?accion=Actualizar" method="POST">
                        <div class="mb-3">
                          <label for="id" class="form-label"></label>
                          <input type="hidden" class="form-control" id="id" name="id"  value=<%=resultado.getId()%>>
                        </div>
                        <div class="mb-3">
                          <label for="nombre1" class="form-label">Nombre</label>
                          <input type="text" class="form-control" id="nombre1" name="nombre"  value=<%=resultado.getNombre()%>>
                        </div>
                        <div class="mb-3">
                          <label for="apellido" class="form-label">Apellido</label>
                          <input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido()%>>
                        </div>
                        <div class="mb-3">
                          <label for="email" class="form-label">Email</label>
                          <input type="email" class="form-control" id="email" name="email" value=<%=resultado.getEmail()%>>
                        </div>
                        <button type="submit" class="btn btn-primary">Modificar</button>
                      </form>
            </div>
        </div>
    </body>
</html>
