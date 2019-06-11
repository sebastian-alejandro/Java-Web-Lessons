<%-- 
    Document   : editarproducto
    Created on : 04-06-2019, 9:51:27
    Author     : sistemas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.ejb.CategoriaFacadeLocal"%>
<%@page import="cl.ejb.ProductoFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ProductoFacadeLocal producto;%>
<%! CategoriaFacadeLocal categoria;%>
<%
    InitialContext ctx = new InitialContext();
    producto = (ProductoFacadeLocal) ctx.lookup("java:global/ejemploJPA/ProductoFacade!cl.ejb.ProductoFacadeLocal");
    //List<Producto> listaPro = producto.findAll();
    InitialContext ctx2 = new InitialContext();
    categoria = (CategoriaFacadeLocal) ctx2.lookup("java:global/ejemploJPA/CategoriaFacade!cl.ejb.CategoriaFacadeLocal");
    //  List<Categoria> listaCat = categoria.findAll();
%>
<c:set var="producto" scope="page" value="<%=producto%>"></c:set>
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
                <!-- Form login -->
                <form class="text-center border border-light p-5" action="control.do">

                    <p class="h4 mb-4">Editar ${param.nombre}</p>

                    <input type="text" id="id" class="form-control mb-4" name="txtidproducto" value="${param.id}" >
                    <input type="text" id="nombre" class="form-control mb-4" name="txtnomproducto" value="${param.nombre}">
                    <input type="text" id="stock" class="form-control mb-4" name="txtstock" value="${param.stock}">
                    <input type="text" id="precio" class="form-control mb-4" name="txtprecio" value="${param.precio}">
                    <select name="txtidcategoria" class="browser-default custom-select">
                        <c:forEach items="${categoria.findAll()}" var="cat">
                            <option value="${cat.idcategoria}" <c:out value="${cat.idcategoria eq param.idCat ? 'selected' : ''}" />>${cat.nomcategoria} </option>
                        </c:forEach>
                    </select>
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block my-4" name="btn" type="submit" value="editarProducto">Modificar</button>
                </form>
            </div>
        </div>
    </body>
</html>
