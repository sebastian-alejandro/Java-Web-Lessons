
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark primary-color">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">


        <c:if test="${not empty admin}">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="productos.jsp">Productos</a></li>
                <li class="nav-item"><a class="nav-link" href="categorias.jsp">Categorias</a></li>
            </ul>
            <span class="navbar-text white-text">
                <form class="form-inline" action="login.do">
                    <c:out value="${admin.nombre} ${admin.apellido}" />
                    <button class="btn btn-outline-white btn-sm my-0 z-depth-0" name="btn" type="submit" value="logout">Cerrar Sesión</button>
                </form>
            </span>

        </c:if>

        <c:if test="${not empty vendedor}">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="vender.jsp">Vender</a></li>
                <li class="nav-item"><a class="nav-link" href="misventas.jsp">Mis Ventas</a></li>
            </ul>
            <span class="navbar-text white-text">
                <form class="form-inline" action="login.do">
                    <c:out value="${vendedor.nombre} ${vendedor.apellido}" />
                    <button class="btn btn-outline-white btn-sm my-0 z-depth-0" name="btn" type="submit" value="logout"> Cerrar Sesión</button>
                </form>
            </span>
        </c:if>
        
        <c:if test="${not empty cliente}">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="comprar.jsp">Comprar</a></li>
            </ul>
            <span class="navbar-text white-text">
                <form class="form-inline" action="login.do">
                    <c:out value="${cliente.nombre} ${cliente.apellido}" />
                    <button class="btn btn-outline-white btn-sm my-0 z-depth-0" name="btn" type="submit" value="logout"> Cerrar Sesión</button>
                </form>
            </span>
        </c:if>

    </div>

</nav>
