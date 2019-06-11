<%-- 
    Document   : editarcategoria
    Created on : 10-06-2019, 22:58:12
    Author     : sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.ejb.CategoriaFacadeLocal"%>
<!DOCTYPE html>
<%! CategoriaFacadeLocal categoria;%>
<%
    InitialContext ctx = new InitialContext();
    categoria = (CategoriaFacadeLocal) ctx.lookup("java:global/ejemploJPA/CategoriaFacade!cl.ejb.CategoriaFacadeLocal");
    //  List<Categoria> listaCat = categoria.findAll();
%>
<c:set var="categoria" scope="page" value="<%=categoria%>"></c:set>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Editar ${param.nombre}</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <div class="row justify-content-around">
            <div class="col-6 col-lg-6 col-xl-4 py-5">
                <!-- Form -->
                <form class="text-center border border-light p-5" action="categoria.do">

                    <p class="h4 mb-4">Editar ${param.nombre}</p>

                    <input type="text" id="id" class="form-control mb-4" name="txtidcategoria" value="${param.id}" >
                    <input type="text" id="nombre" class="form-control mb-4" name="txtnomcategoria" value="${param.nombre}">
                    <input type="text" id="descripcion" class="form-control mb-4" name="txtdescripcion" value="${param.descripcion}">
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block my-4" name="btn" type="submit" value="editarCategoria">Modificar</button>
                </form>
            </div>
        </div>
    </body>
</html>
