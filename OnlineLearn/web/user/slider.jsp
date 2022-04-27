<%-- 
    Document   : slider
    Created on : Apr 27, 2022, 6:01:53 AM
    Author     : ADMIN
--%>
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
                            <h1 class="text-white">Our Sliders</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Our Sliders</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="widget courses-search-bx placeani">
                                        <div class="form-group ${lastSearchWord != null ? "focused" : ""}">
                                            <div class="input-group ">
                                                <label>Search Sliders</label>
                                                <form action="${pageContext.request.contextPath}/user/search-sliders" method="post">
                                                    <div style="display: flex; justify-content: space-between">
                                                        <input name="searchWord" type="text" required class="form-control" style="flex:1" value="${lastSearchWord}">
                                                        <button type="submit" class="btn button-sm">Search</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget widget_archive">
                                        <!--                                <h5 class="widget-title style-1">All Courses</h5>
                                                                        <ul>
                                                                            <li class="active"><a href="#">General</a></li>
                                                                            <li><a href="#">IT & Software</a></li>
                                                                            <li><a href="#">Photography</a></li>
                                                                            <li><a href="#">Programming Language</a></li>
                                                                            <li><a href="#">Technology</a></li>
                                                                        </ul>-->
                                    </div>
                                    <div class="widget">
                                        <a href="#"><img src="assets/images/adv/adv.jpg" alt=""/></a>
                                    </div>
                                    <div class="widget recent-posts-entry widget-courses">
                                        <h5 class="widget-title style-1">Recent Sliders</h5>
                                        <div class="widget-post-bx">
                                            <!--                                            <div class="widget-post clearfix">
                                                                                            <div class="ttr-post-media"> <img src="assets/images/blog/recent-blog/pic1.jpg" width="200" height="143" alt=""> </div>
                                                                                            <div class="ttr-post-info">
                                                                                                <div class="ttr-post-header">
                                                                                                    <h6 class="post-title"><a href="#">Introduction EduChamp</a></h6>
                                                                                                </div>
                                                                                                <div class="ttr-post-meta">
                                                                                                    <ul>
                                                                                                        <li class="price">
                                                                                                            <del>$190</del>
                                                                                                            <h5>$120</h5>
                                                                                                        </li>
                                                                                                        <li class="review">03 Review</li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <c:forEach items="${recentSlider}" var="o">
                                                <div class="widget-post clearfix">
                                                    <div class="ttr-post-media"> <img src="${pageContext.request.contextPath}/user/assets/images/slider/${o.image}" width="200" height="160" alt=""> </div>
                                                    <div class="ttr-post-info">
                                                        <div class="ttr-post-header">
                                                            <h6 class="post-title"><a href="#">${o.title}</a></h6>
                                                        </div>
                                                        <div class="ttr-post-meta">
                                                            <ul>
                                                                <li class="price">
                                                                    <h5 class="free">Free</h5>
                                                                </li>
                                                                <!--<li class="review">07 Review</li>-->
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <c:if test="${empty listSlider}">
                                        <div style="text-align: center">Không có slider nào để hiển thị.</div>
                                    </c:if>
                                    <div class="row">                                        
                                        <c:forEach items="${listSlider}" var="o">
                                            <div class="col-md-6 col-lg-4 col-sm-6 m-b30">
                                                <div class="cours-bx">
                                                    <div class="action-box">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/slider/${o.image}" alt="">
                                                        <a href="#" class="btn">Read More</a>
                                                    </div>
                                                    <div class="info-bx text-center">
                                                        <h5><a href="#">${o.title}</a></h5>
                                                        <span>${o.backlink}</span>
                                                    </div>
                                                    <!--                                                    <div class="cours-more-info">
                                                                                                            <div class="review">
                                                                                                                <span>3 Review</span>
                                                                                                                <ul class="cours-star">
                                                                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                                                                    <li><i class="fa fa-star"></i></li>
                                                                                                                    <li><i class="fa fa-star"></i></li>
                                                                                                                </ul>
                                                                                                            </div>
                                                                                                            <div class="price">
                                                                                                                <del>$190</del>
                                                                                                                <h5>$120</h5>
                                                                                                            </div>
                                                                                                        </div>-->
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <div class="col-lg-12 m-b20">
                                            <div class="pagination-bx rounded-sm gray clearfix">
                                                <ul class="pagination">
                                                    <!--                                                    <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>-->
                                                    <c:forEach begin="1" end="${numberOfPage}" step="1" var = "i">
                                                        <li class="${i == currentPage ? "active" : ""}">
                                                            <a class="page-link" href="${pageContext.request.contextPath}/user/list-sliders?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <!--                                                    <li class="active"><a href="#">1</a></li>
                                                                                                        <li><a href="#">2</a></li>
                                                                                                        <li><a href="#">3</a></li>-->
                                                    <!--                                                    <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>-->
                                                </ul>
                                            </div>
                                        </div>
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
            <!-- Footer END ==== -->
            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>
        <!-- External JavaScripts -->
        <script src="${pageContext.request.contextPath}/user/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/counter/waypoints-min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/counter/counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/masonry/masonry.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/masonry/filter.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/js/functions.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/js/contact.js"></script>
        <script src='${pageContext.request.contextPath}/user/assets/vendors/switcher/switcher.js'></script>
    </body>

</html>

