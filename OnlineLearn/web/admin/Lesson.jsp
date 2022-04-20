<%-- 
    Document   : Lesson
    Created on : Apr 18, 2022, 1:18:51 PM
    Author     : VIP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h4 class="breadcrumb-title">Users</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Users</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- List user Views Chart -->
                    <div class="col-lg-11 m-b30">
                        <div class="widget-box">
                            <div class="wc-title" style="text-align: right;">
                                <button id="demo" class="btn green radius-xl outline" style="margin-right: 60px;">Create Lesson</button>

                            </div>
                            <form action="LessonController?action=listAll" method="POST">  
                                <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="text-align: center;">ID</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Topic</th>
                                            <th scope="col" style="text-align: center;">Course</th>
                                            <th scope="col" style="text-align: center;">Status</th>
                                            <th scope="col" style="text-align: center; width: 250px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListLesson}" var="o">
                                            <tr>
                                                <th scope="row" style="text-align: center;">${o.id}</th>
                                                <td> ${o.title}</td>
                                                <td>${o.belongingTopic}</td>
                                                <td>${o.name}</td>
                                                <td>${o.status}</td>
                                                <td style="text-align: center"> 
                                                    <a href="LessonController?action=listDetail&lid=${o.id}" class="btn green radius-xl outline">Edit</a>
                                                    <a href="LessonController?action=delete&lid=${o.id}" class="btn red radius-xl outline">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                    <!-- List User Views Chart END-->
                </div>
            </div>
        </main>

        <div class="popup hide__popup">
            <div class="popup__content">
                <div class="popup__close"><i class="fa fa-close"></i></div>
                <form style="margin-top: 100px;" class="contact-bx" action="LessonController?action=insert" method="POST">
                    <div class="row placeani">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Title</label>
                                    <input name="Title" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Topic</label>
                                    <input name="belongingTopic" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group"> 
                                    <label>Content</label>
                                    <input name="content" type="text" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group"> 
                                    <label>Link Video</label>
                                    <input name="videoLink" type="text" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Type</label>
                                    <input name="type" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Status</label>
                                    <input name="status" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>CourseId</label>
                                    <input name="courseID" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 m-b30">
                            <p class="notification" style="color: red;"> ${mess}&nbsp;</p>
                            <button name="submit" type="submit" value="Submit" class="btn button-md">Add</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="../admin/assets/js/jquery.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src='../admin/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="../admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="../admin/assets/js/functions.js"></script>
        <script src="../admin/assets/js/user-list.js"></script>
        <!--        <script src="../admin/assets/js/admin.js"></script>
                <script src="../admin/assets/js/user.js"></script>-->
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>

