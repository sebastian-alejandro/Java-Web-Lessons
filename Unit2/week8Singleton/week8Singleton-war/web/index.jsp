<%-- 
    Document   : index
    Created on : 30-04-2019, 10:35:06
    Author     : sebastian-alejandro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.services.ServiceLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServiceLocal service;%>
<%
    InitialContext ctx = new InitialContext();
    service = (ServiceLocal) ctx.lookup("java:global/week8Singleton/week8Singleton-ejb/Service!cl.services.ServiceLocal");
%>

<c:set var = "service" scope="page" value="<%=service%>"/>

<!DOCTYPE html>
<html>
    <head>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Week8</title>
    </head>
    <body>
        <h3>Client List</h3>
        <div class="container">
            <form action="client">
                <p>
                    <label for="id">Id</label>
                    <input type="text" name="id" value="">
                </p>
                <p>
                    <label for="name">Name</label>
                    <input type="text" name="name" value="" placeholder="Type Name">
                </p>
                <p>
                    <label for="lastname">Last Name</label>
                    <input type="text" name="lastname" value="" placeholder="Type Last Name">
                </p>
                <p><button class="btn waves-effect waves-light" type="submit" name="btn" value="1">Submit</button></p>
            </form>
            <h6>${txt}</h6>
            <table>

                <thead>
                    <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>Last Name</th>
                    </tr>
                </thead>
                <c:forEach items="${service.getAllClient()}" var="c">
                    <tr>
                        <td>
                            ${c.id}
                        </td>
                        <td>
                            ${c.name}
                        </td>
                        <td>
                            ${c.lastName}
                        </td>
                        <td>
                            <a href="update.jsp?id=${c.id}&name=${c.name}&lastName=${c.lastName}">Update</a>
                            <a href="remove.jsp?id=${c.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
