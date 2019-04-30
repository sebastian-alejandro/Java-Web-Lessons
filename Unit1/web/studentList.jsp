<%-- 
    Document   : studentList
    Created on : 26-03-2019, 10:52:16
    Author     : sebastian-alejandro
--%>

<%@page import="example.form.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Student Info</h3>
        <br>
        Fist Name : ${student.firstName}<br>
        Last Name : ${student.lastName}<br>
        Age :  <%
            Student std = (Student) request.getAttribute("student");
            if (std.getAge() == 1) {
        %>            
        0-18
        <%
        } else {
        %>
        18-30
        <%
            }
        %><br>
        Grade : ${student.grade}<br>
    </body>
</html>
