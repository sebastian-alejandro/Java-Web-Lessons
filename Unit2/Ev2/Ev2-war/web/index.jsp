<%-- 
    Document   : index
    Created on : 13-05-2019, 22:29:45
    Author     : seba
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Evaluación 2</title>
    </head>
    <body><div class="row">
            <div class="col s6 offset-s3">
                <div class="card">
                    <div class="card-content">
                        <h4>Ingreso de ...</h4>
                        <form action="socios">
                            <p>
                                <label for="rut">Rut</label>
                                <input type="text" name="rut" value="" placeholder="Ingresar Rut">
                            </p>
                            <p>
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" value="" placeholder="Ingresar Nombre">
                            </p>
                            <p>
                                <label for="edad">Edad</label>
                                <input type="text" name="edad" value="" placeholder="Ingresar Edad">
                            </p>
                            <p>
                                <label>Seleccionar</label>
                                <input name="group1" type="radio" id="test1" value="1" />
                                <label for="test1">Red</label>
                           
                                <input name="group1" type="radio" id="test2" value="2" />
                                <label for="test2">Yellow</label>
                          
                            </p>
                            <br>
                            <p><button class="btn waves-effect waves-light" type="submit" name="btn" value="1">Agregar Nuevo ...</button></p>
                        </form>
                        <h6>${txt}</h6>
                    </div>
                    <div class="card-action">
                        <h4>Listado de ...</h4>
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
