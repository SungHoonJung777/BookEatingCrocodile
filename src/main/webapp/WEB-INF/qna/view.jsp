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

    <title>1:1 게시판</title>

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

                    <div class="row">
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">${qnaDTO.qna_select}</h5>
                                    <small class="text-muted float-end"></small>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3"></div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-fullname">작성자</label>
                                        <input type="text" readonly class="form-control" id="member_id" name="member_id"
                                               value="${qnaDTO.member_id}"/>
                                    </div>
                                    <input type="hidden" name="qna_category" value="qna">
                                    <div class="mb-3"></div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-fullname">문의 제목</label>
                                        <input type="text" readonly class="form-control" id="qna_title" name="qna_title"
                                               value="${qnaDTO.qna_title}"/>

                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-fullname">등록일</label>
                                        <input type="text" readonly class="form-control" id="qna_reg_date"
                                               name="qna_title"
                                               value="${fn:substring(qnaDTO.qna_reg_date, 0, 10)} ${fn:substring(qnaDTO.qna_reg_date, 11, 20)}"/>

                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-company">문의 내용</label>
                                        <textarea style="resize:none;" class="form-control" readonly name="qna_content"
                                                  rows="10" id="qna_content">${qnaDTO.qna_content}</textarea>

                                    </div>
                                    <c:if test="${qnaDTO.qna_answer_YN eq 'N' and (qnaDTO.member_id eq sessionScope.member_id)}">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="location.href='/qna/modify?qna_idx=${qnaDTO.qna_idx}'">수정하기
                                        </button>
                                        <button type="button" id="deleteA" onclick="qnaDelete(${qnaDTO.qna_idx})"
                                                class="btn btn-danger">글 삭제
                                        </button>

                                    </c:if>
                                    <button type="reset" class="btn btn-secondary" onclick="location.href='/qna/main'">
                                        목록으로
                                    </button>

                                        <c:if test="${qnaDTO.qna_answer_YN eq 'N'}">
                                            <c:if test="${sessionScope.member_id eq 'admin'}">
                                            <button type="button" class="btn btn-primary"
                                                    onclick="location.href='/qna/adminWrite?qna_idx=${qnaDTO.qna_idx}'">
                                                답변달기
                                            </button>
                                        </c:if>
                                    </c:if>
                                </div>

                            </div>
                            <c:if test="${qnaDTO.qna_answer_YN eq 'Y'}">
                                <div class="card mb-4">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">답변</h5>
                                        <small class="text-muted float-end"></small>
                                    </div>
                                    <div class="card-body">
                                        <input type="hidden" name="member_id" value="abc01">
                                        <input type="hidden" name="qna_category" value="one">
                                        <div class="mb-3"></div>

                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-fullname">등록일</label>
                                            <input type="text" readonly class="form-control" id="qna_answer_date"
                                                   name="qna_answer_date"
                                                   value="${fn:substring(qnaDTO.qna_answer_date, 0, 10)} ${fn:substring(qnaDTO.qna_answer_date, 11, 20)}"/>

                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-company">답변 내용</label>
                                            <textarea style="resize:none;" class="form-control" readonly rows="10"
                                                      name="qna_answer" id="qna_answer">${qnaDTO.qna_answer}</textarea>

                                        </div>
                                        <c:if test="${sessionScope.member_id eq 'admin'}">
                                            <button type="button" id="adminDelete" class="btn btn-primary">답변삭제</button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="location.href='/qna/adminWrite?qna_idx=${qnaDTO.qna_idx}'">
                                                답변수정
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
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
    const serverValidResult = {}; //JSON 객체 빈값으로 선언
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(serverValidResult);


    document.getElementById("adminDelete").addEventListener("click", () => {
        let yn = confirm("답변을 삭제 하시겠습니까?");
        if (yn) {
            location.href = "/qna/adminDelete?qna_idx=${qnaDTO.qna_idx}";
        }

    });

    function qnaDelete(qna_idx) {
        let yn = confirm("문의글을 삭제 하시겠습니까?");
        if (yn) {
            location.href = "/qna/delete?qna_idx=" + qna_idx;
        }

    }
</script>
</body>
</html>
