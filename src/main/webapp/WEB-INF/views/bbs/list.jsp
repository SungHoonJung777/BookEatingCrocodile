<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>게시글 목록</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .opacity-50 { opacity: .5; }
        .opacity-75 { opacity: .75; }

        .list-group {
            width: auto;
            max-width: 460px;
            margin: 4rem auto;
        }

        .form-check-input:checked + .form-checked-content {
            opacity: .5;
        }

        .form-check-input-placeholder {
            pointer-events: none;
            border-style: dashed;
        }
        [contenteditable]:focus {
            outline: 0;
        }

        .list-group-checkable {
            display: grid;
            gap: .5rem;
            border: 0;
        }
        .list-group-checkable .list-group-item {
            cursor: pointer;
            border-radius: .5rem;
        }
        .list-group-item-check {
            position: absolute;
            clip: rect(0, 0, 0, 0);
            pointer-events: none;
        }
        .list-group-item-check:hover + .list-group-item {
            background-color: var(--bs-light);
        }
        .list-group-item-check:checked + .list-group-item {
            color: #fff;
            background-color: var(--bs-blue);
        }
        .list-group-item-check[disabled] + .list-group-item,
        .list-group-item-check:disabled + .list-group-item {
            pointer-events: none;
            filter: none;
            opacity: .5;
        }

    </style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<%--    <ul>--%>
<%--        <c:forEach items="${bbsList}" var="dto">--%>
<%--            <li><a href="/bbs/view?idx=${dto.idx}"><c:out value="${dto}"/></a></li>--%>
<%--        </c:forEach>--%>
<%--    </ul>--%>
<%--    <div class="container" >--%>
<%--        <div>${loginInfo.name}님, 환영합니다!</div>--%>
<%--        <ul class="list-group list-group-flush">--%>
<%--            <c:forEach items="${bbsList}" var="dto">--%>
<%--                <li class="list-group-item"><a href="/bbs/view?idx=${dto.idx}"><c:out value="${dto}"/></a></li>--%>
<%--            </c:forEach>--%>

<%--        </ul>--%>
<%--    </div>--%>
    <div class="container">
        <c:if test="${not empty loginInfo.user_id}">
            <div>${loginInfo.user_id}님, 환영합니다!</div>
            <p></p>
        </c:if>

        <form role="search" id="frmSearch">
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">검색 범위</label>
                <div class="col-sm-2">
                    <input class="form-check-input" type="checkbox" name="search_type" id="search_type1" value="t" <c:if test="${responseDTO['search_type_string'].contains('t')}">checked</c:if>>
                    <label class="form-check-label" for="search_type1">제목</label>
                    <input class="form-check-input" type="checkbox" name="search_type" id="search_type2" value="u" <c:if test="${responseDTO['search_type_string'] != 'null' && responseDTO['search_type_string'].contains('u')}">checked</c:if>>
                    <label for="search_type2">작성자</label>
                </div>
                    <div class="col">
                    <input class="form-check-label" type="search" name="search_word"  id="search_word" placeholder="Search" aria-label="Search" value="${responseDTO.search_word}">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">검색 기간</label>
                <div class="col-sm-2">
                <input type="date" class="form-control" name="search_date1" id="search_date1" value="${responseDTO.search_date1}">
                </div>
                <div class="col-sm-2">
                   <span class="justify-content-center">~</span>
                </div>
                <div class="col-sm-2">
                    <input type="date" class="form-control" name="search_date2" id="search_date2" value="${responseDTO.search_date2}">
                </div>

            <div class="col-sm-2">
                <button class="btn btn-outline-success" type="submit">Search</button>
                <button class="btn btn-outline-success" id="btnReset" type="reset" onclick="location.href='/bbs/list'">reset</button>
            </div>
            </div>
        </form>

        <c:forEach items="${responseDTO.dtoList}" var="dto" varStatus="status">
        <a href="/bbs/view?${responseDTO.linkParams}&page=${responseDTO.page}&idx=${dto.idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <div>${responseDTO.total_count - ((responseDTO.page-1)*responseDTO.page_size + (status.count-1))}</div>
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
                <div>
                    <h6 class="mb-0">${dto.title}</h6>
                    <h6 class="mb-0 opacity-75">작성자 : ${dto.user_id}</h6>
                    <p class="mb-0 opacity-75">${dto.content}</p>
                </div>
                <small class="opacity-50 text-nowrap">${dto.display_date}</small>
            </div>
        </a>
        </c:forEach>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item<c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
                    <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
                    <a class="page-link"
                       data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                       href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>
                </li>
                <c:forEach begin="${responseDTO.page_block_start}"
                           end="${responseDTO.page_block_end}"
                           var="page_num">
                    <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if>">
                        <a class="page-link" data-num="${page_num}"
                           href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                    </li>
                </c:forEach>
                <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                    <a class="page-link"
                       data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                       href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
                </li>
            </ul>
        </nav>

        <div class="row footer">
            <!--h1>Footer</h1-->
            <div class="row fixed-=bottom" style="z-index: -100">
                <footer class="py-1 my-1">
                    <p class="text-center text-muted">@Copyright rim</p>
                </footer>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>
