<%-- 
    Document   : Lesson
    Created on : Apr 18, 2022, 1:18:51 PM
    Author     : VIP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            #buttonAdd{
                margin-left: 70%;
                text-decoration: none;
                border: 1px solid black;
                padding: 5px;
                color: black;
            }
            a{
                text-decoration: none;
                color: red;
            }
        </style>
    </head>
    <body>
       
        <form action="LessonController?action=listAll" method="POST">  
        <table style="border: 0px;align-content: center;margin-left: 30%;width:400px; ">
                <caption> Lesson </caption>
                 <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Topic</th>
                    <th>Course</th>
                    <th>Status</th>
                    
                </tr>
            </thead>
             <c:forEach items="${ListLesson}" var="o">
             <tr>
                    <td> ${o.id} </td>
                    <td> ${o.title}</td>
                    <td>${o.belongingTopic} </td>
                    <td>${o.name} </td>
                    <td>${o.status} </td>
                   
                    <td> <a href="LessonController?action=listDetail&lid=${o.id}">Detail</a></td>
                   <td> <a href="LessonController?action=delete&lid=${o.id}">Delete</a></td>
                </tr>
                </c:forEach>
            </table>
            </form> 
        <a id="buttonAdd" href="LessonController?action=insert">Add</a>
       
    </body>
</html>
