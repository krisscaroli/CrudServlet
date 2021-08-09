<%@page import="modelo.ProductoDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
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
            <a class="btn btn-success" href="ProductoController?accion=Nuevo">Nuevo</a>
            <br>
            <br>
            <div class="row">

                <table class="table table-bordered">
                    <thead>
                        <tr class="table-info">
                            <th class="text-center">ID</th>
                            <th class="text-center">NOMBRE</th>
                            <th class="text-center">DESCRIPCIÓN</th>
                            <th class="text-center">PRECIO</th>
                            <th class="text-center">IMAGEN</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            List<Producto> resultado = null;
                            ProductoDAO producto = new ProductoDAO();
                            resultado = producto.listar();

                            for (int i = 0; i < resultado.size(); i++) {

                                String ruta = "ProductoController?accion=modificar&id=" + resultado.get(i).getId();
                                String rutaE = "ProductoController?accion=Eliminar&id=" + resultado.get(i).getId();
                        %>
                        <tr>
                            <td class="text-center"><%= resultado.get(i).getId()%></td>
                            <td class="text-center"><%=resultado.get(i).getNombre()%></td>
                            <td class="text-center"><%=resultado.get(i).getDescripcion()%></td>
                            <td class="text-center"><%=resultado.get(i).getPrecio()%></td>
                            <td class="text-center"><img src="ImageController?id=<%=resultado.get(i).getId()%>" width="250" height="230"></td>
                            <td class="text-center"><a class="btn btn-warning" href=<%=ruta%>>Editar</a>
                                <a class="btn btn-danger" href=<%=rutaE%>>Eliminar</a></td>

                        </tr>
                    </tbody>
                    <%
                        }
                    %>
                </table>
            </div>           
        </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    </body>
</html>