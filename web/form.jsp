<%-- 
    Document   : form
    Created on : 26-03-2019, 9:06:52
    Author     : sebastian-alejandro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Form Example</h2>

        <form method="post" action="Form">
            First name:<br>
            <input type="text" name="firstname" value="" placeholder="First Name" required>
            <br>
            Last name:<br>
            <input type="text" name="lastname" value="" placeholder="Last Name" required>
            <br>
            Age:<br>
            <select name="range" required>
                <option value="0" disabled selected>Select</option>
                <option value="1">0-18</option>
                <option value="2">18-30</option>
            </select>
            <br>
            Grade:<br>
            <input type="radio" name="grade" value="Basic" checked>Basic<br>
            <input type="radio" name="grade" value="Secondary">Secondary<br>
            <input type="radio" name="grade" value="University">University
            <br><br>
            <input type="submit" value="Submit">
        </form> 
    </body>
</html>
