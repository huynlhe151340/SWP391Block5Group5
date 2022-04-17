<%-- 
    Document   : profile
    Created on : Apr 16, 2022, 9:18:19 PM
    Author     : khait
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <title>EduChamp: Profile</title>

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
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Profile</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Profile</li>
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
                                    <div class="profile-bx text-center">
                                        <div class="user-profile-thumb">
                                            <img src="assets/images/profile/pic1.jpg" alt=""/>
                                        </div>
                                        <div class="profile-info" style="text-align: center;">
                                            <h4>${accountDetail.name}</h4>
                                            <span>${account.email}</span>
                                        </div>
                                        <div class="profile-social" style="text-align: center;">
                                            <ul class="list-inline m-a0">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="profile-tabnav">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Courses</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Quiz Results </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Edit Profile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                                    <div class="profile-content-bx">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="courses">
                                                <div class="profile-head">
                                                    <h3>My Courses</h3>
                                                    <div class="feature-filters style1 ml-auto">
                                                        <ul class="filters" data-toggle="buttons">
                                                            <li data-filter="" class="btn active">
                                                                <input type="radio">
                                                                <a href="#"><span>All</span></a> 
                                                            </li>
                                                            <li data-filter="publish" class="btn">
                                                                <input type="radio">
                                                                <a href="#"><span>Publish</span></a> 
                                                            </li>
                                                            <li data-filter="pending" class="btn">
                                                                <input type="radio">
                                                                <a href="#"><span>Pending</span></a> 
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="courses-filter">
                                                    <div class="clearfix">
                                                        <ul id="masonry" class="ttr-gallery-listing magnific-image row">
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic1.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic2.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic3.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic4.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic5.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic6.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic7.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 book">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic8.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="assets/images/courses/pic9.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
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
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="quiz-results">
                                                <div class="profile-head">
                                                    <h3>Quiz Results</h3>
                                                </div>
                                                <div class="courses-filter">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="edit-profile">
                                                <div class="profile-head">
                                                    <h3>Edit Profile</h3>
                                                </div>
                                                <form class="edit-profile">
                                                    <div class="">
                                                        <div class="form-group row">
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                                <h3>1. Personal Details</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input name="name" id="name" class="form-control" type="text" value="${accountDetail.name}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone No.</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input name="mobile" id="mobile" class="form-control" type="text" value="${accountDetail.mobile}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input name="email" id="email" class="form-control" type="text" value="${currentAccount.email}" readonly="">
                                                            </div>
                                                        </div>
                                                        <div class="seperator"></div>

                                                        <div class="form-group row">
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                                <h3>2. Address</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input name="address" id="address" class="form-control" type="text" value="${accountDetail.address}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Gender</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <c:if test="${accountDetail.gender ==  true}"><input id="gender" checked="true" name="gender" type="radio" value="0"> Male </c:if>
                                                                <c:if test="${accountDetail.gender ==  false}"><input id="gender" name="gender" type="radio" value="0"> Male </c:if>
                                                                <c:if test="${accountDetail.gender ==  true}"><span>&emsp;</span> <input id="gender" name="gender" type="radio" value="1"> Female</c:if>
                                                                <c:if test="${accountDetail.gender ==  false}"><span>&emsp;</span> <input id="gender" checked="true" name="gender" type="radio" value="1"> Female</c:if>
                                                                </div>
                                                            </div>
                                                            <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                                        </div>
                                                                <h3 id="result"></h3>
                                                        <div class="">
                                                            <div class="">
                                                                <div class="row">
                                                                    <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                                    </div>
                                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                        <button type="button" class="btn" onclick="displayPostNotification()">Save</button>
                                                                        <!--<button type="reset" class="btn-secondry">Cancel</button>-->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="tab-pane" id="change-password">
                                                    <div class="profile-head">
                                                        <h3>Change Password</h3>
                                                    </div>
                                                    <form class="edit-profile">
                                                        <div class="">
                                                            <div class="form-group row">
                                                                <div class="col-12 col-sm-8 col-md-8 col-lg-9 ml-auto">
                                                                    <h3>Password</h3>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row" hidden="">
                                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Email</label>
                                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                    <input id="email" name="email" class="form-control" type="text" value="${currentAccount.email}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input id="oldPassword" name="oldPassword" class="form-control" type="password" value="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input id="newPassword" name="newPassword" class="form-control" type="password" value="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input id="re-newPassword" name="re-newPassword" class="form-control" type="password" value="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                            <h3 id="result-change"></h3>
                                                    <div class="row">
                                                        <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                                        </div>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <button type="button" class="btn" onclick="displayChangePasswordNotification()">Save</button>
                                                            <!--<button type="reset" class="btn-secondry">Cancel</button>-->
                                                        </div>
                                                    </div>

                                                </form>
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
        <script src="assets/js/edit-profile.js"></script>
        <script src="assets/js/change-passowrd.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <!--<script src='assets/vendors/switcher/switcher.js'></script>-->
    </body>

</html>
