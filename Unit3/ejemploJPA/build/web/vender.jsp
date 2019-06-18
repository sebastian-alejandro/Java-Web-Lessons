<%-- 
    Document   : vender
    Created on : 18-06-2019, 9:36:52
    Author     : sebastian
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
            <title>Vender</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <c:if test="${not empty vendedor}">
            <c:import url="menu.jsp"/>
            <div class="row justify-content-around">
                <div class="col-6 py-5">
                    <table class="table">
                        <thead>
                            <tr>
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
                                    <td>${p.nomproducto}</td>
                                    <td>${p.stock}</td>
                                    <td>${p.precio}</td>
                                    <td>${p.idcategoria.nomcategoria}</td>
                                    <td>
                                        <form class="form-inline" action="carroCompras">
                                            <input type="hidden" name="codigo" value="${p.idproducto}" />
                                            <button class="btn btn-default btn-sm" type="submit" name="btn" value="agregarCarro"><i class="fas fa-dollar-sign"> Vender</i></button>
                                        </form>
                                        
                                    </td>
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
        <c:if test="${empty vendedor}">
            Error no tiene sesion
            <meta http-equiv="refresh" content="5;url=index.jsp">
        </c:if>


    </body>
</html>
