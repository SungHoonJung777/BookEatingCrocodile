<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-04-17
  Time: AM 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .list-item {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }

        .list-item a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        .list-item a:hover {
            color: #007bff;
        }

        .list-item p {
            margin-bottom: 5px;
        }

        .list-item .meta-info {
            font-size: 14px;
            color: #666;
        }

        .pagination {
            justify-content: center;
        }

        .search-area {
            margin-top: 20px;
            text-align: center;
        }

        @media (min-width: 768px) {
            .search-area {
                margin-top: 0;
                text-align: right;
            }
        }

        .pageInfo_area {
            display: inline-block;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
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

        .search_area {
            display: inline-block;
            margin-top: 30px;
            margin-left: 260px;
        }

        .search_area input {
            height: 30px;
            width: 250px;
        }

        .search_area button {
            width: 100px;
            height: 36px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="list-item">
                <c:forEach var="list" items="${list}">
                    <a href="/bbs/view?idx=${list.idx}">idx : ${list.idx}</a> <br>
                    <p>user_id : ${list.user_id}</p>
                    <p>title : ${list.title}</p>
                    <p>content : ${list.content}</p>
                    <p class="meta-info">display_date : ${list.display_date}, read_cnt : ${list.read_cnt}</p>
                </c:forEach>
            </div>
        </div>
    </div>

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
        <div class="dateSearch_wrap">
            <div class="date_area">
                <input type="date" id="startDate" class="startDate" placeholder="연도-월-일" value="">
                <input type="date" id="endDate" class="endDate" placeholder="연도-월-일" value="">
            </div>
        </div>

        <div class="search_wrap">
            <div class="search_area d-flex align-items-center">
                <select name="type" class="form-control mr-2">
                    <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                </select>
                <input type="text" id="keyword" name="keyword" class="form-control mr-2" placeholder="Keyword">
                <button id="searchBtn" class="btn btn-primary">Search</button>
            </div>
        </div>

    </div>
    <form class="moveForm" method="get" id="moveForm">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="startDate" class="startDate" placeholder="연도-월-일" value="">
        <input type="hidden" name="endDate" class="endDate" placeholder="연도-월-일" value="">
    </form>
</div>
<!-- 부트스트랩 및 jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    const moveForm = document.querySelector("#moveForm");
    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        const pageNum = $(this).attr("href");
        moveForm.querySelector("input[name='pageNum']").value = pageNum;
        moveForm.action = "/bbs/list";
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

        let startDate = document.querySelector("#startDate").value;
        let endDate = document.querySelector("#endDate").value;

        moveForm.querySelector("input[name='type']").value = type;
        moveForm.querySelector("input[name='keyword']").value = val;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.querySelector("input[name='startDate']").value = startDate;
        moveForm.querySelector("input[name='endDate']").value = endDate;
        moveForm.submit();
    });
</script>

</body>
</html>
