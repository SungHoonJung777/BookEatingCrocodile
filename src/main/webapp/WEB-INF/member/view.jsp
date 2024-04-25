<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>마이페이지</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/resources/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/resources/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
</head>

<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="nav.jsp"/>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">


                    <h4 class="py-3 mb-4">
                        <span class="text-muted fw-light">마이페이지 /</span> 회원정보
                    </h4>


                    <!-- Header -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="user-profile-header-banner">
                                    <img src="/resources/resources/assets/img/pages/profile-banner.png" alt="Banner image" class="rounded-top">
                                </div>
                                <div class="user-profile-header d-flex flex-column flex-sm-row text-sm-start text-center mb-4">
                                    <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                        <img src="/resources/resources/assets/img/avatars/1.png" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                    </div>
                                    <div class="flex-grow-1 mt-3 mt-sm-5">
                                        <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
                                            <div class="user-profile-info">
                                                <h4>유저아이디</h4>
                                                <ul class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">

                                                    <li class="list-inline-item fw-medium">
                                                        <i class="bx bx-calendar-alt"></i> 회원 등록날짜 April 2021
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Header -->

                    <!-- Navbar pills -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-sm-row mb-4">
                                <li class="nav-item"><i class="bx bx-user me-1"></i> Profile</li>
                            </ul>
                        </div>
                    </div>
                    <!--/ Navbar pills -->

                    <!-- User Profile Content -->
                    <div class="row">
<%--                        <div class="col-xl-4 col-lg-5 col-md-5">--%>
                            <!-- About User -->
                            <div class="card mb-4">
                                <div class="card-body">
                                    <small class="text-muted text-uppercase">About</small>
                                    <ul class="list-unstyled mb-4 mt-3">
                                        <li class="d-flex align-items-center mb-3"><i class="bx bx-user"></i><span class="fw-medium mx-2">이름:</span> <span>유저이름</span></li>
                                        <li class="d-flex align-items-center mb-3"><i class="bx bx-flag"></i><span class="fw-medium mx-2">주소:</span> <span>유저주소</span></li>
                                    </ul>
                                    <small class="text-muted text-uppercase">Contacts</small>
                                    <ul class="list-unstyled mb-4 mt-3">
                                        <li class="d-flex align-items-center mb-3"><i class="bx bx-phone"></i><span class="fw-medium mx-2">전화번호:</span> <span>유저 전화번호</span></li>
                                        <li class="d-flex align-items-center mb-3"><i class="bx bx-envelope"></i><span class="fw-medium mx-2">이메일:</span> <span>유저이메일</span></li>
                                    </ul>

                                </div>
                            </div>
                            <!--/ About User -->
                            <!-- Profile Overview -->

                        </div>

                    </div>
                    <!--/ User Profile Content -->

                </div>
                <!-- / Content -->

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            , made with ❤️ by
                            <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                        </div>
                        <div>
                            <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                            <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                            <a
                                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Documentation</a
                            >

                            <a
                                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Support</a
                            >
                        </div>
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->



<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../../resources/vendor/libs/jquery/jquery.js"></script>
<script src="../../resources/vendor/libs/popper/popper.js"></script>
<script src="../../resources/vendor/js/bootstrap.js"></script>
<script src="../../resources/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../../resources/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../../resources/js/main.js"></script>

<!-- Page JS -->
<script src="../../resources/js/pages-account-settings-account.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
