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
            <title>JSP Page</title>
        </head>
        <body>
            aca el formulario
            <form action="control.do">
                id  <input type="text" name="txtidproducto" value="" /><br>
                nombre  <input type="text" name="txtnomproducto" value="" /><br>
                stock  <input type="text" name="txtstock" value="" /><br>
                precio   <input type="text" name="txtprecio" value="" /><br>
                categorias  <select name="txtidcategoria">
                <c:forEach items="${categoria.findAll()}" var="cat">
                    <option value="${cat.idcategoria}">${cat.nomcategoria} </option>
                </c:forEach>
            </select><br>
            <button name="btn" type="submit" value="agregarProducto">Agregar</button>
        </form>
        ${producto.count()}
        <table>
            <c:forEach  items="${producto.findAll()}" var="p">
                <tr>
                    <td> ${p.idproducto}</td>
                    <td> ${p.nomproducto}</td>
                    <td>${p.stock}</td>
                    <td>${p.precio}</td>
                    <td>${p.idcategoria.nomcategoria}</td>
                    <td><a href="editarproducto.jsp?id=${p.idproducto}&nombre=${p.nomproducto}&stock=${p.stock}&precio=${p.precio}&idCat=${p.idcategoria.idcategoria}">Editar</a></td>
                </tr>

            </c:forEach>
        </table>
    </body>
</html>
