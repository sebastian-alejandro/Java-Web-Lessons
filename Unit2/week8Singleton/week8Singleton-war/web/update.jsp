<%-- 
    Document   : update.jsp
    Created on : 07-05-2019, 10:09:43
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
        <h3>Update: ${param.id}</h3>
        
        <div class="container">
            <form action="client">
                <p>
                    <label for="id">Id</label>
                    <input type="text" name="id" value="${param.id}" readonly>
                </p>
                <p>
                    <label for="name">Name</label>
                    <input type="text" name="name" value="${param.name}" placeholder="Type Name">
                </p>
                <p>
                    <label for="lastname">Last Name</label>
                    <input type="text" name="lastname" value="${param.lastName}" placeholder="Type Last Name">
                </p>
                <p><button class="btn waves-effect waves-light" type="submit" name="btn" value="3">Update</button></p>
            </form>
        </div>
        
    </body>
</html>
