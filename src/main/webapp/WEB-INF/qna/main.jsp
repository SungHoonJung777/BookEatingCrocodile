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
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>QnA 게시판</title>

    <meta name="description" content=""/>

    <!-- Favicon -->


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
    <link rel="stylesheet" href="/resources/resources/vendor/css/theme-default.css"
          class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

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

    </style>

</head>

<body id="body">
<jsp:include page="../common/header.jsp"/>
<!-- Layout wrapper -->
<%--<div class="layout-wrapper layout-content-navbar">--%>

<div class="container">

    <div class="layout-container layout-content-navbar">
        <!-- Menu -->


        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">커뮤니티 /</span> QnA</h4>

                    <form role="search" id="frmSearch">
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">검색 범위</label>
                            <div class="col-sm-2">
                                <div style="display: none">
                                    <select name="sortDir" onchange="goList()" class="border-0 form-select-sm bg-light me-3">
                                        <option value="">선택</option>
                                        <option value="DESC" <c:if test="${qnaList.sortDir eq 'DESC'}"> selected</c:if>>최신순</option>
                                        <option value="ASC" <c:if test="${qnaList.sortDir eq 'ASC'}"> selected</c:if>>오래된순</option>
                                    </select>
                                </div>
                                <input class="form-check-input" type="checkbox" name="search_type" id="search_type1" value="t" <c:if test="${qnaList['search_type_string'].contains('t')}">checked</c:if>>
                                <label class="form-check-label" for="search_type1">제목</label>
                                <input class="form-check-input" type="checkbox" name="search_type" id="search_type3" value="c" <c:if test="${qnaList['search_type_string'].contains('c')}">checked</c:if>>
                                <label class="form-check-label" for="search_type3">질문내용</label><br>
                                <input class="form-check-input" type="checkbox" name="search_type" id="search_type2" value="u" <c:if test="${qnaList['search_type_string'] != 'null' && qnaList['search_type_string'].contains('u')}">checked</c:if>>
                                <label for="search_type2">작성자</label>
                            </div>
                            <div class="col">
                                <input class="form-check-label" type="search" name="search_word"  id="search_word" placeholder="Search" aria-label="Search" value="${qnaList.search_word}">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">검색 기간</label>
                            <div class="col-sm-2">
                                <input type="date" class="form-control" name="search_date1" id="search_date1" value="${qnaList.search_date1}">
                            </div>
                            <div class="col-sm-2">
                                <span class="justify-content-center">~</span>
                            </div>
                            <div class="col-sm-2">
                                <input type="date" class="form-control" name="search_date2" id="search_date2" value="${qnaList.search_date2}">
                            </div>

                            <div class="col-sm-2">
                                <button class="btn btn-outline-success" id="btnSearch" type="submit">Search</button>
                                <button class="btn btn-outline-success" id="btnReset" type="reset" onclick="location.href='/qna/main'">reset</button>
                            </div>
                        </div>

                    </form>

                    <form id="frmSort">
                        <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                            <div style="display: none">
                            <input class="form-check-input" type="checkbox" name="search_type"  value="t" <c:if test="${qnaList['search_type_string'].contains('t')}">checked</c:if>>
                            <input class="form-check-input" type="checkbox" name="search_type"  value="c" <c:if test="${qnaList['search_type_string'].contains('c')}">checked</c:if>>
                            <input class="form-check-input" type="checkbox" name="search_type" value="u" <c:if test="${qnaList['search_type_string'] != 'null' && qnaList['search_type_string'].contains('u')}">checked</c:if>>
                            </div>
                            <input type="hidden" name="search_word" value="${qnaList.search_word}">
                            <input type="hidden" name="search_date1" value="${qnaList.search_date1}">
                            <input type="hidden"  name="search_date2"  value="${qnaList.search_date2}">
                            <label for="sortMethod">정렬 순서:</label>
                            <select id="sortMethod" name="sortDir" onchange="goList()" class="border-0 form-select-sm bg-light me-3">
                                <option value="">선택</option>
                                <option value="DESC" <c:if test="${qnaList.sortDir eq 'DESC'}"> selected</c:if>>최신순</option>
                                <option value="ASC" <c:if test="${qnaList.sortDir eq 'ASC'}"> selected</c:if>>오래된순</option>
                            </select>
                        </div>
                    </form>

                    <div class="row">
                        <form action="/qna/delete" method="get">
                            <div class="col-md-12">
                                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                    <li class="nav-item">
                                        QnA
                                    </li>

                                </ul>

                                <div class="card mb-4">
                                    <!-- Notifications -->
                                    <h5 class="card-header">상품 문의/답변</h5>
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
                                                <c:if test="${loginInfo.member_id eq 'admin'}">
                                                    <th><input type="checkbox" id="chkAll" name="chkAll"/>
                                                        <label for="chkAll"><span></span>전체선택</label></th>
                                                </c:if>
                                                <th>번호</th>
                                                <th>문의 제목</th>
                                                <th>작성자</th>
                                                <th>답변상태</th>
                                                <th>등록일</th>
                                                <th>조회수</th>
                                            </tr>
                                            </thead>
                                            <tbody class="table-border-bottom-0">

                                            <c:forEach items="${qnaList.dtoList}" var="dto" varStatus="status">
                                                <tr>
                                                    <c:if test="${loginInfo.member_id eq 'admin'}">
                                                        <td><input type="checkbox" id="${dto.qna_idx }" name="qna_idx"
                                                                   value="${dto.qna_idx }"/>
                                                            <label for="${dto.qna_idx }"><span></span></label></td>
                                                    </c:if>
                                                    <td class="text-nowrap">${qnaList.total_count - ((qnaList.page-1)*qnaList.page_size + (status.count-1))}</td>
                                                    <td class="text-nowrap"><a
                                                            href="/qna/view?qna_idx=${dto.qna_idx}">${dto.qna_title}</a>
                                                    </td>
                                                    <td class="text-nowrap">${dto.member_id}</td>


                                                    <c:choose>
                                                        <c:when test="${dto.qna_answer_YN eq 'Y'}">

                                                            <td class="text-nowrap"><span
                                                                    class="badge bg-label-success me-1">답변완료</span></td>
                                                            <td class="text-nowrap">${fn:substring(dto.qna_reg_date, 0, 10)} ${fn:substring(dto.qna_reg_date, 11, 20)}</td>
                                                            <td class="text-nowrap">${dto.qna_view_cnt}</td>

                                                        </c:when>
                                                        <c:otherwise>

                                                            <td><span class="badge bg-label-warning me-1">답변대기</span>
                                                            </td>
                                                            <td class="text-nowrap">${fn:substring(dto.qna_reg_date, 0, 10)} ${fn:substring(dto.qna_reg_date, 11, 20)}</td>
                                                            <td class="text-nowrap">${dto.qna_view_cnt}</td>

                                                        </c:otherwise>
                                                    </c:choose>

                                                </tr>
                                                <c:if test="${dto.qna_answer_YN eq 'Y'}">
                                                    <tr>
                                                        <td></td>
                                                        <td class="text-nowrap"><span class="badge bg-label-info me-1">답변</span>
                                                        </td>
                                                        <td class="text-nowrap">
                                                            <c:set var="answer" value="${dto.qna_answer}"/>
                                                            <c:choose>
                                                                <c:when test="${fn:length(answer) > 10}">
                                                                    <a href="/qna/view?qna_idx=${dto.qna_idx}"><strong>${fn:substring(answer, 0, 10)}</strong></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="/qna/view?qna_idx=${dto.qna_idx}"><strong>${dto.qna_answer}</strong></a>
                                                                </c:otherwise>
                                                            </c:choose>


                                                        </td>
                                                        <td class="text-nowrap"><strong>관리자</strong></td>
                                                        <c:if test="${sessionScope.member_id eq 'admin'}">
                                                            <td></td>
                                                        </c:if>
                                                        <td>
                                                            <strong>${fn:substring(dto.qna_answer_date, 0, 10)} ${fn:substring(dto.qna_answer_date, 11, 20)}</strong>
                                                        </td>
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
                                    <c:if test="${not empty sessionScope.member_id}">
                                        <button type="button" class="btn btn-sm btn-primary" onclick="location.href='/qna/write'">글등록</button>
                                    </c:if>
                                    <c:if test="${sessionScope.member_id eq 'admin'}">
                                        <button type="submit" class="btn btn-sm btn-danger" id="btnDelete">삭제</button>
                                    </c:if>
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
                </div>


            </div>

        </div>


    </div>


</div>

<jsp:include page="../common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

    //정렬
    function goList() {
        const frmSort = document.getElementById("frmSort");
        frmSort.submit();
    }

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

    //검색버튼 눌렀을 때

</script>
</body>
</html>
