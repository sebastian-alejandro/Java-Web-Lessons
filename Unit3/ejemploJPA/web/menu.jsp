
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark primary-color">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="productos.jsp">Productos</a></li>
            <li class="nav-item"><a class="nav-link" href="categorias.jsp">Categorias</a></li>
        </ul>
        <span class="navbar-text white-text">
            <c:if test="${not empty admin}">
                <c:out value="${admin.nombre} ${admin.apellido}" />
            </c:if>
        </span>
    </div>

</nav>
