
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
        <link rel="icon" href="${pageContext.request.contextPath}/user/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/user/assets/images/favicon.png" />
        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>
        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/assets.css">
        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/typography.css">
        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/shortcodes/shortcodes.css">
        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/color/color-1.css">
        <!-- REVOLUTION SLIDER CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/vendors/revolution/css/navigation.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/custom.css">
        <!-- REVOLUTION SLIDER END -->
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
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Posts</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Post</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- Blog Grid ==== -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="ttr-blog-grid-3 row" id="masonry">
                                <c:forEach var="c" items="${listPost}">
                                    <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                        <div class="recent-news">
                                            <div class="action-box">
                                                <img src="assets/images/post/${c.getImage()}" alt="">
                                            </div>
                                            <div class="info-bx">
                                                <ul class="media-post">
                                                    <li><a href="#"><i class="fa fa-calendar">${c.getUpdateDate()}</i></a></li>
                                                    <li><a href="#"><i class="fa fa-user"></i>${c.getAuthor()}</a></li>
                                                </ul>
                                                <h5 class="post-title">
                                                    <a href="post?id=${c.getId()}">${c.getTitle()}</a></h5>
                                                <p>${c.getPostDetail()}</p>
                                                <div class="post-extra">
                                                    <a href="post?id=${c.getId()}" class="btn-link">READ MORE</a>
                                                    <!--<a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Pagination ==== -->
                            <div class="pagination-bx rounded-sm gray clearfix">
                                <ul class="pagination">
                                    <!--<li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>-->
                                    <c:forEach begin="1" end="${numOfPage}" var="p">
                                        <c:if test="${pageIndex==p}">
                                            <li class="active"><span href="posts?page=${p}">${p}</span></li>
                                            </c:if>
                                            <c:if test="${pageIndex!=p}">
                                            <li><a href="posts?page=${p}">${p}</a></li>
                                            </c:if>
                                    </c:forEach>
                                    <!--<li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>-->
                                </ul>
                            </div>
                            <!-- Pagination END ==== -->
                        </div>
                    </div>
                    <!-- Blog Grid END ==== -->
                </div>
            </div>
            <!-- Page Content Box END ==== -->
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


