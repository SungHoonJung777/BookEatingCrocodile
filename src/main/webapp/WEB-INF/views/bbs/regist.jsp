<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <title>게시글 등록</title>

</head>
<body>
<jsp:include page="../header.jsp"/>

    <div class="container">

        <form id="frmRegist" name="frmRegist" method="post" action="/bbs/regist">
            <div class="row mb-3">
                <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="user_id" name="user_id" readonly value="${loginInfo.user_id}">
                    <div id="div_err_user_id" style="display: none"></div>
                </div>
            </div>
            <div class="row mb-3">
                <label for="title" class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" value="${bbsDTO.title}">
                    <div id="div_err_title" style="display: none"></div>
                </div>
            </div>
            <div class="row mb-3">
                <label for="content" class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                    <textarea  class="form-control" name="content" id="content" rows="10" cols="60">${bbsDTO.content}</textarea>
                    <div id="div_err_content" style="display: none"></div>
                </div>
            </div>
            <div class="row mb-3">
                <label for="display_date" class="col-sm-2 col-form-label">출력날짜</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control"  id="display_date" name="display_date" value="${bbsDTO.display_date}" ></input>
                </div>
            </div>

            <label  class="col-sm-2 col-form-label">관심사항</label>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="interest_0" name="interest" value="스포츠" <c:if test="${bbsDTO.interest.contains('스포츠')}">checked</c:if>>
                        <label class="form-check-label" for="interest_0">
                            스포츠
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox"  id="interest_1" name="interest" value="여행" <c:if test="${bbsDTO.interest.contains('여행')}">checked</c:if>>
                        <label class="form-check-label" for="interest_1">
                            여행
                        </label>
                    </div>


                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="interest_2" name="interest" value="영화" <c:if test="${bbsDTO.interest.contains('영화')}">checked</c:if>>
                        <label class="form-check-label" for="interest_2">
                            영화
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="interest_3" name="interest" value="음악" <c:if test="${bbsDTO.interest.contains('음악')}">checked</c:if>>
                        <label class="form-check-label" for="interest_3">
                            음악
                        </label>
                    </div>

                <div id="div_err_interest" style="display: none"></div>

            <div class="my-4">
                <div class="float-end">
            <button type="submit" class="btn btn-primary">등록하기</button>
            <button type="reset" class="btn btn-outline-secondary" onclick="location.href='/bbs/list'">돌아가기</button>

                </div>
            </div>
        </form>

    </div>

    <script>
        const serverValidResult = {}; //JSON 객체 빈값으로 선언
        <c:forEach items="${errors}" var="err">
            if (document.getElementById("div_err_${err.getField()}") != null) {
                document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.getField()} 필드는 ${err.defaultMessage}</span>";
                document.getElementById("div_err_${err.getField()}").style.display = "block";
            }
            serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
        </c:forEach>

        console.log(serverValidResult);
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
