<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: paksa
  Date: 2024-04-25
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/resources/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/resources/css/style.css" rel="stylesheet">
    </head>
    <body>
    <div class="container-fluid fixed-top">
        <div class="container topbar bg-primary d-none d-lg-block">
            <div class="d-flex justify-content-between">
                <div class="top-link pe-2">
                    <span class="text-white"> <small class="text-white mx-2">책 먹는 악어에 오신것을 환영합니다.</small></span>
<%--                    <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>--%>
<%--                    <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>--%>
<%--                    <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>--%>
                </div>
            </div>
        </div>
        <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                <img src="/resources/resources/img/BEClogo.png"style="width: 15%" onclick="location='/'"/>
                <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars text-primary"></span>
                </button>
                <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                    <div class="navbar-nav mx-auto">
                        <a href="/" class="nav-item nav-link active">Home</a>
                        <a href="/product/main" class="nav-item nav-link">Shop</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Community</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="/faq/view" class="dropdown-item">FAQ</a>
                                <a href="/qna/main" class="dropdown-item">Q&A</a>
                                <a href="#" class="dropdown-item">자료실</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Contact</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="#" class="dropdown-item">인사말</a>
                                <a href="#" class="dropdown-item">연혁</a>
                                <a href="#" class="dropdown-item">오시는길</a>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex m-3 me-0">
                        <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                        <a href="/member/cart" class="position-relative me-4 my-auto">
                            <i class="fa fa-shopping-bag fa-2x"></i>
                            <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                        </a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fas fa-user fa-2x"></i></a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <c:choose>
                                    <c:when test="${empty sessionScope.loginInfo}">
                                        <a href="/login/login" class="dropdown-item">로그인</a>
                                        <a href="/member/join" class="dropdown-item">회원가입</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#" class="dropdown-item">로그아웃</a>
                                        <a href="/member/buy" class="dropdown-item">주문내역 조회</a>
                                        <a href="/member/view" class="dropdown-item">마이페이지</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>

                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center">
                    <div class="input-group w-75 mx-auto d-flex">
                        <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                        <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/resources/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/resources/js/main.js"></script>
    </body>
</html>