<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="/admin/main" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                        width="25"
                        viewBox="0 0 25 42"
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                            d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                            id="path-1"
                    ></path>
                    <path
                            d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                            id="path-3"
                    ></path>
                    <path
                            d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                            id="path-4"
                    ></path>
                    <path
                            d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                            id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                                id="Triangle"
                                transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
                    <span class="app-brand-text demo menu-text fw-bolder ms-2">Sneat</span>
                </a>

                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>


            <ul class="menu-inner py-1">
                <!-- Dashboard -->
                <li class="menu-item active">
                    <a href="/admin/main" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div data-i18n="Analytics">메인 페이지</div>
                    </a>
                </li>

                <!-- Layouts -->


                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Pages</span>
                </li>
                <li class="menu-item">
                    <a href="/admin/memberList" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                        <div data-i18n="Basic">회원관리</div>
                    </a>
                </li>
                <!-- Components -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">Product</span></li>
                <!-- Cards -->
                <li class="menu-item">
                    <a href="/admin/productList" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">상품리스트</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/admin/productRegist" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-box"></i>
                        <div data-i18n="Basic">상품등록</div>
                    </a>
                </li>

                <!-- Misc -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">배송</span></li>
                <li class="menu-item">
                    <a
                            href="/admin/delivery"
                            target="_blank"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-support"></i>
                        <div data-i18n="Support">배송관리</div>
                    </a>
                </li>
                <li class="menu-header small text-uppercase"><span class="menu-header-text">Q&A</span></li>
                <li class="menu-item">
                    <a
                            href="/admin/oneList"
                            target="_self"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">1:1 문의글</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/qnaList"
                            target="_self"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">상품문의</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/faqList"
                            target="_self"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">faq</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                            target="_blank"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">공지사항</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Search -->
                    <div class="navbar-nav align-items-center">
                        <div class="nav-item d-flex align-items-center">
                            <i class="bx bx-search fs-4 lh-0"></i>
                            <input
                                    type="text"
                                    class="form-control border-0 shadow-none"
                                    placeholder="Search..."
                                    aria-label="Search..."
                            />
                        </div>
                    </div>
                    <!-- /Search -->

                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Place this tag where you want the button to render. -->
                        <li class="nav-item lh-1 me-3">
                            <a
                                    class="github-button"
                                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                                    data-icon="octicon-star"
                                    data-size="large"
                                    data-show-count="true"
                                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                            >Star</a
                            >
                        </li>

                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="/resources/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="/resources/resources//assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-semibold d-block">John Doe</span>
                                                <small class="text-muted">Admin</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="bx bx-user me-2"></i>
                                        <span class="align-middle">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="bx bx-cog me-2"></i>
                                        <span class="align-middle">Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="auth-login-basic.html">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">커뮤니티 /</span> FAQ</h4>

                    <form role="search" id="frmSearch">
                        <div class="col">
                            <label for="qna_select">문의 유형</label>
                            <select id="qna_select" name="qna_select" onchange="goSearch()" class="border-0 form-select-sm bg-light me-3">
                                <option value="">전체</option>
                                <option value="상품문의" <c:if test="${qnaList.qna_select eq '상품문의'}"> selected</c:if>>상품문의</option>
                                <option value="주문문의" <c:if test="${qnaList.qna_select eq '주문문의'}"> selected</c:if>>주문문의</option>
                                <option value="배송문의" <c:if test="${qnaList.qna_select eq '배송문의'}"> selected</c:if>>배송문의</option>
                                <option value="기타" <c:if test="${qnaList.qna_select eq '기타'}"> selected</c:if>>기타</option>
                            </select>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">검색 범위</label>
                            <div class="col-sm-2">
                                <input class="form-check-input" type="checkbox" name="search_type" id="search_type1" value="c" <c:if test="${qnaList['search_type_string'].contains('c')}">checked</c:if>>
                                <label class="form-check-label" for="search_type1">질문내용</label>
                                <input class="form-check-input" type="checkbox" name="search_type" id="search_type2" value="a" <c:if test="${qnaList['search_type_string'] != 'null' && qnaList['search_type_string'].contains('a')}">checked</c:if>>
                                <label for="search_type2">답변</label>
                            </div>
                            <div class="col">
                                <input class="form-check-label" type="search" name="search_word"  id="search_word" placeholder="Search" aria-label="Search" value="${qnaList.search_word}">
                            </div>


                            <div class="col-sm-2">
                                <button class="btn btn-outline-success" id="btnSearch" type="submit">Search</button>
                                <button class="btn btn-outline-success" id="btnReset" type="reset" onclick="location.href='/faq/view'">reset</button>
                            </div>
                        </div>
                    </form>

                    <!-- Header -->

                    <!--/ Header -->

                    <!-- Navbar pills -->


                    <!--/ Navbar pills -->

                    <!-- User Profile Content -->
                    <form action="/faq/delete" method="get">

                        <div class="col-md-12">

                            <%--                        <div class="col-xl-4 col-lg-5 col-md-5">--%>
                            <!-- About User -->
                            <div class="card mb-4">
                                <h5 class="card-header">FAQ</h5>
                                <div class="card-body">
                                    <br>
                                    <span>
                                    <span class="notificationRequest"><strong></strong></span></span>
                                    <div class="error"></div>
                                </div>


                                <div class="table-responsive">
                                    <table class="table no-wrap striped">
                                        <thead>
                                        <tr>

                                            <th><input type="checkbox" id="chkAll" name="chkAll"/>
                                                <label for="chkAll"><span></span>전체선택</label></th>

                                            <th>번호</th>
                                            <th>내용</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0">

                                        <c:forEach items="${qnaList.dtoList}" var="dto" varStatus="status">
                                            <tr class="accordion-header" id="heading${status.count}">


                                                <td><input type="checkbox" id="${dto.qna_idx }" name="qna_idx"
                                                           value="${dto.qna_idx }"/>
                                                    <label for="${dto.qna_idx }"><span></span></label></td>


                                                <td class="text-nowrap">${qnaList.total_count - ((qnaList.page-1)*qnaList.page_size + (status.count-1))}</td>
                                                <td class="text-nowrap">${dto.qna_content}</td>
                                                <td>
                                                    <button type="button" class="accordion-button collapsed"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#accordion${status.count}"
                                                            aria-expanded="false"
                                                            aria-controls="accordion${status.count}"></button>
                                                </td>
                                            </tr>
                                            <tr id="accordion${status.count}" class="accordion-collapse collapse"
                                                aria-labelledby="heading${status.count}"
                                                data-bs-parent="#accordionExample">

                                                <td></td>

                                                <td><a><i class="fa-solid fa-arrow-right"></i></a></td>
                                                <td class="text-nowrap"><strong><textarea style="resize:none;" rows="6" class="form-control">${dto.qna_answer}</textarea></strong>
                                                </td>
                                                <td>


                                                    <button type="submit" class="btn p-0  hide-arrow"
                                                            onclick="location.href='/faq/modify?qna_idx=${dto.qna_idx}'"
                                                            data-bs-toggle="dropdown">
                                                        <i class="bx bx-edit me-2"></i>
                                                    </button>


                                                </td>

                                            </tr>

                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!--/ About User -->
                        <!-- Profile Overview -->


                        <div class="row">
                            <div class="col">
                            </div>
                            <div class="col">
                            </div>
                            <div class="col">
                            </div>
                            <div class="col">
                            </div>
                            <div class="col">
                            </div>
                            <div class="col">

                                <button type="button" class="btn btn-sm btn-primary" onclick="location.href='/faq/write'">글 등록
                                </button>
                                <button type="submit" class="btn btn-sm btn-danger" id="btnDelete">삭제</button>

                            </div>
                        </div>
                    </form>
                    <div class="col">
                        <div class="demo-inline-spacing">
                            <!-- Basic Square Pagination -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-round pagination-primary  d-flex justify-content-center">
                                    <li class="page-item <c:if test="${qnaList.prev_page_flag ne true}"> disabled</c:if> first">
                                        <a class="page-link"
                                           data-num="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                           href="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i
                                                class="tf-icon bx bx-chevrons-left"></i></a>
                                    </li>
                                    <li class="page-item prev">
                                        <a class="page-link"
                                           href="<c:choose><c:when test="${qnaList.page <= qnaList.page_block_start}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${qnaList.page-1}</c:otherwise></c:choose>"><i
                                                class="tf-icon bx bx-chevron-left"></i></a>
                                    </li>
                                    <c:forEach begin="${qnaList.page_block_start}"
                                               end="${qnaList.page_block_end}"
                                               var="page_num">
                                        <li class="page-item<c:if test="${qnaList.page == page_num}"> active</c:if>">
                                            <a class="page-link" data-num="${page_num}"
                                               href="<c:choose><c:when test="${qnaList.page == page_num}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item prev">
                                        <a class="page-link"
                                           href="<c:choose><c:when test="${qnaList.page >= qnaList.page_block_end}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${qnaList.page + 1}</c:otherwise></c:choose>"><i
                                                class="tf-icon bx bx-chevron-right"></i></a>
                                    </li>
                                    <li class="page-item <c:if test="${qnaList.next_page_flag ne true}"> disabled</c:if> last">
                                        <a class="page-link"
                                           data-num="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.page_block_end+1}</c:when><c:otherwise>${qnaList.page_block_end}</c:otherwise></c:choose>"
                                           href="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i
                                                class="tf-icon bx bx-chevrons-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                            <!--/ Basic Square Pagination -->
                        </div>
                    </div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>


        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/be97bd8e1b.js" crossorigin="anonymous"></script>
<script>
    let frm = document.querySelector("#frm");
    let chkAll = document.querySelector("#chkAll");
    // 체크박스 전체 선택/해제
    chkAll.addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']");

        check.forEach((checkbox) => {
            checkbox.checked = chkAll.checked;
        });
    });

    // 삭제 버튼 눌렀을 때
    document.querySelector("#btnDelete").addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']:checked");
        console.log(check);
        if (check.length == 0) {
            alert("하나 이상 선택하세요.");
            e.preventDefault();
            return false;
        } else {
            let deleteOk = confirm("삭제 하시겠습니까?");
            if (deleteOk) {

                console.log(check);
                frm.submit();

            } else {
                e.preventDefault();
                return false;
            }
        }
    });
    //문의유형
    function goSearch() {
        const frmSearch = document.getElementById("frmSearch");
        frmSearch.submit();
    }
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