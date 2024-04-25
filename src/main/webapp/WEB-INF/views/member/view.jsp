<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="utf-8">
    <title>회원정보 조회</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
    <form name="frmDelete" id="frmDelete" method="post" action="/member/delete">
        <input type="hidden" name="user_id" value="${loginInfo.user_id}">
        <table class="table" height="20%">
            <tbody>
            <tr>
                <th scope="row" >아이디</th>
                <td > ${memberDTO.user_id}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">이름</th>
                <td> ${memberDTO.name}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">이메일</th>
                <td>${memberDTO.email}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">생년월일</th>
                <td> ${memberDTO.birthday}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td> ${memberDTO.addr1}&nbsp;${memberDTO.addr2}</td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <th scope="row">관심사항</th>
                <td> ${memberDTO.interest}</td>
                <td> </td>
                <td> </td>
            </tr>
            </tbody>
        </table>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='/bbs/list'">목록</button>

                <button type="button" class="btn btn-primary" onclick="location.href='/member/modify?user_id=${memberDTO.user_id}'">수정</button>
                <button type="button" class="btn btn-danger" onclick="goDelete();">회원탈퇴</button>

        </div>

    </form>
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
        let confirm_flag = confirm("탈퇴 하시겠습니까?\n");
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