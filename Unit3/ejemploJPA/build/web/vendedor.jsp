<%-- 
    Document   : vendedor.jsp
    Created on : 18-06-2019, 9:18:30
    Author     : sistemas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendedor</title>
        <c:import url="librerias.jsp"/>
    </head>
    <body>
        <c:if test="${not empty vendedor}">
            <c:import url="menu.jsp"/>
        </c:if>
        <c:if test="${empty vendedor}">
            Error no tiene sesion
            <meta http-equiv="refresh" content="5;url=index.jsp">
        </c:if>
    </body>
</html>
