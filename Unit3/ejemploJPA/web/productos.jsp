<%-- 
    Document   : index
    Created on : 28-05-2019, 11:02:06
    Author     : sistemas
--%>

<%@page import="cl.model.Categoria"%>
<%@page import="cl.ejb.CategoriaFacadeLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="javax.ejb.EJB"%>
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
            <title>Productos</title>
            <c:import url="librerias.jsp"/>
        </head>
        <body>
        <c:import url="menu.jsp"/>
        <div class="row justify-content-around">
            <div class="col-6 col-lg-6 col-xl-4 py-5">
                <!-- Form login -->
                <form class="text-center border border-light p-5" action="control.do">

                    <p class="h4 mb-4">Agregar Producto</p>

                    <input type="text" id="id" class="form-control mb-4" placeholder="Id" name="txtidproducto" value="" >
                    <input type="text" id="nombre" class="form-control mb-4" placeholder="Nombre" name="txtnomproducto" value="">
                    <input type="text" id="stock" class="form-control mb-4" placeholder="Stock" name="txtstock" value="">
                    <input type="text" id="precio" class="form-control mb-4" placeholder="Precio" name="txtprecio" value="">
                    <select name="txtidcategoria" class="browser-default custom-select">
                        <c:forEach items="${categoria.findAll()}" var="cat">
                            <option value="${cat.idcategoria}">${cat.nomcategoria} </option>
                        </c:forEach>
                    </select>
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block my-4" name="btn" type="submit" value="agregarProducto">Agregar</button>
                </form>
            </div>
            <div class="col-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Categoría</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach  items="${producto.findAll()}" var="p">
                            <tr>
                                <td>${p.idproducto}</td>
                                <td>${p.nomproducto}</td>
                                <td>${p.stock}</td>
                                <td>${p.precio}</td>
                                <td>${p.idcategoria.nomcategoria}</td>
                                <td>
                                    <button class="btn btn-default btn-sm" onclick="location.href='editarproducto.jsp?id=${p.idproducto}&nombre=${p.nomproducto}&stock=${p.stock}&precio=${p.precio}&idCat=${p.idcategoria.idcategoria}'"><i class="fas fa-edit"></i></button>
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
