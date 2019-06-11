<%-- 
    Document   : index
    Created on : 04-06-2019, 9:03:08
    Author     : sistemas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <div class="row justify-content-around">
            <div class="col-6 col-lg-6 col-xl-4 py-5">
                <!-- Form login -->
                <form class="text-center border border-light p-5" action="login.do">

                    <p class="h4 mb-4">Login</p>

                    <input type="text" id="rut" class="form-control mb-4" placeholder="Rut" name="txtrut" value="" >
                    <input type="password" id="clave" class="form-control mb-4" placeholder="Contraseña" name="txtclave" value="">
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block my-4" name="btn" type="submit" value="login">Iniciar Sesión</button>
                    <br/>
                    ${mensaje}
                </form>
            </div>
        </div>
    </body>
</html>
