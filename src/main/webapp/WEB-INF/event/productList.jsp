<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-04-29
  Time: PM 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Login Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/resources/resources/assets/img/favicon/favicon.ico"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/theme-default.css"
          class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/pages/page-auth.css"/>
    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
    <style>

        .pageInfo_area {
            display: inline-block;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-left: 500px;
            margin-bottom: 50px;
            margin-top: 50px;
        }

        .pageInfo_btn {
            display: inline-block;
            margin: 0 5px;
        }

        .pageInfo_btn a {
            padding: 5px 10px;
            color: #333;
            text-decoration: none;
        }

        .pageInfo_btn.active a {
            background-color: #337ab7;
            color: #fff;
            border-radius: 5px;
        }

        .pageInfo_btn.previous a,
        .pageInfo_btn.next a {
            font-weight: bold;
        }

        .pageInfo_btn.previous a span,
        .pageInfo_btn.next a span {
            margin-right: 5px;
        }


        .active {
            background-color: #cdd5ec;
        }
    </style>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <!-- / Menu -->

        <!-- Layout container -->


            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tables /</span> 상품 리스트</h4>

                    <hr class="my-5" />
                    <!-- Hoverable Table rows -->
                    <div class="card">
                        <h5 class="card-header">상품 리스트</h5>
                        <div class="table-responsive text-nowrap">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>상품 이미지</th>
                                    <th>상품 이름</th>
                                    <th>상품 저자</th>
                                    <th>상품 가격</th>
                                    <th>상품 남은 수량</th>
                                    <th>상품 출판사</th>
                                    <th>상품 관리</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">

                                <c:forEach var="list" items="${productList}">
                                    <input type="hidden" name="pro_idx" id="pro_idx" value="${list.pro_idx}"/>
                                    <tr>
                                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><img src="/resources/resources/img/books/${list.pro_image}" style="width: 30px; height: 50px;"/></strong></td>
                                        <td><a href="/event/productChoice?pro_idx=${list.pro_idx}">${list.pro_name}</a></td>
                                        <td>${list.pro_writer}</td>

                                        <td><span class="badge bg-label-primary me-1">${list.pro_price}</span></td>
                                        <td>${list.pro_amount}</td>
                                        <td>${list.pro_company}</td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="/admin/productModify?pro_idx=${list.pro_idx}"
                                                    ><i class="bx bx-edit-alt me-1"></i> Edit</a
                                                    >
                                                    <a class="dropdown-item" href="/admin/productDelete?pro_idx=${list.pro_idx}"
                                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                                    >
                                                </div>
                                            </div>
                                        </td>


                                    </tr>
                                </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- / Footer -->

                    <div class="pageInfo_wrap">
                        <div class="pageInfo_area">
                            <!-- 이전페이지 버튼 -->
                            <c:if test="${pageMaker.prev}">
                                <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                            </c:if>

                            <!-- 각 번호 페이지 버튼 -->
                            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                            </c:forEach>


                            <!-- 다음페이지 버튼 -->
                            <c:if test="${pageMaker.next}">
                                <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                            </c:if>
                        </div>

                        <div class="search_wrap">
                            <div class="search_area d-flex align-items-center">
                                <select name="type" class="form-control mr-2">
                                    <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>상품 이름</option>
                                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>상품 저자</option>
                                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>상품 출판사</option>
                                </select>
                                <input type="text" id="keyword" name="keyword" class="form-control mr-2" placeholder="Keyword">
                                <button id="searchBtn" class="btn btn-primary">Search</button>
                            </div>
                        </div>

                    </div>
                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <form class="moveForm" method="get" id="moveForm">
            <input type="hidden" name="type" value="${pageMaker.cri.type }">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        </form>
        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    const moveForm = document.querySelector("#moveForm");
    document.querySelector(".pageinfo")
    $(".pageInfo_area a").on("click", function(e){
        console.log("#############3");
        e.preventDefault();
        const pageNum = $(this).attr("href");
        moveForm.querySelector("input[name='pageNum']").value = pageNum;
        console.log(pageNum+"######");
        moveForm.action = "/event/productList";
        moveForm.submit();
    });

    document.querySelector("#searchBtn").addEventListener("click", function (e) {
        e.preventDefault();

        let type = $(".search_area select").val();
        let val = document.querySelector("#keyword").value;

        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }

        if(!val){
            alert("키워드를 입력하세요.");
            return false;
        }

        moveForm.querySelector("input[name='type']").value = type;
        moveForm.querySelector("input[name='keyword']").value = val;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.submit();
    });
</script>
<!-- / Layout wrapper -->

<script src="/resources/resources/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/resources/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/resources/assets/vendor/js/bootstrap.js"></script>
<script src="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/resources/resources/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="/resources/resources/assets/js/main.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
