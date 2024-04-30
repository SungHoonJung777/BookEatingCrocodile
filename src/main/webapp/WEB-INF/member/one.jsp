<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>1:1 게시판</title>

    <meta name="description" content="" />

    <!-- Favicon -->


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
        #paging{

            display:flex !important;
        }

    </style>

</head>

<body id="body">
<jsp:include page="../common/header.jsp"/>
<!-- Layout wrapper -->
<%--<div class="layout-wrapper layout-content-navbar">--%>

<div class="container">

    <div class="layout-container layout-content-navbar">
        <!-- Menu -->
        <jsp:include page="nav.jsp"/>

        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">마이페이지 /</span> 1:1 문의</h4>

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                <li class="nav-item">
                                    <i class="bx bx-user me-1"></i> 1:1
                                </li>

                            </ul>
                            <div class="card mb-4">
                                <!-- Notifications -->
                                <h5 class="card-header">1:1 문의/답변</h5>
                                <div class="card-body">
                                    <br>
                                  <span>
                                    <span class="notificationRequest"><strong>답변이 달린 문의글은 수정/삭제가 불가능 합니다.</strong></span></span>
                                    <div class="error"></div>

                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                        <tr>
                                            <td colspan="5"></td>
                                            <td ><button class="btn btn-sm btn-primary" onclick="location.href='/one/write'">문의글 등록</button></td>
                                        </tr>
                                        <tr>
                                            <th>번호</th>
                                            <th>주문번호</th>
                                            <th>작성자</th>
                                            <th>답변상태</th>
                                            <th>등록일</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0">

                                        <c:forEach items="${qnaList.dtoList}" var="dto" varStatus="status">
                                            <tr>
                                            <td class="text-nowrap">${qnaList.total_count - ((qnaList.page-1)*qnaList.page_size + (status.count-1))}</td>
                                                 <td class="text-nowrap"><a href="/one/view?qna_idx=${dto.qna_idx}">${dto.qna_title}</a></td>
                                            <td class="text-nowrap">${dto.member_id}</td>


                                                <c:choose>
                                                    <c:when test="${dto.qna_answer_YN eq 'Y'}">

                                                       <td class="text-nowrap"><span class="badge bg-label-success me-1">답변완료</span></td>
                                                        <td class="text-nowrap">${fn:substring(dto.qna_reg_date, 0, 10)} ${fn:substring(dto.qna_reg_date, 11, 20)}</td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:otherwise>

                                                       <td> <span class="badge bg-label-warning me-1">답변대기</span></td>
                                                        <td class="text-nowrap">${fn:substring(dto.qna_reg_date, 0, 10)} ${fn:substring(dto.qna_reg_date, 11, 20)}</td>
                                                        <td class="text-nowrap">
                                                            <div class="dropdown">
                                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a class="dropdown-item" href="/one/modify?qna_idx=${dto.qna_idx}"><i class="bx bx-edit-alt me-2"></i> Edit</a>
                                                                    <a class="dropdown-item" id="deleteA" onclick="qnaDelete(${dto.qna_idx})" ><i class="bx bx-trash me-2"></i> Delete</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>

                                            </tr>
                                            <c:if test="${dto.qna_answer_YN eq 'Y'}">
                                                <tr>
                                                    <td class="text-nowrap"><span class="badge bg-label-info me-1">답변</span></td>
                                                    <td class="text-nowrap">
                                                        <c:set var="answer" value="${dto.qna_answer}" />
                                                        <c:choose>
                                                            <c:when  test="${fn:length(answer) > 10}">
                                                                <a href="/one/view?qna_idx=${dto.qna_idx}"><strong>${fn:substring(answer, 0, 10)}</strong></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="/one/view?qna_idx=${dto.qna_idx}"><strong>${dto.qna_answer}</strong></a>
                                                            </c:otherwise>
                                                        </c:choose>


                                                    </td>
                                                    <td class="text-nowrap"><strong>관리자</strong></td>
                                                    <td></td>
                                                    <td><strong>${fn:substring(dto.qna_answer_date, 0, 10)} ${fn:substring(dto.qna_answer_date, 11, 20)}</strong></td>
                                                    <td></td>
                                                </tr>
                                            </c:if>


                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div>





                                <!-- /Account -->
                            </div>

                        </div>
                        <div class="col">
                            <div class="demo-inline-spacing ">
                                <!-- Basic Square Pagination -->
                                <nav aria-label="Page navigation " >
                                    <ul class="pagination pagination-round pagination-primary d-flex justify-content-center">
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
                                            <a class="page-link" data-num="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.page_block_end+1}</c:when><c:otherwise>${qnaList.page_block_end}</c:otherwise></c:choose>"
                                               href="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i class="tf-icon bx bx-chevrons-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                                <!--/ Basic Square Pagination -->
                            </div>
                        </div>
                    </div>
                </div>



            </div>

        </div>


    </div>


</div>

<jsp:include page="../common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function qnaDelete(qna_idx) {
        let yn = confirm("문의글을 삭제 하시겠습니까?");
        if (yn) {
            location.href="/one/delete?qna_idx="+qna_idx;
        }
        location.href="#";
    }
</script>
</body>
</html>
