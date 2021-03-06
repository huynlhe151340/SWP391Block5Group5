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
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
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
                    <h4 class="breadcrumb-title">Posts</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Posts</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- List user Views Chart -->
                    <div class="col-lg-11 m-b30">
                        <div class="widget-box">
                            <div class="wc-title" style="text-align: right;">
                                <div class="btn-group">
                                    <a href="${pageContext.request.contextPath}/admin/list-posts" class="btn btn-primary ${currentStatus == -1 ? "active": ""}" aria-current="page">All Post</a>
                                    <a href="${pageContext.request.contextPath}/admin/list-posts?status=0" class="btn btn-primary ${currentStatus == 0 ? "active": ""}">In Active</a>
                                    <a href="${pageContext.request.contextPath}/admin/list-posts?status=1" class="btn btn-primary ${currentStatus == 1 ? "active": ""}">Active</a>
                                </div>
                                <button id="demo" class="btn green radius-xl outline" style="margin-right: 60px;">Create New Post</button>

                            </div>
                            <div class="wc-title">
                                <c:if test="${createMess == false}">
                                    <div style="color: red">C?? l???i x???y ra, kh??ng th??? t???o post.</div>
                                </c:if>
                                <c:if test="${createMess == true}">
                                    <div style="color: green">T???o post th??nh c??ng!.</div>
                                </c:if>
                            </div>
                            <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;">ID</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Author</th>
                                        <th scope="col" style="text-align: center;">Update_date</th>
                                        <th scope="col" style="text-align: center;">Account Name</th>
                                        <th scope="col" style="text-align: center;">Status</th>
                                        <th scope="col" style="text-align: center; width: 100px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>                                   
                                    <c:forEach items="${listPost}" var="i">
                                        <tr>
                                            <th scope="row" style="text-align: center;">${i.id}</th>
                                            <td>${i.title}</td>
                                            <td>${i.author}</td>
                                            <td>${i.updateDate}</td>
                                            <c:forEach items="${listAccount}" var="k">
                                                <c:if test="${i.accountID == k.id}">
                                                    <td>${k.accountDetail.name}</td>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${i.status==0}" >
                                                <td style="text-align: center;"class="text-warning" >Inactive</td>
                                            </c:if>
                                            <c:if test="${i.status==1}" >
                                                <td style="text-align: center;"  class="text-success">Active</td>
                                            </c:if>
                                            <c:if test="${i.status==2}" >
                                                <td style="text-align: center;" class="text-danger">Block</td>
                                            </c:if>
                                            <%--<c:if test="${i.status == 2 && i.roleID == 2}">
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
                                            </c:if>--%>
                                            <td style="text-align: center"> 
                                                <a href="EditPostAdminController?postID=${i.id}" class="btn green radius-xl outline">Edit</a> 
                                                <a href="PostDetailController?postID=${i.id}" class="btn green radius-xl outline">View</a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty listPost}">
                                <div style="text-align: center" >Kh??ng c?? post n??o ????? hi???n th???.</div>
                            </c:if>
                            <nav aria-label="Page navigation example" class="mb-5">
                                <ul class="pagination justify-content-end">
                                    <c:forEach begin="1" end="${numberOfPage}" step="1" var = "i">
                                        <li class="${i == currentPage ? "active" : ""}">
                                            <a class="page-link" href="${pageContext.request.contextPath}/admin/list-posts?page=${i}&status=${currentStatus}">${i}</a>
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
                <!--action="${pageContext.request.contextPath}/admin/create-post" method="POST"-->
                <form style="margin-top: 100px;" class="contact-bx" >
                    <div class="row placeani">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Post Title</label>
                                    <input id="title" name="title" type="text" required="" class="form-control" value="${lastInputTitle}">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label>Post Author</label>
                                    <input id="author" name="author" type="text" required="" class="form-control" value="${lastInputAuthor}">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div for="inputState" class="">Category</div>
                            <!--<select name="category" id="inputState" class="">-->
                            <c:forEach items="${listCategory}" var="o">
                                <input  name="category" id="category" type="radio" ${lastInputCategoryID == o.id ? "selected" : ""} value="${o.id}"><label style="margin-right: 10px" for="${o.id}">${o.category}</label>
                            </c:forEach>
                            <!--</select>-->
                        </div>
                        <div class="col-lg-12">
                            <c:if test="${posts.thumbnail == null}">
                                <img style="width: 200px; height: 200px;" src="../admin/assets/images/courses/noimage.jpg" class="img-avatar" id="img-avatar" />
                            </c:if>
                            <c:if test="${posts.thumbnail != null}">
                                <img src="${posts.thumbnail}" class="img-avatar" id="img-avatar" />
                            </c:if>
                            <div class="overlay-avatar" style="margin-top: 25px; margin-bottom: 20px;">
                                <div class="overlay">
                                    <div class="text-img">

                                        <input type="file" name="file" id="upload-photo" onchange="changeImage(event)" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="input-group">
                                        <label>Post Detail</label>
                                        <input id="detail" name="detail" type="text" required="" class="form-control"  value="${lastInputPostDetail}"> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 m-b30">
                                <p class="notification" style="color: red;"> ${mess}&nbsp;</p>
                                <button name="submit" onclick="onClickAddPost()" value="Submit" class="btn button-md">Create Post</button>
                                <!--name="submit" type="submit" onclick="onClickAddPost()"--> 
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
        <script src="../admin/assets/js/post.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <!--        <script src="../admin/assets/js/admin.js"></script>
                <script src="../admin/assets/js/user.js"></script>-->
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>

