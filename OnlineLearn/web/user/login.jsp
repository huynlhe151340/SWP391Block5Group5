<%-- 
    Document   : login
    Created on : Apr 16, 2022, 5:58:18 PM
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
        <link rel="icon" href="${pageContext.request.contextPath}/user/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/user/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/user/assets/js/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/newcss.css">
        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/assets/css/color/color-1.css">

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image:url(${pageContext.request.contextPath}/user/assets/images/background/bg2.jpg);">
                    <a href="/user/home"><img src="${pageContext.request.contextPath}/user/assets/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Login to your <span>Account</span></h2>
                            <p>Don't have an account? <a href="/user/register.jsp">Create one here</a></p>
                        </div>
                        <c:if test="${notActiveMess == true}"> 
                            <div style="color:red">Your account has not active yet. Please active your account.</div>
                            <button id="demo" class="btn button-sm green">Go Active</button>
                        </c:if>
                        <c:if test="${blockMess == true}"> 
                            <div style="color:red">Your account has been block.</div>
                            <!--<a href="#" class="btn button-sm green">Go Unblock</a>-->
                        </c:if>	
                        <form class="contact-bx" action="${pageContext.request.contextPath}/login" method="post">
                            <div class="row placeani" style="margin-top: 20px;">
                                <div class="col-lg-12">
                                    <div class="form-group ${lastInputEmail != null ? "focused" : ""}">
                                        <div class="input-group">
                                            <label>Your Email</label>
                                            <input name="email" type="text" required="" class="form-control" value="${lastInputEmail}">
                                        </div>
                                        <c:if test="${not empty loginMess}"> 
                                            <div style="color:red">The username or password you entered is not matched to any account.</div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group ${lastInputPassword != null ? "focused" : ""}">
                                        <div class="input-group"> 
                                            <label>Your Password</label>
                                            <input name="password" type="password" class="form-control" required="" value="${lastInputPassword}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group form-forget">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                            <label class="custom-control-label" for="customControlAutosizing">Remember me</label>
                                        </div>
                                        <a href="/user/ForgotPass.jsp" class="ml-auto">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <h5 style="color: red;">${mess}</h5>
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="popup hide__popup">
            <div class="popup__content">
                <div class="popup__close"><i class="fa fa-close"></i></div>
                <form style="margin-top: 100px;" class="contact-bx" action="/user/send-mail" method="POST">
                    <div class="row placeani">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Your Email</label>
                                    <input name="email" type="text" value="${lastInputEmail}" readonly class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 m-b30">
                            <p class="notification" style="color: red;"> ${mess}&nbsp;</p>
                            <button name="submit" type="submit" value="Submit" class="btn button-md">Confirm Email</button>
                        </div>
                    </div>
                </form>
            </div>
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
        <script src="${pageContext.request.contextPath}/user/assets/js/active-account.js"></script>
        <!--<script src='${pageContext.request.contextPath}/user/assets/vendors/switcher/switcher.js'></script>-->
    </body>

</html>