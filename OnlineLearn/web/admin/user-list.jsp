<%-- 
    Document   : user-list
    Created on : Apr 18, 2022, 3:32:36 PM
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
                    <h4 class="breadcrumb-title">Users</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Users</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- List user Views Chart -->
                    <div class="col-lg-11 m-b30">
                        <div class="widget-box">
                            <div class="wc-title" style="text-align: right;">
                                <button id="demo" class="btn green radius-xl outline" style="margin-right: 60px;">Create New User</button>
                            </div>
                            <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;">ID</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Create Date</th>
                                        <th scope="col" style="text-align: center;">Role</th>
                                        <th scope="col" style="text-align: center;">Status</th>
                                        <th scope="col" style="text-align: center;">Action</th>
                                        <th scope="col" style="text-align: center; width: 100px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${lsAccount}" var="i">
                                        <tr>
                                            <th scope="row" style="text-align: center;">${i.id}</th>
                                            <td>${i.email}</td>
                                            <td>${i.createDate}</td>
                                            <c:if test="${i.roleID==1}">
                                                <td style="text-align: center;">Admin</td>
                                            </c:if>
                                            <c:if test="${i.roleID==2}">
                                                <td style="text-align: center;">Customer</td>
                                            </c:if>
                                            <c:if test="${i.status==1}">
                                                <td style="text-align: center;">Inactive</td>
                                            </c:if>
                                            <c:if test="${i.status==2}">
                                                <td style="text-align: center;">Active</td>
                                            </c:if>
                                            <c:if test="${i.status==3}">
                                                <td style="text-align: center;">Account block</td>
                                            </c:if>
                                            <c:if test="${i.status == 1 && i.roleID == 2}">
                                                <td style="text-align: center"> 
                                                    <button disabled="" onclick="onClickBlockAccount(this.getAttribute('data-id'))" data-id="${i.id}" class="btn red radius-xl outline">Block</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${i.status == 2 && i.roleID == 2}">
                                                <td style="text-align: center"> 
                                                    <button onclick="onClickBlockAccount(this.getAttribute('data-id'))" data-id="${i.id}" class="btn red radius-xl outline">Block</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${i.status == 2 && i.roleID == 1}">
                                                <td style="text-align: center"> 
                                                    <button disabled="" onclick="onClickBlockAccount(this.getAttribute('data-id'))" data-id="${i.id}" class="btn red radius-xl outline">Block</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${i.status == 3 && i.roleID == 2}">
                                                <td style="text-align: center"> 
                                                    <button onclick="onClickUnBlockAccount(this.getAttribute('data-id'))" data-id="${i.id}" class="btn yellow radius-xl outline">UnBlock</button>
                                                </td>
                                            </c:if>
                                            <td style="text-align: center"> 
                                                <a href="user-detail-admin?id=${i.accountDetailID}" class="btn green radius-xl outline">Edit</a>
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
                                            <a class="page-link" href="user-list?page=${page}">${page}</a>
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
        <div class="popup hide__popup">
            <div class="popup__content">
                <div class="popup__close"><i class="fa fa-close"></i></div>
                <form style="margin-top: 100px;" class="contact-bx" action="/admin/register-admin" method="POST">
                    <div class="row placeani">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Your Name</label>
                                    <input id="name" name="name" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Your Email Address</label>
                                    <input id="email" name="email" type="email" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group"> 
                                    <label>Your Password</label>
                                    <input id="password" name="password" type="password" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group"> 
                                    <label>Re-Password</label>
                                    <input id="rePassword" name="rePassword" type="password" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Your Address</label>
                                    <input id="address" name="address" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Your Mobile</label>
                                    <input id="mobile" name="mobile" type="text" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label style="font-weight: normal; font-size: 16px;">Your Gender:&emsp;</label>
                                <input checked="true" name="gender" type="radio" value="0"> Male <span>&emsp;</span> <input name="gender" type="radio" value="1"> Female
                            </div>
                        </div>
                        <div class="col-lg-12 m-b30">
                            <p class="notification" style="color: red;"> ${mess}&nbsp;</p>
                            <button type="submit" value="Submit" class="btn button-md">Create Account</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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

