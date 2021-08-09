<%-- 
    Document   : nuevo
    Created on : 15 jul. 2021, 20:21:35
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
            <h1 class="text-center">Añadir Productos</h1>
            <div class="row">
                
                    <form name="formimg" class="p-5" action="ProductoController?accion=Insertar" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" >
                    </div>
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <input type="text" class="form-control"  name="descripcion">
                    </div>
                    <div class="mb-3">
                        <label for="precio" class="form-label">Precio</label>

                        <input type="number" class="form-control" id="precio" name="precio">
                    </div>
                    <div class="mb-3"> 
                        <label for="id">Seleccionar Imagen: *</label> 



                        <input type="file" name="image" value="" id="btn" class="btn" />
                    </div>
                    <input type="submit"  class="btn btn-primary">Añadir</button>
                </form>
            </div>
        </div>

    </body>
</html>