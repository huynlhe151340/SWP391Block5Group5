
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
            <div class="content-block">
                <!-- Blog Grid ==== -->
                <div class="section-area section-sp1">
                    <div class="container">
                        <div class="ttr-blog-grid-3 row" id="masonry">
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic1.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>Jan 02 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By William</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">This Story Behind Education Will Haunt You Forever.</a></h5>
                                        <p>Knowing that, you’ve optimised your pages countless amount of times, written tons.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic2.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>Feb 05 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By John</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">What Will Education Be Like In The Next 50 Years?</a></h5>
                                        <p>As desperate as you are right now, you have done everything you can on your.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>14 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic3.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>April 14 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By George</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">Master The Skills Of Education And Be.</a></h5>
                                        <p>You will see in the guide all my years of valuable experience together with.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>23 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic3.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>March 21 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By Thomas</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">Eliminate Your Fears And Doubts About Education.</a></h5>
                                        <p>When I needed to start from scratch and figure out how things work. Getting people.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>28 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic1.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>May 08 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By James</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">Seven Reasons You Should Fall In Love With Education.</a></h5>
                                        <p>Honestly, I made ZERO money in the first year and I definitely do not want you to go.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>26 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post action-card col-lg-4 col-md-6 col-sm-12 col-xs-12 m-b40">
                                <div class="recent-news">
                                    <div class="action-box">
                                        <img src="assets/images/blog/latest-blog/pic2.jpg" alt="">
                                    </div>
                                    <div class="info-bx">
                                        <ul class="media-post">
                                            <li><a href="#"><i class="fa fa-calendar"></i>June 19 2019</a></li>
                                            <li><a href="#"><i class="fa fa-user"></i>By Arthur</a></li>
                                        </ul>
                                        <h5 class="post-title"><a href="blog-details.html">The Biggest Contribution Of Education To Humanity.</a></h5>
                                        <p>You may have seen our tool that's been featured by many world-class SEO marketers.</p>
                                        <div class="post-extra">
                                            <a href="#" class="btn-link">READ MORE</a>
                                            <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>15 Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pagination ==== -->
                        <div class="pagination-bx rounded-sm gray clearfix">
                            <ul class="pagination">
                                <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>
                            </ul>
                        </div>
                        <!-- Pagination END ==== -->
                    </div>
                </div>
                <!-- Blog Grid END ==== -->
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


