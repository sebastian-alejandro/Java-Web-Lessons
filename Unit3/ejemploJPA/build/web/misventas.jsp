<%-- 
    Document   : misventas
    Created on : 18-06-2019, 11:49:16
    Author     : sistemas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis ventas</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <c:if test="${not empty vendedor}">
            <c:import url="menu.jsp"/>
            <div class="row justify-content-around">
                <div class="col-6 py-5">
                    <table class="table">
                        <c:forEach items="${carro}" var="carro">
                            <tr>
                                <td>${carro.nomproducto}</td>
                                <td>${carro.precio}</td>
                            </tr>
                        </c:forEach>
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
