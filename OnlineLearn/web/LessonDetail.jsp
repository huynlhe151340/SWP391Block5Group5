<%-- 
    Document   : LessonDetail
    Created on : Apr 18, 2022, 3:12:16 PM
    Author     : VIP
--%>

<%@page import="DAO.lessonDao"%>
<%@page import="java.util.List"%>
<%@page import="Entity.lessons"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table{
                margin-left: 30%;
            }
            input{
                width: 300px;
            }
            #content{
                height: 50px;
            }
        </style>
    </head>
    <body>
        <form action="LessonController?action=update" method="POST">
       <table border="0">
           <caption> Lesson Detail</caption>
            <tr>
                <td>ID</td>
                <td><input type="text" name="lid" value="${l.id}"  readonly/></td>
            </tr>
            <tr>
                <td>Title</td>
                <td><input type="text" name="Title" value="${l.title}" ></td>
            </tr>
            <tr>
                <td>Topic</td>
                <td><input type="text" name="belongingTopic" value="${l.belongingTopic}" ></td>
            </tr>
            <tr>
                <td>Content</td>
                <td><input id="content" type="text" name="content" value="${l.content}"></td>
            </tr>
            <tr>
                <td>Link Video</td>
                <td><input type="text" name="videoLink" value="${l.videoLink}"></td>
            </tr>
            <tr>
                <td>Type</td>
                <td><input type="text" name="type" value="${l.type}" ></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><input type="text" name="status" value="${l.status}" ></td>
            </tr>
           
            <tr>
                <td>CourseId</td>
                <td><input type="text" name="courseID" value="${l.courseID}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="submit" value="Update"></td>
            </tr>

        </table>
       
           </form>
    </body>
</html>
