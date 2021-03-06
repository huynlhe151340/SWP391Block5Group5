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
<html lang="en">

    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.jsp" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/newcss.css">
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../admin/assets/css/color/color-1.css">

    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <%@include file="component/header.jsp" %>  
        <%--<%@include file="sidebar-admin.jsp" %>--%>  
        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Course</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Course </li>
                       <li><a href="CourseLessonController?action=listAllCourse">Course Lesson</a></li>
                       <li> <a href="CourseLessonController?action=listLesson&courseid=${l.courseID}">Lesson</a></li>
                        <li> Lesson Detail</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- List user Views Chart -->
                    <div class="col-lg-11 m-b30">
                        <div class="widget-box">
<!--                            <div class="wc-title" style="text-align: right;">
                                <a href="LessonController?action=insert" class="btn green radius-xl outline" style="margin-right: 60px;">Create Lesson</a>
                            </div>-->
                            <form action="CourseLessonController?action=update" method="POST"> 
                                <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                    
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
                                        <td><textarea id="content"  name="content" style="width: 300px;height: 300px"> ${l.content}</textarea></td>                                       
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
                                        <td><input class="btn green radius-xl outline" style="margin-right: 60px;" type="submit" name="submit" value="Update"><p>${mess}</p></td>
                                    </tr>
                                </table>
                                    
                            </form> 
                        </div>
                    </div>
                    <!-- List User Views Chart END-->
                </div>
            </div>
        </main>
        <!-- External JavaScripts -->
        <script src="../admin/assets/js/jquery.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src='../admin/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="../admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="../admin/assets/js/functions.js"></script>
        <!--<script src="../admin/assets/js/user-list.js"></script>-->
        <!--        <script src="../admin/assets/js/admin.js"></script>
                <script src="../admin/assets/js/user.js"></script>-->
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>

