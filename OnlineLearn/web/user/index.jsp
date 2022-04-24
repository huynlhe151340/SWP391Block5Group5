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
            <!-- Main Slider -->
            <div class="content-block">
                <!-- Popular Courses -->
                <div class="section-area section-sp2 popular-courses-bx">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 heading-bx left">
                                <h2 class="title-head">Our <span>Courses</span></h2>
                            </div>
                        </div>
                        <div class="row">

                            <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                <c:forEach items="${listC}" var="c" >
                                    <div class="item">
                                        <div class="cours-bx">
                                            <div class="action-box">
                                                <img src="${pageContext.request.contextPath}/user/assets/images/courses/${c.getThumbnail()}" alt="" style="height: 155px;object-fit: contain;">
                                                <a href="courseDetail?id=${c.getId()}" class="btn">Read More</a>
                                            </div>
                                            <div class="info-bx text-center">
                                                <h5><a href="courseDetail?id=${c.getId()}">${c.getName()}</a></h5>
                                                <span>${c.getCategory().getCategory()}</span>
                                            </div>
                                            <div class="cours-more-info">
                                                <div class="price" style="width: 100%;display: flex;align-items: center;justify-content: space-between;">
                                                    <del style="font-size: 18px">$${c.getPrice()}</del>
                                                    <h5>$${Math.round(c.getPrice() *(1 - c.getSalePrice()))}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Popular Courses END -->
                <!-- Recent News -->
                <div class="section-area section-sp2">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 heading-bx left">
                                <h2 class="title-head">Recent <span>Posts</span></h2>
                            </div>
                        </div>
                        <div class="recent-news-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                            <c:forEach items="${listP}" var="p" >
                                <div class="item">
                                    <div class="recent-news">
                                        <div class="action-box">
                                            <img src="${pageContext.request.contextPath}/user/assets/images/post/${p.getImage()}" alt=${c.getTitle()}>
                                        </div>
                                        <div class="info-bx">
                                            <ul class="media-post">
                                                <li><a href="post?id=${p.getId()}"><i class="fa fa-calendar"></i>${p.getUpdateDate()}</a></li>
                                                <li><a href="postD?id=${p.getId()}"><i class="fa fa-user"></i>By ${p.getAuthor()}</a></li>
                                            </ul>
                                            <h5 class="post-title"><a href="post?id=${p.getId()}">${p.getTitle()}.</a></h5>
                                            <p>${p.getPostDetail()}.</p>
                                            <div class="post-extra">
                                                <a href="post?id=${p.getId()}" class="btn-link">READ MORE</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- Recent News End -->


        <%@include file="component/footer.jsp" %>
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
    <!--<script src='assets/vendors/switcher/switcher.js'></script>-->
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/assets/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script>
        jQuery(document).ready(function () {
            var ttrevapi;
            var tpj = jQuery;
            if (tpj("#rev_slider_486_1").revolution === undefined) {
                revslider_showDoubleJqueryError("#rev_slider_486_1");
            } else {
                ttrevapi = tpj("#rev_slider_486_1").show().revolution({
                    sliderType: "standard",
                    jsFileLocation: "assets/vendors/revolution/js/",
                    sliderLayout: "fullwidth",
                    dottedOverlay: "none",
                    delay: 9000,
                    navigation: {
                        keyboardNavigation: "on",
                        keyboard_direction: "horizontal",
                        mouseScrollNavigation: "off",
                        mouseScrollReverse: "default",
                        onHoverStop: "on",
                        touch: {
                            touchenabled: "on",
                            swipe_threshold: 75,
                            swipe_min_touches: 1,
                            swipe_direction: "horizontal",
                            drag_block_vertical: false
                        },
                        arrows: {
                            style: "uranus",
                            enable: true,
                            hide_onmobile: false,
                            hide_onleave: false,
                            tmp: '',
                            left: {
                                h_align: "left",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            },
                            right: {
                                h_align: "right",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            }
                        }

                    },
                    viewPort: {
                        enable: true,
                        outof: "pause",
                        visible_area: "80%",
                        presize: false
                    },
                    responsiveLevels: [1240, 1024, 778, 480],
                    visibilityLevels: [1240, 1024, 778, 480],
                    gridwidth: [1240, 1024, 778, 480],
                    gridheight: [768, 600, 600, 600],
                    lazyType: "none",
                    parallax: {
                        type: "scroll",
                        origo: "enterpoint",
                        speed: 400,
                        levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 46, 47, 48, 49, 50, 55]
                    },
                    shadow: 0,
                    spinner: "off",
                    stopLoop: "off",
                    stopAfterLoops: -1,
                    stopAtSlide: -1,
                    shuffle: "off",
                    autoHeight: "off",
                    hideThumbsOnMobile: "off",
                    hideSliderAtLimit: 0,
                    hideCaptionAtLimit: 0,
                    hideAllCaptionAtLilmit: 0,
                    debugMode: false,
                    fallbacks: {
                        simplifyAll: "off",
                        nextSlideOnWindowFocus: "off",
                        disableFocusListener: false,
                    }
                });
            }
        });
    </script>
</body>
</html>