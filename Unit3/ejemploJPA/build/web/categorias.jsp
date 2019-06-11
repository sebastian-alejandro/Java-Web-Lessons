<%-- 
    Document   : categorias
    Created on : 04-06-2019, 11:26:25
    Author     : sebastian
--%>
<%@page import="cl.model.Categoria"%>
<%@page import="cl.ejb.CategoriaFacadeLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.List"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="cl.ejb.ProductoFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! CategoriaFacadeLocal categoria;%>
<%
    InitialContext ctx = new InitialContext();
    categoria = (CategoriaFacadeLocal) ctx.lookup("java:global/ejemploJPA/CategoriaFacade!cl.ejb.CategoriaFacadeLocal");
%>
<c:set var="categoria" scope="page" value="<%=categoria%>"></c:set>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorías</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <c:import url="menu.jsp" />
        <div class="row justify-content-around">
            <div class="col-6 col-lg-6 col-xl-4 py-5">
                <!-- Form login -->
                <form class="text-center border border-light p-5" action="categoria.do">

                    <p class="h4 mb-4">Agregar Categoría</p>

                    <input type="text" id="id" class="form-control mb-4" placeholder="Id" name="txtidproducto" value="" >
                    <input type="text" id="nombre" class="form-control mb-4" placeholder="Nombre" name="txtnomproducto" value="">
                    <input type="text" id="descripcion" class="form-control mb-4" placeholder="Descripción" name="txtstock" value="">
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block my-4" name="btn" type="submit" value="agregarCategoria">Agregar</button>
                </form>
            </div>
            <div class="col-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach  items="${categoria.findAll()}" var="c">
                            <tr>
                                <td>${c.idcategoria}</td>
                                <td>${c.nomcategoria}</td>
                                <td>${c.descripcion}</td>
                                <td>
                                    <button class="btn btn-default btn-sm" onclick="location.href='editarcategoria.jsp?id=${c.idcategoria}&nombre=${c.nomcategoria}&descripcion=${c.descripcion}'"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-danger btn-sm" onclick="location.href='#'"><i class="fas fa-trash-alt"></i></button>
                                </td>
                            </tr>
                        </c:forEach> 
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
