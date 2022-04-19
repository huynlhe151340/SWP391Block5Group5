<%-- 
    Document   : demo
    Created on : Apr 19, 2022, 1:18:54 PM
    Author     : VIP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="LessonController?action=insert\" method=\"POST\">"
                    <table border="0">
           
           <tr>
                <td>Title</td>
                <td><input type=\"text\" name=\"Title\"  ></td>
            </tr>
            <tr>
                <td>Topic</td>
                <td><input type=\"text\" name=\"belongingTopic\"  ></td>
            </tr>
            <tr>
                <td>Content</td>
                <td><input type=\"text\" name=\"content\" ></td>
            </tr>
            <tr>
                <td>Link Video</td>
                <td><input type=\"text\" name=\"videoLink\" ></td>
            </tr>
           <tr>
               <td>Type</td>
               <td><input type=\"text\" name=\"type\"  ></td>
            </tr>
            <tr>
               <td>Status</td>
                <td><input type=\"text\" name=\"status\"  ></td>
            </tr>
          
            <tr>
                <td>CourseId</td>
                <td><input type=\"text\" name=\"courseID\" ></td>"    
</tr>
            <tr>
            <td><input type="submit" value="ADD" name="submit"></td>
           </tr>

      </table>
                     </form>
    </body>
</html>
