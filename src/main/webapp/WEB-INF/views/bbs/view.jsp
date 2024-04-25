<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <title>게시글 상세조회</title>
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="container">
    <c:set var="linkParams">
        <c:forEach items="${paramValues.keySet()}" var="key" varStatus="status">
            <c:if test="${key != 'idx'}"><c:if test="${status.first}">${key}=${param[key]}</c:if><c:if test="${!status.first}">&${key}=${param[key]}</c:if></c:if>
        </c:forEach>
    </c:set>
    <form name="frmDelete" id="frmDelete" method="post" action="/bbs/delete">
        <input type="hidden" name="idx" id = "idx" value="${bbs.idx}">
        <table class="table" height="20%">
            <tbody>
            <tr>
                <th scope="row" >아이디</th>
                <td > ${bbs.user_id}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td> ${bbs.title}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">내용</th>
                <td><textarea class="form-control"  cols="30" rows="10" readonly>${bbs.content}</textarea> </td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">관심사항</th>
                <td> ${bbs.interest}</td>
                <td> </td>
                <td> </td>
            </tr>
            </tbody>
        </table>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='/bbs/list?${linkParams}'">목록</button>
            <c:if test="${bbs.user_id eq loginInfo.user_id}">
            <button type="button" class="btn btn-primary" onclick="location.href='/bbs/modify?idx=${bbs.idx}'">수정</button>
            <button type="button" class="btn btn-danger" onclick="goDelete();">삭제</button>
            </c:if>
        </div>

    </form>

<%--    <c:forEach items="${bbsReply}" var="dto" varStatus="status">--%>
<%--       <div class="list-group-item list-group-item-action d-flex gap-3 py-3">--%>
<%--            <div class="d-flex gap-2 w-100 justify-content-between">--%>
<%--                <div>--%>
<%--                    <h6 class="mb-0">${dto.title}</h6>--%>
<%--                    <h6 class="mb-0 opacity-75">댓글 작성자 : ${dto.user_id}</h6>--%>

<%--                </div>--%>
<%--                <small class="opacity-50 text-nowrap">${dto.reg_date}</small>--%>
<%--            </div>--%>
<%--       </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>

    <div class="mb-3">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">댓글번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록일</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${bbsReply != null}">
                    <c:forEach items="${bbsReply}" var="list" varStatus="status">
                        <tr>
                            <th scope="row">${fn:length(bbsReply) - status.index}</th>
                            <td>${list.title}</td>
                            <td>${list.user_id}</td>
                            <td>${list.reg_date}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">등록된 댓글이 존재하지 않습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>

            <tr>
                <td colspan="4">
                    <form action="/bbsReply/regist" method="post">
                        <input type="hidden" value="${bbs.idx}" id="bbs_idx" name="bbs_idx">
                    <div class="mb-3">
                        <input type="text" class="form-control" readonly name="user_id" id="user_id" value="${loginInfo.user_id}">
                        <input type="text" class="form-control" name="title" id="title" maxlength="100" placeholder="댓글을 입력하세요">
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button class="btn btn-primary me-md-2" type="submit">댓글등록</button>
                        <button class="btn btn-secondary" type="button">취소</button>
                    </div>
                    </form>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

<%--    <form id="frmRegist" name="frmRegist" method="post" action="/bbsReply/regist">--%>
<%--        <div class="row mb-3">--%>
<%--            <label for="user_id" class="col-sm-2 col-form-label">아이디</label>--%>
<%--            <div class="col-sm-10">--%>
<%--                <input type="text" class="form-control" id="user_id" name="user_id" value="">--%>
<%--                <div id="div_err_user_id" style="display: none"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row mb-3">--%>
<%--            <label for="title" class="col-sm-2 col-form-label">댓글내용</label>--%>
<%--            <div class="col-sm-10">--%>
<%--                <input type="text" class="form-control" id="title" name="title" value="">--%>
<%--                <div id="div_err_title" style="display: none"></div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="my-4">--%>
<%--            <div class="float-end">--%>
<%--                <button type="submit" class="btn btn-primary">댓글 등록하기</button>--%>
<%--                <button type="reset" class="btn btn-outline-secondary" onclick="location.href='/bbs/list'">돌아가기</button>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>

    <div class="row footer">
        <!--h1>Footer</h1-->
        <div class="row fixed-=bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">@Copyright rim</p>
            </footer>
        </div>
    </div>
</div>
<script>
    function goDelete() {
        const frm = document.getElementById("frmDelete");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?\n");
        if (confirm_flag) {
            frm.submit();
        }
    }
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossOrigin="anonymous"></script>


</body>
</html>
