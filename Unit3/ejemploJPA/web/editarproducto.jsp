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
        <title>Editar</title>
    </head>
    <body>
        <form action="control.do">
                id  <input type="text" name="txtidproducto" value="${param.id}" /><br>
                nombre  <input type="text" name="txtnomproducto" value="${param.nombre}" /><br>
                stock  <input type="text" name="txtstock" value="${param.stock}" /><br>
                precio   <input type="text" name="txtprecio" value="${param.precio}" /><br>
              categorias  <select name="txtidcategoria">
                <c:forEach items="${categoria.findAll()}" var="cat">
                    <option value="${cat.idcategoria}" <c:out value="${cat.idcategoria eq param.idCat ? 'selected' : ''}" />>${cat.nomcategoria} </option>
                </c:forEach>
            </select><br>
            <button name="btn" type="submit" value="editarProducto">Modificar</button>
    </body>
</html>
