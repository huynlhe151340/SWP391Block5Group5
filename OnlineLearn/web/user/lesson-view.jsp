<%-- 
    Document   : lesson-view
    Created on : Apr 13, 2022, 9:44:22 AM
    Author     : khait
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
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>

            <!-- Header Top ==== -->
            <%@include file="component/header.jsp" %> 
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner3.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Lesson View</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Lesson View</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div style="padding-left: 200px;">
                            <div class="row">
                                <div class="col-md-1">
                                    <input name="courseId" class="form-control" value="${courseId}" placeholder="Your Email Address" type="text" style="display: none;">
                                    <input name="registerId" class="form-control" value="${registerId}" placeholder="Your Email Address" type="text" style="display: none;">
                                    <div class="widget">
                                        <h6 class="widget-title">Courses</h6>
                                    </div>
                                    <div class="widget recent-posts-entry widget-courses">
                                        <div class="widget-post-bx">
                                            <c:forEach items="${listLesson}" var="i">
                                                <div class="widget-post clearfix">
                                                    <div class="ttr-post-info">
                                                        <div class="ttr-post-header">
                                                            <c:if test="${i.type == 1}">
                                                                <label class="post-title">${i.title}</label>
                                                            </c:if>
                                                            <c:if test="${i.type == 2}">
                                                                <span style="padding-left: 20px; <c:if test="${lessonId == i.id}">background-color: lightgray; padding: 20px;</c:if>" class="post-title"><a onclick="changeLesson(${courseId},${i.id}, ${registerId})" href="/lesson-view?courseId=${courseId}&lessonId=${i.id}">${i.title}</a></span>
                                                                </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9" style="padding-left: 100px;">
                                    <div class="row">
                                        <iframe id="video" width="100%" height="600px" class="height-video" src="${lesson.videoLink}" frameborder="0"
                                                webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>    
                                    </div>
                                    <div class="row">
                                        ${lesson.content}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->

            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <%@include file="component/footer.jsp" %>
        </div>
        <!-- External JavaScripts -->
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src="assets/js/lesson-view.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    </body>
</html>


