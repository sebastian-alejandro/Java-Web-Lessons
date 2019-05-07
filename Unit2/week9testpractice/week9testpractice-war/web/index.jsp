<%-- 
    Document   : index
    Created on : 07-05-2019, 12:07:54
    Author     : sistemas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.services.ServiceLocal"%>
<%@page import="com.services.ServiceCategoriaLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServiceLocal service;%>
<%! ServiceCategoriaLocal serviceCat;%>
<%
    InitialContext ctx = new InitialContext();
    service = (ServiceLocal) ctx.lookup("java:global/week9testpractice/week9testpractice-ejb/Service!com.services.ServiceLocal");
    serviceCat = (ServiceCategoriaLocal) ctx.lookup("java:global/week9testpractice/week9testpractice-ejb/ServiceCategoria!com.services.ServiceCategoriaLocal");
%>

<c:set var = "service" scope="page" value="<%=service%>"/>
<c:set var = "serviceCat" scope="page" value="<%=serviceCat%>"/>
<!DOCTYPE html>
<html>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Test Practice week 9</title>
    <body>
        <h3>Lista de Socios</h3>
        <div class="container">
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
                    <label>
                        <input name="categoria" type="radio" value="1" />
                        <span>Oro</span>
                    </label>
                    <label>
                        <input name="categoria" type="radio" value="2" />
                        <span>Plata</span>
                    </label>
                    <label>
                        <input name="categoria" type="radio" value="3" />
                        <span>Bronce</span>
                    </label>
                </p>
                <p><button class="btn waves-effect waves-light" type="submit" name="btn" value="1">Agregar Nuevo Socio</button></p>
            </form>
            <h6>${txt}</h6>
            <hr>
            <table>

                <thead>
                    <tr>
                        <th>Rut</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <c:forEach items="${service.mostrarSocios()}" var="s">
                    <tr>
                        <td>
                            ${s.rut}
                        </td>
                        <td>
                            ${s.nombre}
                        </td>
                        <td>
                            ${s.edad}
                        </td>
                        <td>
                            <c:forEach items="${serviceCat.mostrarCategorias()}" var="c">
                                <c:if test = "${s.idcat == c.idcat}">
                                    ${c.descripcion}
                                </c:if>                            
                            </c:forEach>
                        </td>
                        <td>
                            <a href="update.jsp?id=${s.rut}&name=${s.nombre}&lastName=${s.edad}">Update</a>
                            <a href="remove.jsp?id=${s.rut}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
