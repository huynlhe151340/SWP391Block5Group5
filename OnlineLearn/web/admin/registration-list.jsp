<%-- 
    Document   : registration-list
    Created on : Apr 26, 2022, 2:20:19 PM
    Author     : phung
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
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Registration</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- List user Views Chart -->
                    <div class="col-lg-11 m-b30">
                        <div class="widget-box">
                            <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;">ID</th>
                                        <th scope="col" style="text-align: center;">Account Email</th>
                                        <th scope="col" style="text-align: center;">Course</th>
                                        <th scope="col" style="text-align: center;">Register Date</th>
                                        <th scope="col" style="text-align: center; width: 100px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listRegis}" var="i">
                                        <tr>
                                            <th scope="row" style="text-align: center;">${i.id}</th>
                                            <td>${i.account.email}</td>
                                            <td scope="row" style="text-align: center;">${i.course.name}</td>
                                            <td scope="row" style="text-align: center;">${i.registrationTime}</td>
                                            <td style="text-align: center;">    <a href="registration-detail-admin?id=${i.id}" class="btn green radius-xl outline">Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <p class="notification" style="color: red;">${mess}&nbsp;</p>
                            <nav aria-label="Page navigation example" class="mb-5">
                                <ul class="pagination justify-content-end">
                                    <c:forEach items="${requestScope.lsPage}" var="page">
                                        <li class="page-item ${requestScope.page == page ? "active" : ""}">
                                            <a class="page-link" href="list-registrations?page=${page}">${page}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- List User Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
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

