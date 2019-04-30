<%-- 
    Document   : remove
    Created on : 30-04-2019, 12:40:27
    Author     : sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h4>${param.id}</h4>
        <p>Delete Client?</p>
        <a href="index.jsp">No</a>
        <a href="client?id=${param.id}&btn=2">Yes</a>
    </body>
</html>
