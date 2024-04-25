<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오후 4:27
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

    <title>회원정보 수정</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">

    <form id="frmRegist" name="frmRegist" method="post" action="/member/modify">
        <div class="row mb-3">
            <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" readonly id="user_id" name="user_id" value="${memberDTO.user_id}">
                <div id="div_err_user_id" style="display: none"></div>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="pwd" name="pwd" value="${memberDTO.pwd}">
                <div id="div_err_pwd" style="display: none"></div>
            </div>
        </div>
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="${memberDTO.name}">
                <div id="div_err_name" style="display: none"></div>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pwd" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" readonly name="email" value="${memberDTO.email}">
                <div id="div_err_email" style="display: none"></div>
            </div>
        </div>

        <div class="row mb-3">
            <label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
            <div class="col-sm-10">
                <input type="date" class="form-control "  id="birthday" name="birthday" value="${memberDTO.birthday}" >
                <div id="div_err_birthday" style="display: none"></div>
            </div>
        </div>
        <div class="row mb-3">
            <label for="addr1" class="col-sm-2 col-form-label">주소1</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="addr1"  name="addr1" onclick="address();" value="${memberDTO.addr1}">
                <div id="div_err_addr1" style="display: none"></div>
            </div>
        </div>
        <div class="row mb-3">
            <label for="addr2" class="col-sm-2 col-form-label">주소2</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="addr2" name="addr2" value="${memberDTO.addr2}">
                <div id="div_err_addr2" style="display: none"></div>
            </div>
        </div>

        <label  class="col-sm-2 col-form-label">관심사항</label>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="interest_0" name="interest" value="스포츠" <c:if test="${memberDTO.interest.contains('스포츠')}">checked</c:if>>
            <label class="form-check-label" for="interest_0">
                스포츠
            </label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox"  id="interest_1" name="interest" value="여행"  <c:if test="${memberDTO.interest.contains('여행')}">checked</c:if>>
            <label class="form-check-label" for="interest_1">
                여행
            </label>
        </div>


        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="interest_2" name="interest" value="영화"  <c:if test="${memberDTO.interest.contains('영화')}">checked</c:if>>
            <label class="form-check-label" for="interest_2">
                영화
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="interest_3" name="interest" value="음악"  <c:if test="${memberDTO.interest.contains('음악')}">checked</c:if>>
            <label class="form-check-label" for="interest_3">
                음악
            </label>
        </div>

        <div id="div_err_interest" style="display: none"></div>

        <div class="my-4">
            <div class="float-end">
                <button type="submit" class="btn btn-primary">수정</button>
                <button type="reset" class="btn btn-outline-secondary" onclick="location.href='/member/view?user_id=${memberDTO.user_id}'">돌아가기</button>
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

<script>
    function address() {
        let addr1 = document.getElementById("addr1");
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                addr1.value = data.roadAddress;
            }
        }).open();
    }

</script>

</body>
</html>
