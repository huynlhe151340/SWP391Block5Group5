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

    </head>
    <body id="bg">
        <%@include file="component/header.jsp" %>  

        <div class="content-block">

            <div class="section-area section-sp1">
                <div class="container">
                    <div class="row">
                        <!-- Left part start -->
                        <form action="acceptPostController">
                            <div class="col-lg-8 col-xl-8">
                                <!-- blog start -->                                                                 
                                <div class="recent-news blog-lg">
                                    <div class="action-box blog-lg">
                                        <img src="assets/images/post/<%=request.getAttribute("img")%>" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i></i>By Author : <%=request.getAttribute("Author")%></a></li>
                                            <li><a href="#"><i class="fa fa-calendar" ></i>: <%=request.getAttribute("date")%></a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="#"><%=request.getAttribute("title")%>
                                            </a></h5>
                                        <p><%=request.getAttribute("post_detail")%></p>
                                    </div>
                                </div>      
                            </div>

                            <c:if test="${status==0}">
                                <div class="col-lg-12 m-b30">
                                    <button name="submit1" type="submit" value="<%=request.getAttribute("PostID")%>" class="btn button-md">Từ Chối</button>
                                    <button name="submit2" type="submit" value="<%=request.getAttribute("PostID")%>" class="btn button-md">Chấp Thuận</button>
                                </div>
                            </c:if>
                            <c:if test="${status==1}">
                                <div class="col-lg-12 m-b30">
                                    <button name="submit3" type="submit" value="<%=request.getAttribute("PostID")%>" class="btn button-md">Block</button>

                                </c:if>
                                <c:if test="${status==2}">
                                    <div class="col-lg-12 m-b30">
                                        <button name="submit4" type="submit" value="<%=request.getAttribute("PostID")%>" class="btn button-md">UnBlock</button>

                                    </c:if>
                                    <p class="notification" style="color: green;"> ${mess}&nbsp;</p>
                                    <p class="notification" style="color: red;"> ${mess1}&nbsp;</p>

                                    </form>

                                </div>
                            </div>
                    </div>
                    <
                </div>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
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
        <!--<script src='assets/vendors/switcher/switcher.js'></script>-->
    </body>

</html>