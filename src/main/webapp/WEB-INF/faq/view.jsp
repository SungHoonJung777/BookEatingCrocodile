<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <title>FAQ</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <%--    <link rel="icon" type="image/x-icon" href="/resources/resources/assets/img/favicon/favicon.ico" />--%>

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
    <style>
        #body {
            margin-top: 180px;
        }
        .hiddenRow {
            padding: 0 !important;
        }

    </style>

</head>
<jsp:include page="../common/header.jsp"/>
<body id="body">

<!-- Layout wrapper -->
<div class="container">
    <div class="layout-container">
        <!-- Menu -->


        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">


                    <h4 class="py-3 mb-4">
                        <span class="text-muted fw-light">커뮤니티 /</span> FAQ
                    </h4>


                    <!-- Header -->

                    <!--/ Header -->

                    <!-- Navbar pills -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-sm-row mb-4">

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



                                <div class="table-responsive">
                                    <table class="table no-wrap striped">
                                        <thead>
                                        <tr >
                                            <td colspan="2"></td>
                                            <td >
                                                <c:if test="관리자">
                                                    <button class="btn btn-sm btn-primary" onclick="location.href='/faq/write'">글 등록</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>번호</th>
                                            <th>내용</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0">

                                        <c:forEach items="${qnaList.dtoList}" var="dto" varStatus="status">
                                            <tr class="accordion-header" id="heading${status.count}">
                                                <td class="text-nowrap">${qnaList.total_count - ((qnaList.page-1)*qnaList.page_size + (status.count-1))}</td>
                                                <td class="text-nowrap">${dto.qna_title}</td>
                                                <td>
                                                    <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordion${status.count}" aria-expanded="false" aria-controls="accordion${status.count}"></button>
                                                </td>
                                            </tr>
                                            <tr id="accordion${status.count}" class="accordion-collapse collapse" aria-labelledby="heading${status.count}" data-bs-parent="#accordionExample">
                                                <td ><a><i class="fa-solid fa-arrow-right"></i></a></td>
                                                <td class="text-nowrap"><strong><textarea style="resize:none;" class="form-control">${dto.qna_answer}</textarea></strong></td>
                                                <td>
<%--                                                    <c:if test="관리자">--%>
                                                        <button type="submit" class="btn p-0  hide-arrow" onclick="location.href='/faq/modify?qna_idx=${dto.qna_idx}'"  data-bs-toggle="dropdown">
                                                            <i class="bx bx-edit me-2"></i>
                                                        </button>
<%--                                                    </c:if>--%>
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

                    </div>
                    <div class="col">
                        <div class="demo-inline-spacing">
                            <!-- Basic Square Pagination -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-round pagination-primary  d-flex justify-content-center">
                                    <li class="page-item <c:if test="${qnaList.prev_page_flag ne true}"> disabled</c:if> first">
                                        <a class="page-link"
                                           data-num="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                           href="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i class="tf-icon bx bx-chevrons-left"></i></a>
                                    </li>
                                    <li class="page-item prev">
                                        <a class="page-link" href="<c:choose><c:when test="${qnaList.page <= qnaList.page_block_start}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${qnaList.page-1}</c:otherwise></c:choose>"><i class="tf-icon bx bx-chevron-left"></i></a>
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
                                        <a class="page-link" href="<c:choose><c:when test="${qnaList.page >= qnaList.page_block_end}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${qnaList.page + 1}</c:otherwise></c:choose>"><i class="tf-icon bx bx-chevron-right"></i></a>
                                    </li>
                                    <li class="page-item <c:if test="${qnaList.next_page_flag ne true}"> disabled</c:if> last">
                                        <a class="page-link"data-num="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.page_block_end+1}</c:when><c:otherwise>${qnaList.page_block_end}</c:otherwise></c:choose>"
                                           href="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i class="tf-icon bx bx-chevrons-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                            <!--/ Basic Square Pagination -->
                        </div>
                    </div>
                </div>
                <!--/ User Profile Content -->

            </div>
            <!-- / Content -->

            <!-- Footer -->

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


<jsp:include page="../common/footer.jsp"/>
<script src="https://kit.fontawesome.com/be97bd8e1b.js" crossorigin="anonymous"></script>
<script>


</script>
</body>
</html>