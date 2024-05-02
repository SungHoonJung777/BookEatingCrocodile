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
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">커뮤니티 /</span> 문의</h4>

                    <div class="row">
                        <div class="col-xl">

                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0"> 문의</h5>
                                    <small class="text-muted float-end">등록하기</small>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3"></div>
                                    <div class="mb-3">
                                        <label class="form-label"  for="basic-default-fullname">문의 제목</label>
                                        <input type="text" readonly class="form-control" id="qna_title" name="qna_title" value="${qnaDTO.qna_title}"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label"  for="basic-default-fullname">문의 제목</label>
                                        <input type="text" readonly class="form-control" id="qna_select" name="qna_select" value="${qnaDTO.qna_select}"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-fullname">등록일</label>
                                        <input type="text" readonly class="form-control" id="qna_reg_date" name="qna_title" value="${fn:substring(qnaDTO.qna_reg_date, 0, 10)} ${fn:substring(qnaDTO.qna_reg_date, 11, 20)}"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="basic-default-company">문의 내용</label>
                                        <textarea style="resize:none;" class="form-control" rows="10" readonly name="qna_content" id="qna_content" >${qnaDTO.qna_content}</textarea>
                                        <div id="div_err_qna_content" style="display: none"></div>
                                    </div>

                                </div>
                                <div class="card-body">
                                    <form action="/qna/adminWrite" method="post">
                                        <input type="hidden" name="qna_idx" value="${qnaDTO.qna_idx}">
                                        <input type="hidden" name="qna_select" value="${qnaDTO.qna_select}">
                                        <div class="mb-3"></div>

                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-company">답변 내용</label>
                                            <textarea class="form-control" rows="20" cols="10" name="qna_answer" id="qna_answer" >${qnaDTO.qna_answer}</textarea>
                                            <div id="div_err_qna_answer" style="display: none"></div>
                                        </div>

                                        <button type="submit" class="btn btn-primary">등록하기</button>
                                        <button type="reset" class="btn btn-secondary" onclick="location.href='/qna/view?qna_idx=${qnaDTO.qna_idx}'">게시글로 돌아가기</button>
                                    </form>
                                </div>
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
    const serverValidResult = {}; //JSON 객체 빈값으로 선언
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(serverValidResult);

</script>
</body>
</html>
