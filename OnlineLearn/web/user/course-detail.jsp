
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
                            <h1 class="text-white">Courses Details</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="home">Home</a></li>
                            <li><a href="courses">Courses List</a></li>
                            <li>Courses Details</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row d-flex flex-row-reverse">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="course-detail-bx">
                                        <div class="course-price" style="align-items: center;display: flex;justify-content: center;">
                                            <del>$${Math.round(course.getPrice())}</del>
                                            <h4 class="price" style="margin-left: 10px">$${Math.round(course.getPrice() *(1 - course.getSalePrice()))}</h4>
                                        </div>	
                                        <div class="course-buy-now text-center" style="text-align: center">
                                            <c:if test="${isBuyThisCourse == true}" >
                                                <a href="#" class="btn green">Paid</a>
                                            </c:if>
                                            <c:if test="${isBuyThisCourse == false}" >
                                                <a href="#" class="btn radius-xl text-uppercase" data-toggle="modal" data-target="#exampleModal">Buy Now This Course</a>
                                            </c:if>
                                        </div>
                                        <div class="teacher-bx">
                                            <div class="teacher-info">
                                                <div class="teacher-thumb">
                                                    <img src="assets/images/testimonials/pic1.jpg" alt=""/>
                                                </div>
                                                <div class="teacher-name">
                                                    <h5>${course.getOwner()}</h5>
                                                    <!--<span>Science Teacher</span>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cours-more-info">
                                            <div class="price categories" style="text-align: left">
                                                <span>Categories</span>
                                                <h5 class="text-primary">${course.getCategory().getCategory()}</h5>
                                            </div>
                                        </div>
                                        <c:if test="${buyMess == true}">
                                            <div style="color:green">Buy successful!</div>
                                        </c:if>
                                        <c:if test="${buyMess == false}">
                                            <div style="color: red">Something wrong. Can not buy this course!</div>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="courses-post">
                                        <div class="ttr-post-media media-effect">
                                            <div><img src="assets/images/courses/${course.getThumbnail()}" style="height: 500px;object-fit: contain" alt=""></div>
                                        </div>
                                        <div class="ttr-post-info">
                                            <div class="ttr-post-title ">
                                                <h2 class="post-title">${course.getName()}</h2>
                                            </div>
                                            <div class="ttr-post-text">
                                                <p>${course.getDescription()}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="courese-overview" id="overview">
                                        <h4>Overview</h4>
                                        <div class="row">
                                            <div class="col-md-12 col-lg-4">
                                                <ul class="course-features">
                                                    <!--<li><i class="ti-book"></i> <span class="label">Lessons</span> <span class="value">8</span></li>-->
                                                    <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">${course.getDuration()}</span></li>
                                                    <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">${course.getSkillLevel()}</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">${course.getLanguage()}</span></li>
                                                    <!--<li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>-->
                                                </ul>
                                            </div>
                                            <div class="col-md-12 col-lg-8">
                                                <h5 class="m-b5">Course Description</h5>
                                                <p>${course.getDescription()}</p>
                                                <h5 class="m-b5">Learning Outcomes</h5>
                                                <ul class="list-checked primary">
                                                    <li>Over 37 lectures and 55.5 hours of content!</li>
                                                    <li>LIVE PROJECT End to End Software Testing Training Included.</li>
                                                    <li>Learn Software Testing and Automation basics from a professional trainer from your own desk.</li>
                                                    <li>Information packed practical training starting from basics to advanced testing techniques.</li>
                                                    <li>Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
                                                    <li>Course content designed by considering current software testing technology and the job market.</li>
                                                    <li>Practical assignments at the end of every session.</li>
                                                    <li>Practical learning experience with live project work and examples.cv</li>
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
            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Process To Buy This Course</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.request.contextPath}/user/course-register" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="name" placeholder="Enter your full name" required="" value="${currentAccount.accountDetail.name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1"  name="email"  aria-describedby="emailHelp" placeholder="Enter your email" required="" value="${currentAccount.email}">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter your phome number" required="" value="${currentAccount.accountDetail.mobile}">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id" value="${course.getId()}">
                                <input type="hidden" name="total_cost" value="${Math.round(course.getPrice() *(1 - course.getSalePrice()))}">
                                <button type="button" class="btn outline" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn primary">BUY $${Math.round(course.getPrice() *(1 - course.getSalePrice()))}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Footer ==== -->
            <%@include file="component/footer.jsp" %>
        </div>
        <!-- External JavaScripts -->
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
        <script src="${pageContext.request.contextPath}/user/assets/js/lesson-view.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    </body>
</html>


